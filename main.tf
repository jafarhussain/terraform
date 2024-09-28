provider "aws" {
    region = "us-east-1"    
    access_key = "YOUR_ACCESS_KEY"
    secret_key = "YOUR_SECREt_KEY"
}

resource "aws_instance" "example" {
    ami           = "ami-0e86e20dae9224db8"  
    instance_type = "t2.micro"
    key_name = "terminal_key"
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}


resource "aws_key_pair" "deployer" {
  key_name   = "terminal_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCdKHY6T+FcljfLh1G2QsOFx31LKuRQtYF+VVWAzgadakrbN5Dd/OeZocb0XOOXAXYQ3gkINKvzEjJx9U7Wk8NWtKoWBST/FTfT/FnYvzYLBc1l8V1u4BnIxtJzpkFGV5dkgqWldAZTzx8yAaHiVONnfJ+HxqkaoL717m+c+gOWflpYZSwisYyaFonSmFUq7lpz2pJ5Je9kknHMSbbk8ggKXCXHikwEy7ftZCjsvUC6ltaTgCvPm/kHbit7zV1DjwGdwlfEWlp4bzsZZXNONpOtutNa1XN+gMvZMVowAx2fChyt1vG98hpeH5HySW7SataLR8xFlu3ckLS0oYbW/v5/ skywalker@skywalker"
}