module "my_vpc" {
  source = "../../"

  aws_region = "us-west-2"
  vpc_cidr_block = "10.0.0.0/16"
  
  Name        = "My-Test"
  app         = "MyApp"
  app_owner   = "Amit"
  contact     = "amit.tiwari"
  cost_center = "1234"
  creator     = "Amit"
  customer    = "xyz"
  environment = "dev"

  remote_state_bucket_region = "us-west-2"
  vpc_state_bucket           = "amitteststatefile"
  vpc_state_key              = "vpc/"
  
}

/*module "subnets" {
  source = "../../subnets/"
  pub_subnet_cidr = "10.0.1.0/24,10.0.2.0/24"
  priv_subnet_cidr = "10.0.3.0/24,10.0.4.0/24"
  aws_region  = "us-west-2"
  Name        = "My-Test"
  app         = "MyApp"
  app_owner   = "Amit"
  contact     = "amit.tiwari"
  cost_center = "1234"
  creator     = "Amit"
  customer    = "xyz"
  environment = "dev"
}*/