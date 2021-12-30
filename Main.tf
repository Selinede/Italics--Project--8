

# Main VPC Italics

resource "aws_vpc" "Italics_vpc" {
  cidr_block       = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    Name = var.tag-post
  }
}

# Public Subnet 1


resource "aws_subnet" "Italics-Pub-Subnet1" {
  vpc_id     = aws_vpc.Italics_vpc.id
  cidr_block = var.Italics-Pub-Subnet1
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Italics-Pub-Subnet1"
  }
}



# Public Subnet 2


resource "aws_subnet" "Italics-Pub-Subnet2" {
  vpc_id     = aws_vpc.Italics_vpc.id
  cidr_block = var.Italics-Pub-Subnet2
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Italics-Pub-Subnet2"
  }
}

# Private Subnet-Application-1


resource "aws_subnet" "Italics-Pri-Subnet1" {
  vpc_id     = aws_vpc.Italics_vpc.id
  cidr_block = var.Italics-Pri-Subnet1
  availability_zone = "eu-west-3b"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Italics-Pri-Subnet1"
  }
}

# Private Subnet-Application-2


resource "aws_subnet" "Italics-Pri-Subnet2" {
  vpc_id     = aws_vpc.Italics_vpc.id
  cidr_block = var.Italics-Pri-Subnet2
  availability_zone = "eu-west-3c"
  map_public_ip_on_launch = "false"

  tags = {
    Name = "Italics-Pri-Subnet2"
  }
}


#  ITALICS PRIVATE SUBNET DATABASE 1

resource "aws_subnet" "Italics-Pri-Subnet-Database1" {
  vpc_id     = aws_vpc.Italics_vpc.id
  cidr_block = var.Italics-Pri-Subnet-Database1
   map_public_ip_on_launch = "false"

  availability_zone = "eu-west-3b"

  tags = {
    Name = "Italics-Pri-Subnet-Database1"
  }
}



# ITALICS PRIVATE SUBNET DATABASE 2

resource "aws_subnet" "Italics-Pri-Subnet-Database2" {
  vpc_id     = aws_vpc.Italics_vpc.id
  cidr_block = var.Italics-Pri-Subnet-Database2
  availability_zone = "eu-west-3c"
   map_public_ip_on_launch = "false"

  tags = {
    Name = "Italics-Pri-Subnet-Database2"
  }
}



# Web-Route Table_Public

resource "aws_route_table" "Italics-Web-RT" {
  vpc_id = aws_vpc.Italics_vpc.id



  tags = {
    Name = "Italics-Web-RT"
  }
}


# Database & Application-Route Table Private

resource "aws_route_table" "Italics-DB_Application-RT" {
  vpc_id = aws_vpc.Italics_vpc.id



  tags = {
    Name = "Italics-DB_Application-RT"
  }
}




# Web-Route Table Public Association with Route 1

resource "aws_route_table_association" "Italics-Pub-web-layer1" {
  subnet_id      = aws_subnet.Italics-Pub-Subnet1.id
  route_table_id = aws_route_table.Italics-Web-RT.id
}


# Web-Route Table Public Association with Route2

resource "aws_route_table_association" "Italics-Pub-web-layer2" {
  subnet_id      = aws_subnet.Italics-Pub-Subnet2.id
  route_table_id = aws_route_table.Italics-Web-RT.id
}



# The Private_subnet_Database Association with Route1

resource "aws_route_table_association" "Database-RT1" {
  subnet_id      = aws_subnet.Italics-Pri-Subnet-Database1.id
  route_table_id = aws_route_table.Italics-DB_Application-RT.id
}

# The Private_subnet-Database Association with Route2

resource "aws_route_table_association" "Private-Subnetaso2" {
  subnet_id      = aws_subnet.Italics-Pri-Subnet-Database2.id
  route_table_id = aws_route_table.Italics-DB_Application-RT.id
}

# The Private_subnet-Application Association with RouteA

resource "aws_route_table_association" "Application-Subnet-Ass1" {
  subnet_id      = aws_subnet.Italics-Pri-Subnet1.id
  route_table_id = aws_route_table.Italics-DB_Application-RT.id
}


# The Private_subnet-Application Association with RouteB

resource "aws_route_table_association" "Application-Subnet-Ass2" {
  subnet_id      = aws_subnet.Italics-Pri-Subnet2.id
  route_table_id = aws_route_table.Italics-DB_Application-RT.id
}



# The_Internet Gateway 


resource "aws_internet_gateway" "Italics-IGW" {
  vpc_id       = aws_vpc.Italics_vpc.id

  tags = {
    Name       = "Italics-IGW"
  }
}


# Connection of Routable and Internet Gate Way

# Conection of Route to Internet GW And Pub-Route


resource "aws_route" "Italics-Pub-IGW-Route" {
  route_table_id            = aws_route_table.Italics-Web-RT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.Italics-IGW.id   

} 

resource "aws_route" "Italics-Pri-RT-App1" {
  route_table_id            = aws_route_table.Italics-DB_Application-RT.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_nat_gateway.Italics-Nat-Web1.id   

} 







  
















