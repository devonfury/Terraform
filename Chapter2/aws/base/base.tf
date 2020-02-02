provider aws {    
  region = var.region
}

resource "aws_instance" "base" {
  # ami = "ami-0b32ec75f2cd21d30"
  ami = "${lookup(var.ami, var.region)}"
  instance_type = "t2.micro"
}

resource "aws_eip" "base" {
  instance = aws_instance.base.id
  vpc = true
}
