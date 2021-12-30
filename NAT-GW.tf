

# Elastic IP for NAT Gateway

resource "aws_eip" "Italics-EIP-IGW" {
  vpc = true
  depends_on = [aws_internet_gateway.Italics-IGW]
  tags = {
    Name = "Italics-EIP-IGW"
  }

}



# Nat Gate way for vpc/subnet -Web-Subnet-1

resource "aws_nat_gateway" "Italics-Nat-Web1" {
  allocation_id = aws_eip.Italics-EIP-IGW.id
  subnet_id     = aws_subnet.Italics-Pub-Subnet1.id

  tags = {
    Name = "Italics-Nat-Web1"
  }


}




# To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC. Added above

