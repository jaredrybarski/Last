
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway


}

module "ssh_security_group" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"
  name   = "sg"
  vpc_id = module.vpc.vpc_id

}

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.5.0"
  count   = 2

  name = "VMr"

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [module.ssh_security_group.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
 

}
