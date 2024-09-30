# Define the variables for the VPC and Subnets
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet."
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet."
  default     = "10.0.2.0/24"
}

# Create the VPC
resource "aws_vpc" "mohamedVPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mohamedVPC"
  }
}

# Create the Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.mohamedVPC.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

# Create the Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.mohamedVPC.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "us-east-1c"  
  tags = {
    Name = "private_subnet"
  }
}

# Create an Internet Gateway for the VPC
resource "aws_internet_gateway" "mohamed_internet_gateway" {
  vpc_id = aws_vpc.mohamedVPC.id
  tags = {
    Name = "mohamed_internet-gateway"
  }
}

# Create a Route Table for the Public Subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.mohamedVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mohamed_internet_gateway.id
  }

  tags = {
    Name = "Traffic-Route"
  }
}

# Associate the Public Route Table with the Public Subnet
resource "aws_route_table_association" "Traffic-Route" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_route_table.id
}

# Create a Security Group to control access to the VPC
resource "aws_security_group" "mohamed_VP_C_SG" {
  name        = "mohamed-VP-C-SG"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.mohamedVPC.id

  # Inbound Rules
  ingress {
    description = "SSH connections"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow all inbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins Access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Nexus-Access"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Output public and private subnet IDs and security group info
output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "security-group-name" {
  value = aws_security_group.mohamed_VP_C_SG.name
}

output "security-group-id" {
  value = aws_security_group.mohamed_VP_C_SG.id
}
