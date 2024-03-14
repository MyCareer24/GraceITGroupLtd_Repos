#Grace IT Group VPC Networking
resource "aws_vpc" "GraceITGroup-VPC" {
  cidr_block       = var.Vpc_Cidr
  instance_tenancy = var.Vpc_Instance_Tenancy
  enable_dns_hostnames = var.Vpc_Enable_Dns_Hostnames


  tags = {
    Name = "GraceITGroup-VPC"
    Env = "Prod"
  }
}

#Creating GraceITGroup Two Public/Private SUBNETS
#PUBLIC SUBNET
resource "aws_subnet" "GracePubSub1" {
  vpc_id     = aws_vpc.GraceITGroup-VPC.id
  cidr_block = var.GracePubSub1_Cidr
  availability_zone = var.GracePubSub1_AvailZone

  tags = {
    Name = "GracePubSub1"
    Env = "Prod"
  }
}

resource "aws_subnet" "GracePubSub2" {
  vpc_id     = aws_vpc.GraceITGroup-VPC.id
  cidr_block = "10.16.8.0/22"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "GracePubSub2"
    Env = "Prod"
  }
}

#GRACE IT PRIVATE SUBNET
resource "aws_subnet" "GracePrivSub1" {
  vpc_id     = aws_vpc.GraceITGroup-VPC.id
  cidr_block = var.GracePrvSub1_Cidr
  availability_zone = var.GracePrvSub1_AvailZone
  
  tags = {
    Name = "GracePrivSub1"
    Env = "Prod"
  }
}

resource "aws_subnet" "GracePrivSub2" {
  vpc_id     = aws_vpc.GraceITGroup-VPC.id
  cidr_block = var.GracePrvSub2_Cidr
  availability_zone = var.GracePrvSub2_AvailZone

  tags = {
    Name = "GracePrivSub2"
    Env = "Prod"
  }
}

#CREATING BOTH PUBLIC AND PRIVATE ROUTE TABLE
resource "aws_route_table" "GraceIT-Pub-RT" {
  vpc_id = aws_vpc.GraceITGroup-VPC.id

  route {
    cidr_block = var.GraceIT-Pub-RT_Cidr
    gateway_id = aws_internet_gateway.GraceIT-IGW.id
  }

  tags = {
    Name = "GraceIT-Pub-RT"
    Env = "Prod"
  }
}

resource "aws_route_table" "GraceIT-Priv-RT" {
  vpc_id = aws_vpc.GraceITGroup-VPC.id

  route {
    cidr_block = var.GraceIT-Priv-RT_Cidr
    nat_gateway_id = aws_nat_gateway.Grace-NG.id
  }
  tags = {
    Name = "GraceIT-Priv-RT"
    Env = "Prod"
  }
}

#ASSOCIATING OF ROUTE PUBLIC/PRIVATE TABLES TO THE SUBNETS
resource "aws_route_table_association" "GraceIT-Assoc1" {
  subnet_id      = aws_subnet.GracePubSub1.id
  route_table_id = aws_route_table.GraceIT-Pub-RT.id
}

resource "aws_route_table_association" "GraceIT-Assoc2" {
  subnet_id      = aws_subnet.GracePubSub2.id
  route_table_id = aws_route_table.GraceIT-Pub-RT.id
}

resource "aws_route_table_association" "GraceIT-Assoc3" {
  subnet_id      = aws_subnet.GracePrivSub1.id
  route_table_id = aws_route_table.GraceIT-Priv-RT.id
}

resource "aws_route_table_association" "GraceIT-Assoc4" {
  subnet_id      = aws_subnet.GracePrivSub2.id
  route_table_id = aws_route_table.GraceIT-Priv-RT.id
}

#CREATION OF INTERNET GATEWAY
resource "aws_internet_gateway" "GraceIT-IGW" {
  vpc_id = aws_vpc.GraceITGroup-VPC.id

  tags = {
    Name = "GraceIT-IGW"
    Env = "Prod"
  }
}

#CREATION OF ELASSTIC IP & NAT GATEWAY
#EIP may require IGW to exist prior to association.
#Use depends_on to set an explicit dependency on the IGW
#ELASTIC IP
resource "aws_eip" "Grace-EIP" {
  depends_on = [aws_internet_gateway.GraceIT-IGW]

  tags = {
    Name = "Grace-EIP"
    Envi = "Prod"
  }
}

#NAT GATEWAY
resource "aws_nat_gateway" "Grace-NG" {
  allocation_id = aws_eip.Grace-EIP.id
  subnet_id     = aws_subnet.GracePubSub1.id
  tags = {
    Name = "Grace-NG"
    Env = "Prod"
  }

}

#ASSOCIATING PRIVATE SUBNET 1 WITH PRIVATE ROUTE TABLE 1
#TERRAFORM AWS ASSOCIATE SUBNET WITH ROUTE TABLE
resource "aws_route_table_association" "GraceITPrivRTAssocforNG" {
  subnet_id = aws_subnet.GracePrivSub1.id
  route_table_id = aws_route_table.GraceIT-Priv-RT.id
}

