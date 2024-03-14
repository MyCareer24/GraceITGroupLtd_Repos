#CREATING VARIABLES#
#Creating Provider Region Name Variable
variable "Region_name" {
    type = string
    description = "Make region a variable"
    default = "eu-west-2"
}

#VPC CIDR Variable
variable "Vpc_Cidr" {
    type = string
    description = "Make VPC_Cidr_Block a variable"
    default = "10.16.0.0/16"
}

#VPC Instance_Tenancy Variable
variable "Vpc_Instance_Tenancy" {
    type = string
    description = "Make Vpc_Instance_Tenancy a variable"
    default = "default"
}

#VPC enable_dns_hostname Variable
variable "Vpc_Enable_Dns_Hostnames" {
    type = bool
    description = "Make Vpc_Enable_Dns_Hostnames a variable"
    default = true
}

#GracePubSub1 Cidr Variable
variable "GracePubSub1_Cidr" {
    type = string
    description = "Make GracePubSub1_Cidr a variable"
    default = "10.16.16.0/20"
}

#GracePubSub1 Availability_Zone Variable
variable "GracePubSub1_AvailZone" {
    type = string
    description = "Make GracePubSub1 Availabilty Zone a variable"
    default = "eu-west-2a"
}

#GracePubSub2 Cidr Variable
variable "GracePubSub2_Cidr" {
    type = string
    description = "Make GracePubSub2_Cidr a variable"
    default = "10.16.8.0/22"
}

#GracePubSub2 Availability_Zone Variable
variable "GracePubSub2_AvailZone" {
    type = string
    description = "Make GracePubSub2 Availabilty Zone a variable"
    default = "eu-west-2a"
}

# GRACE IT PRIVATE SUBNET VARIABLES #
#GracePrvSub1 Cidr Variable
variable "GracePrvSub1_Cidr" {
    type = string
    description = "Make GracePrvSub1_Cidr a variable"
    default = "10.16.12.0/24"
}

#GracePrvSub1 Availability_Zone Variable
variable "GracePrvSub1_AvailZone" {
    type = string
    description = "Make GracePrvSub1 Availabilty Zone a variable"
    default = "eu-west-2c"
}

#GracePrvSub2 Cidr Variable
variable "GracePrvSub2_Cidr" {
    type = string
    description = "Make GracePubSub2_Cidr a variable"
    default = "10.16.14.0/26"
}

#GracePrvSub2 Availability_Zone Variable
variable "GracePrvSub2_AvailZone" {
    type = string
    description = "Make GracePubSub2 Availabilty Zone a variable"
    default = "eu-west-2c"
}

#GraceIT-Pub-RT Cidr Block Variable
variable "GraceIT-Pub-RT_Cidr" {
    type = string
    description = "Make GraceIT-Pub-RT_Cidr a variable"
    default = "0.0.0.0/0"
}

#GraceIT-Priv-RT Cidr Block Variable
variable "GraceIT-Priv-RT_Cidr" {
    type = string
    description = "Make GraceIT-Priv-RT_Cidr a variable"
    default = "0.0.0.0/0"
}