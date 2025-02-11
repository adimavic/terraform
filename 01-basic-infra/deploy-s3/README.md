# Resume Hosting with Terraform 🚀

Welcome to the **Terraform Resume Hosting Project**! This repository allows you to upload and host your resume on an AWS S3 bucket with public access. With just a few simple steps, you can deploy your resume as a publicly accessible URL.

## 📌 Features
- Automatically creates an **S3 bucket** for storing resumes.
- Uploads **multiple resumes** to the bucket.
- Configures **public access** so that resumes are easily shareable.
- Outputs a **public URL** for each uploaded resume.

## 🛠️ Prerequisites
Before using this Terraform configuration, make sure you have:
- An **AWS account** with IAM permissions to create S3 buckets.
- **Terraform installed** ([Download Terraform](https://www.terraform.io/downloads.html)).
- AWS credentials configured (`~/.aws/credentials`).

## 🚀 Deployment Steps
1. Clone this repository:
   ```sh
   git clone https://github.com/yourusername/terraform-resume-hosting.git
   cd terraform-resume-hosting
   ```
2. Place your resume (`your_name.pdf`) in the current directory.
3. Modify the Terraform file to include your resume as follows:
   ```hcl
   resource "aws_s3_object" "your_name_resume" {
     bucket       = aws_s3_bucket.my_bucket.bucket
     key          = "your_name.pdf"
     source       = "your_name.pdf"
     content_type = "application/pdf"
   }
   
   output "your_name_resume_url" {
     value = "http://${aws_s3_bucket.my_bucket.bucket}.s3-${var.aws_region}.amazonaws.com/${aws_s3_object.your_name_resume.key}"
   }
   ```
4. Initialize Terraform:
   ```sh
   terraform init
   ```
5. Apply the Terraform configuration:
   ```sh
   terraform apply -auto-approve
   ```
6. Find your resume's public URL in the Terraform output!

## 🎯 Example Output
```sh
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:

manisha_resume_url = "http://resumehoster.s3-ap-south-1.amazonaws.com/ManishaChoudharyCV.pdf"
aditya_resume_url  = "http://resumehoster.s3-ap-south-1.amazonaws.com/AdityaKale.pdf"
```

## 🔥 Bonus: Upload More Resumes
To upload additional resumes, just add another `aws_s3_object` resource:
```hcl
resource "aws_s3_object" "john_doe_resume" {
  bucket       = aws_s3_bucket.my_bucket.bucket
  key          = "JohnDoe.pdf"
  source       = "JohnDoe.pdf"
  content_type = "application/pdf"
}

output "john_doe_resume_url" {
  value = "http://${aws_s3_bucket.my_bucket.bucket}.s3-${var.aws_region}.amazonaws.com/${aws_s3_object.john_doe_resume.key}"
}
```
Then run:
```sh
terraform apply -auto-approve
```

## 📝 Notes
- Make sure your file names are **exactly** the same in the `key` and `source` attributes.
- If you update your resume, just replace the file and re-run `terraform apply`.
- Don't forget to clean up resources when no longer needed:
  ```sh
  terraform destroy -auto-approve
  ```

## 📧 Contact
Feel free to reach out if you have any questions! 🚀

Happy hosting! 😊

