# vpc-terraform
1. Project Setup
   - Create a new GitHub repository
   - Initialize a local Git repository
   - Create a basic project structure for Terraform files

2. VPC Configuration
   - Define the VPC resource
   - Specify CIDR block for the VPC
   - Enable DNS hostnames and DNS support

3. Availability Zones
   - Retrieve information about available AZs in the region
   - Select two AZs for the project

4. Subnet Creation
   - Create 6 subnets (3 per AZ):
     - 2 public subnets (1 per AZ)
     - 4 private subnets (2 per AZ)
   - Assign CIDR blocks to each subnet
   - Associate subnets with their respective AZs

5. Internet Gateway
   - Create an Internet Gateway
   - Attach the Internet Gateway to the VPC

6. NAT Gateways
   - Create 2 NAT Gateways (1 per AZ)
   - Allocate Elastic IPs for NAT Gateways
   - Associate NAT Gateways with public subnets

7. Route Tables
   - Create a public route table
     - Add a route to the Internet Gateway
   - Create 2 private route tables (1 per AZ)
     - Add routes to respective NAT Gateways
   - Associate route tables with appropriate subnets

8. Network ACLs
   - Create NACLs for each subnet
   - Define inbound and outbound rules for each NACL

9. Security Groups
   - Create security groups for public and private instances
   - Define inbound and outbound rules for each security group

10. EC2 Instances
    - Define EC2 instance resources (6 total)
    - Assign instances to their respective subnets
    - Associate security groups with instances
    - Configure public instances with Elastic IPs
    - Set up user data for SSH key distribution (for private instance access)

11. SSH Key Pair
    - Generate an SSH key pair
    - Add the public key to AWS Key Pairs

12. Outputs
    - Define outputs for important resource information (e.g., public IP addresses)

13. Variables
    - Create a variables.tf file to define input variables
    - Create a terraform.tfvars file for variable values

14. Backend Configuration
    - Set up an S3 backend for storing Terraform state
    - Configure state locking using DynamoDB

15. GitHub Actions Workflow
    - Create a .github/workflows directory
    - Define a YAML file for the GitHub Actions workflow
    - Set up job steps:
      - Checkout code
      - Set up Terraform
      - Initialize Terraform
      - Validate Terraform configuration
      - Plan Terraform changes
      - Apply Terraform changes (on push to main branch)

16. GitHub Secrets
    - Add AWS credentials as GitHub secrets
    - Add any other sensitive information as secrets


17. Documentation
    - Create a README.md file
    - Document project structure, requirements, and usage instructions

18. Testing
    - Develop a testing strategy (e.g., using Terratest)
    - Implement basic tests for infrastructure validation

19. Continuous Integration
    - Configure GitHub Actions to run tests on pull requests
    - Set up linting for Terraform files (e.g., using tflint)

22. Cleanup
    - Create a separate workflow for destroying resources
    - Implement safeguards to prevent accidental destruction

23. Version Control
    - Create a .gitignore file for Terraform-specific files
    - Commit and push your code to GitHub

DONE:
-created a tf state file, in order to store the configuration on a remote backend S3
-create modules in order to have each service in a separate subdirectory
-done point 2 'VPC Configuration'
