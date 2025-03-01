aws_region         = "us-west-2" # AWS region
aws_access_key     = "Your aws ACCESS KEY" # Path to your AWS access key
aws_secret_key     = "Your aws SECRET KEY " # Path to your AWS secret key
vpc_cidr           = "10.0.0.0/16"  # CIDR block for VPC
public_subnet_cidr = "10.0.1.0/24" # CIDR block for the public subnet
instance_type      = "t2.micro"      # EC2 instance type
public_key         = "~/.ssh/id_rsa.pub" # Path to your public SSH key
private_key_path   = "~/.ssh/id_rsa"    # Path to your private SSH key
hosted_zone_id     = "Z09621173SW1D54CBUWBK" # Route 53 hosted zone ID
domain_name        = "muadmaalim.buzz" # Domain name