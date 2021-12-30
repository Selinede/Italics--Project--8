

# REFERENCE FILE
# REGION

variable "region" {
    type         = string
    description  = "Paris region"
    default      = "eu-west-3"
}

# VPC CIDR cidr_block

variable "vpc-cidr" {
  type         = string
  default      = "10.0.0.0/16"
  description  = "vpc cidr"
    
}


variable "tag-post" {
  type         = string
  default      = "Italics_vpc"
  description  = "tag name"
    
}

# PUBLIC SUBNET1 variable

variable "Italics-Pub-Subnet1"{
    type          = string
    description   = "Pub-Subnet1 Cidr"
    default       = "10.0.1.0/24"
}

# PUBLIC SUBNET2 variable

variable "Italics-Pub-Subnet2"{
    type          = string
    description   = "Pub-Subnet2 Cidr"
    default       = "10.0.2.0/24"
}

# PRIVATE SUBNET1 variable

variable "Italics-Pri-Subnet1"{
    type          = string
    description   = "Pri-Subnet1 Cidr"
    default       = "10.0.3.0/24"
}

# PRIVATE SUBNET2 variable

variable "Italics-Pri-Subnet2"{
    type          = string
    description   = "Pri-Subnet2 Cidr"
    default       = "10.0.4.0/24"
    
}


#ITALICS PRIVATE SUBNET DATABASE 1 variable

variable "Italics-Pri-Subnet-Database1"{
    type          = string
    description   = "Italics-Pri-Subnet-Database1 Cidr"
    default       = "10.0.5.0/24"
}

# ITALICS PRIVATE SUBNET DATABASE 2 variable

variable "Italics-Pri-Subnet-Database2"{
    type          = string
    description   = "Italics-Pri-Subnet-Database2 Cidr"
    default       = "10.0.6.0/24"
    
}