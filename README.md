# Skills uplift for sprint 36.2: CI/CD with GitHub Actions for a static website hosted in AWS S3 that was setup via Terraform

##  Making Changes to the Webpage or the Terraform configuration via GitHub Actions
1. Edit `index.html` from the `src` folder to make changes to the webpage, or edit the `main.tf` in the `terraform` folder to make changes to the terraform configuration.
2. Once done, run `git add .` followed by `git commit -m "<informative_commit_message>"`. Replace the contents of `<informative_commit_message>` with an informative commit message that describes the changes that have been made to the HTML file.
3. Run `git push origin` to push your changes to the repository hosted in GitHub
4. Visit the URL of the static site at `https://aws-terraform-practice-vsujeesh.s3.ap-southeast-1.amazonaws.com/index.html` and your changes (if any) should be reflected.
5. To destroy the infrastructure, go to the `Actions` tab of the Github Repo, and manually trigger the workflow named `Destroy Infrastructure`.

---

##  Local Setup (only needed if making changes to s3 via terraform via your local environment)
1. Install Git for your operating system locally from `https://git-scm.com/downloads`.
2. Install Terraform for your operating system locally from `https://developer.hashicorp.com/terraform/downloads`.
3. Clone this repository using the `git clone` command into your local storage using the HTTPS URL of the repository.
4. Run `terraform init`, followed by exporting the environment variables (see email for the commands), and then `terraform plan` and then lastly `terraform apply`. This will create/provision the s3 bucket, and a hello world page will be accessible at the address `https://aws-terraform-practice-vsujeesh.s3.ap-southeast-1.amazonaws.com/index.html`


