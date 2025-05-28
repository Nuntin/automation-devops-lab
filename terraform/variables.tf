variable "region" {
  default = "ap-southeast-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Name of your existing EC2 Key Pair"
  type        = string
}