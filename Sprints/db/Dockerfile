# Use the latest official MySQL image as the base
FROM mysql:latest

# Add the SQL file to the MySQL initialization directory
ADD BucketList.sql /docker-entrypoint-initdb.d/
