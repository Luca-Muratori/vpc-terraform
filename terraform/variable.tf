//part 1-------------


variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-0592c673f0b1e7665"
}

variable "type" {
  type        = string
  description = "instance type for ec2 instances"
  default     = "t3.micro"
}

variable "subnet" {
  type = list(object({
    name = string,
    cidr = string
  }))
  default = [
    {
      name = "Public1A",
      cidr = "10.0.0.1/24"
    },
    {
      name = "Private2A",
      cidr = "10.0.0.2/24"
    },
    {
      name = "Private3A",
      cidr = "10.0.0.3/24"
    },
    {
      name = "Public1B",
      cidr = "10.0.0.4/24"
    },
    {
      name = "Private2B",
      cidr = "10.0.0.5/24"
    },
    {
      name = "Private3B",
      cidr = "10.0.0.6/24"
    },
  ]
}
//end part 1---------------
