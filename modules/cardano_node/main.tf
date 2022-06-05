resource "aws_vpc" "main_node" {
  cidr_block = "172.26.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  
  tags = {
    Name = var.name
  }
}

resource "aws_subnet" "main_node" {
  cidr_block              = "${cidrsubnet(aws_vpc.main_node.cidr_block, 3, 1)}"
  vpc_id                  = "${aws_vpc.main_node.id}"
  availability_zone       = var.zone
  map_public_ip_on_launch = true
}

module "cardano_node" {
  source = "leb4r/cardano-node/aws"

  vpc_id                      = "${aws_vpc.main_node.id}"
  subnet_id                   = "${aws_subnet.main_node.id}"
  associate_public_ip_address = true
}
