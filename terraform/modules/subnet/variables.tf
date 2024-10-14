variable "subnet_cidr" {
  type = list(object({
    name = string,
    cidr = string
  }))
  default = [
    {
      name = "Public1A",
      cidr = "10.0.1.0/24"
    },
    {
      name = "Private2A",
      cidr = "10.0.2.0/24"
    },
    {
      name = "Private3A",
      cidr = "10.0.3.0/24"
    },
  ]
}