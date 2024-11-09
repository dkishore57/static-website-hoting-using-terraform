AWS S3 Static Website Hosting with Terraform
This project demonstrates how to host a static website on AWS S3 using Terraform for Infrastructure as Code (IaC). The project includes creating an S3 bucket configured for website hosting, enabling public access with fine-grained permissions, deploying an HTML page, and managing state remotely for reliability.

Project Overview
The primary goals of this project are:

Automating infrastructure setup using Terraform.
Hosting a static website on AWS S3.
Configuring bucket policies to allow public access while maintaining security best practices.
Utilizing a remote backend for state management and version control, ensuring consistent deployments.
Features
S3 Bucket Configuration: Sets up an S3 bucket with website hosting enabled.
Public Access Policy: Configures policies and permissions to allow public access to the website content.
Remote Backend: Stores Terraform state in a remote backend, improving reliability and teamwork potential.
Static Content Deployment: Deploys an HTML page as the website's homepage.
