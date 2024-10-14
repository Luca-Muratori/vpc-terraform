variable "subnet_cidr" {
  type = list(object({
    name = string,
    cidr = string,
    az=string,
    public_ip=bool
  }))
  default = [
    {
      name = "Public1A",
      cidr = "10.0.1.0/24",
      az= "eu-central-1a",
      public_ip=true
    },
    {
      name = "Private2A",
      cidr = "10.0.2.0/24",
      az= "eu-central-1b",
      public_ip=false
    },
    {
      name = "Private3A",
      cidr = "10.0.3.0/24",
      az= "eu-central-1c",
      public_ip=false
    },
  ]
}