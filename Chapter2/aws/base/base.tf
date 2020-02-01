provider aws {    
  region = "us-east-2"
}

resource "aws_instance" "base" {
  ami = "ami-0b32ec75f2cd21d30"
  instance_type = "t2.micro"
}

resource "aws_eip" "base" {
  instance = aws_instance.base.id
}
