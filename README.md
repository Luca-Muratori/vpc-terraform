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
   - Create 3 subnets (1 per AZ):
     - 1 public subnets 
     - 2 private subnets 
   - Assign CIDR blocks to each subnet
   - Associate subnets with their respective AZs


5. Internet Gateway
   - Create an Internet Gateway
   - Attach the Internet Gateway to the VPC
//------------------------

7. Route Tables
   - Create a public route table
     - Add a route to the Internet Gateway
   - Create 2 private route tables (1 per AZ)
    
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
-make that if the github action to create the vpc is launched, now thanks to an if statement
    it won't rerun again all the jobs for the creations, make it less resources demanding and fast
-modularized the different services, now the vpc creation will be triggered only if there is no vpc
    in aws
-

