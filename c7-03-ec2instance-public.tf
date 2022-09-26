# AWS EC2 Instance Terraform Module
# Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_public" {
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"
  # insert the 10 required variables here
  name                   = "${var.environment}-Jenkins-Host"
  #instance_count         = 5
  # ami                    = data.aws_ami.amzlinux2.id
  ami                    = "ami-0149b2da6ceec4bb0"
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_sg.this_security_group_id]
  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags
}