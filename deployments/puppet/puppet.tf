module "ec2-instance" {
  source = "../../modules/ec2-instance"

  name           = "puppetmaster"
  instance_count = 1

  ami                    = "ami-07a29e5e945228fa1"
  instance_type          = "t2.medium"
  key_name               = "ppuppet"
  monitoring             = false
  vpc_security_group_ids = ["sg-4147de30"]
  subnet_id              = "subnet-c9bfb78f"

  tags = {
    name        = "psdb.deathrizzo.com"
    OS          = "ubuntu 18.04"
    Terraform   = "true"
    Environment = "dev"
    User        = "Wu-Tang-Clan"
    Application = "puppetmaster"
  }
}
