variable "ami_id" {
    default = "ami-03265a0778a880afb"
}

variable "instance_name" {
    type = list
    default = ["mongodb", "cart", "catalogue", "user", "redis", "mysql", "rabbitmq", "shipping", "payment", "web"]
}

variable "zone_id" {
    default = "Z05495711NZZYMAJC18L3"
}

variable "domain" {
    default = "krishnadevops.online"
}