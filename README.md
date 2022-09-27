# jenkin-server-tf

# Local Setup

- Install terraform (https://www.terraform.io/downloads)
- Install AWS-cli (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- **Pre-Conditions-1:** Verify your AWS Credentials in **$HOME/.aws/credentials**
- **Pre-Conditions-2:** Verify your key-pair "private-key/jenkins-server-tf-key.cer" in **./c9-nullresource-provisioners.tf**

# Project Run Commands

```
$ terraform init
$ terraform vaildate
$ terraform plan
$ terraform apply
$ terraform apply --auto-approve # auto yes
$ terraform apply -target=xxx.tf # specific file
$ terraform destory
```

# AWS Infrastructure

- 單一instance，直接Host Jenkins
- 2 x az
- 1 x ec2 | ubuntu
- 1 x vpc | 1 x public subnet
- 1 x security group
- ssh 22 | http 8080

# Ubuntu Commands

- login ubuntu

```$ ssh -i ../private-key/jenkins-server-tf-key.cer ubuntu@54.156.224.105```

- jenkins service status

```$ systemctl status jenkins```

- jenkins logs

```$ journalctl -u jenkins.service```