variable "subnet_cidr" {
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
  ]
}