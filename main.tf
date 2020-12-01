provider "aws" {
  version = "2.12.0"
  region = "eu-west-1"
}

resource "aws_instance" "helloworld" {
  ami = "ami-0aef57767f5404a3c"
  instance_type = "t2.micro"
}
