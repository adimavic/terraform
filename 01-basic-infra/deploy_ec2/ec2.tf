# Generate SSH Key Pair Locally
resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Save the Private Key to a local file (downloadable)
resource "local_file" "private_key" {
  content  = tls_private_key.key_pair.private_key_pem
  filename = "${path.module}/ec2-key.pem"
  file_permission = "0600"
}

# Create AWS Key Pair using the generated Public Key
resource "aws_key_pair" "deployer" {
  key_name   = "my-key"
  public_key = tls_private_key.key_pair.public_key_openssh
}

# Create EC2 Instance using the Key Pair
resource "aws_instance" "web" {
  ami           = "ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "MyEC2Instance"
  }
}

# Outputs
output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.web.private_ip
}

output "username" {
  description = "Default SSH Username"
  value       = "ec2-user" # Change if using a different AMI
}

output "private_key_path" {
  description = "Path to the downloaded private key (.pem) file"
  value       = local_file.private_key.filename
}
