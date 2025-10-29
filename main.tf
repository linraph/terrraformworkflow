module "s3_bucket" {
 source = "./modules/s3" 
}
module "instance" {
  source = "./modules/instance"
}