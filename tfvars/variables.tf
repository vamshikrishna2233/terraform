variable "ami_id"{
    type = string #data type
    default = "ami-03265a0778a880afb" # default value
}

variable "instances" {
  type = map
  default = {
    MongoDB = "t3.medium"
    MySQL = "t3.medium"
    Redis = "t2.micro"
    RabbitMQ = "t2.micro"
    Catalogue = "t2.micro"
    User = "t2.micro"
    Cart = "t2.micro"
    Shipping = "t2.micro"
    Payment = "t2.micro"
    Web = "t2.micro"
  }
}

variable "zone_id" {
  default = "Z05495711NZZYMAJC18L3"
}

variable "domain" {
  default = "krishnadevops.online"
}

variable "sg_name"{
    default = "allow-all"
}

variable "sg_cidr" {
    default = ["0.0.0.0/0"]
}