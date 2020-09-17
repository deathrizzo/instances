module "ec2-instance" {
  source = "../../modules/ec2-instance"

  name           = "kube"
  instance_count = 1

  ami                    = "ami-07a29e5e945228fa1"
  instance_type          = "t2.medium"
  key_name               = "ppuppet"
  monitoring             = false
  vpc_security_group_ids = ["sg-4147de30"]
  subnet_id              = "subnet-c9bfb78f"
  user_data              = "${file("user_data/user_data.sh")}"

  tags = {
    Name        = "k8s.deathrizzo.com"
    OS          = "ubuntu 18.04"
    Terraform   = "true"
    Application = "k8s"
    Environment = "dev"
    User        = "Wu-Tang-Clan"
  }
}
