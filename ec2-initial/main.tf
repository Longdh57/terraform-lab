provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "hello_world" {
  ami           = "ami-0753e0e42b20e96e3"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}