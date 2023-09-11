resource "aws_instance" "conditions"{
    count = 10
    ami = var.ami_id #devops practice us-east-1
    instance_type = var.instance_name[count.index] == "mongodb" || var.instance_name[count.index] == "mysql" ? "t3.medium" : "t2.micro" 
    tags = {
        Name = var.instance_name[count.index]
    }
}

resource "aws_route53_record" "record" {
  count = 10
  zone_id = var.zone_id
  name    = "${var.instance_name[count.index]}.${var.domain}"  #interpolation
  type    = "A"
  ttl     = 1
  records = [aws_instance.conditions[count.index].private_ip]
}

resource "aws_key_pair" "deployer" {
  key_name   = "client-pub"
  public_key = file("${path.module}/client.pub")
}

resource "aws_instance" "file-function"{
    ami = var.ami_id #devops practice us-east-1
    instance_type = "t2.micro"
    key_name = aws_key_pair.deployer.key_name
    
}

# mongodb cart catalogue user redis mysql rabbitmq shipping payment web