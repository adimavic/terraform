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
  ami           = "ami-0c50b6f7dc3701ddd"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.web_sg.name] # Attach security group
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo chmod -R 755 /var/www/html
    echo "<h1>Hello Riya</h1>" | sudo tee /var/www/html/index.html
    sudo systemctl restart httpd
  EOF
  user_data_replace_on_change = true

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




