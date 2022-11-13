# Skills uplift for sprint 36.2: CI/CD with GitHub Actions for a static website hosted in AWS S3 that was setup via Terraform

##  Setup
1. Install Git for your operating system locally from `https://git-scm.com/downloads`.
2. Install Terraform for your operating system locally from `https://developer.hashicorp.com/terraform/downloads`.
3. Clone this repository using the `git clone` command into your local storage using the HTTPS URL of the repository.
4. Run locally `terraform init`, followed by `terraform plan` and then lastly `terraform apply`. This will create/provision the s3 bucket, and a hello world page will be accessible at the address `https://aws-terraform-practice-vsujeesh.s3.ap-southeast-1.amazonaws.com/index.html`

##  Making Changes
1. Edit `index.html` from the `src` folder. 
2. Once done, run `git add .` followed by `git commit -m "<informative_commit_message>"`. Replace the contents of `<informative_commit_message>` with an informative commit message that describes the changes that have been made to the HTML file.
3. Run `git push origin` to push your changes to the repository hosted in GitHub
4. Visit the URL of the static site at `https://aws-terraform-practice-vsujeesh.s3.ap-southeast-1.amazonaws.com/index.html` and your changes should be reflected.
