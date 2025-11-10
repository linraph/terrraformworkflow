module "s3_bucket" {
 source = "./modules/s3" 
}
module "instance" {
  source = "./modules/instance"
}
module "aws_vpc" {
  source = "./modules/vpc"
}
module "aws_ebs_volume" {
  source = "./modules/ebsvolume"
}