# Create Elastic IP for Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "public_eip" {
  depends_on = [module.ec2_public, module.vpc]
  instance   = module.ec2_public.id[0]
  vpc        = true
  tags       = local.common_tags
}
