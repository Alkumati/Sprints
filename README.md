<h1> Overview </h1>

The ultimate goal of this DevOps Bootcamp Capstone Project is to establish a robust and
automated CI/CD pipeline for deploying applications to a Kubernetes cluster on AWS. To achieve
this, you will construct a comprehensive AWS infrastructure using Terraform, setting up an EKS
cluster for container orchestration and an EC2 instance to host Jenkins, your CI/CD server.
Leveraging Ansible, you will automate the installation and configuration of Jenkins, deploy a
Nexus Repository within the EKS cluster for efficient artifact management, and streamline Docker
image and Kubernetes manifest management. By integrating Jenkins pipelines, Helm for package
management, and GitHub webhooks, you will create a seamless workflow for continuous
integration, testing, and deployment. This hands-on experience will equip you with the essential
DevOps skills and knowledge required to build and operate reliable and scalable cloud-native
applications.

<h1>Requirements</h1>

<p>Terraform</p>
<p>AWS</p>
<p>Github</p>
<p>Jenkins</p>
<p>Docker</p>
<p>Ansible</p>
<p>Kubernetes</p>

<h1>Using Terraform:</h1>
<p> Create an EKS cluster of two nodes Deploy a two-node EKS cluster for managing containerized applications.</p>
<p> Create an EC2 machine for Jenkins Provision an EC2 instance for hosting Jenkins to automate CI/CD tasks.</p>
 <p> Create AWS networking Set up VPC, subnets, and security groups for secure networking in AWS</p>

<h1>Use Ansible:</h1>
<p>Install Jenkins: Automate Jenkins installation on the EC2 instance.</p>
<p>Configure Jenkins access: Set up user authentication and access control for Jenkins.</p>
<p>Install necessary plugins: Install essential Jenkins plugins via Ansible, with manual fallback if needed.</p>
<p>Install tools for EKS access: Install tools like kubectl and AWS CLI to interact with the EKS cluster.</p>


<h1> Deploy on EKS</h1>
<p>Build namespace and one pod for Nexus Repository OSS (preferably installed using Terraform + Ansible):</p>
<p>a. Use Terraform to provision the namespace and Nexus as a Pod.</p>
<p>b. After deploying Nexus, configure it using Ansible.</p>
<p>c. Create a Docker (Hosted) Repository.</p>
<p>d. Configure the repository (Name, HTTP Port, and optional anonymous pull or use ImagePullSecret).</p>

<h1> Manually:</h1>
<p>Add AWS credentials and Kubernetes access (or consider adding these steps to the pipeline).</p>

<h1> Fork the Repo:</h1>
<p>Fork the repo and create a Docker image for the code.</p>

<h1>Create Docker Compose:</h1>
<p>Create Docker Compose for the code and database. Running <code>docker-compose up</code> should make the web app accessible via localhost.</p>

<h1>Install NGINX Controller:</h1>
<p>Install the NGINX controller to the cluster using any preferred method (automating the installation is recommended).</p>






