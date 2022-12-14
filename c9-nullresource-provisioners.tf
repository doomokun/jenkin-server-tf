# Create a Null Resource and Provisioners
resource "null_resource" "name" {
  depends_on = [module.ec2_public]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = aws_eip.public_eip.public_ip
    user        = "ubuntu"
    password    = ""
    private_key = file("../private-key/3-tier-app-manager.cer")
  }

  ## File Provisioner: Copies the 3-tier-app-manager.cer file to /tmp/3-tier-app-manager.cer
  provisioner "file" {
    source      = "../private-key/3-tier-app-manager.cer"
    destination = "/tmp/3-tier-app-manager.cer"
  }
  ## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/3-tier-app-manager.cer"
    ]
  }
}

# Creation Time Provisioners - By default they are created during resource creations (terraform apply)
# Destory Time Provisioners - Will be executed during "terraform destroy" command (when = destroy)
