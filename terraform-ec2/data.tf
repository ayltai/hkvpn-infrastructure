data "aws_ami" "ubuntu" {
  filter {
    name = "name"

    values = [
      var.ami_filter,
    ]
  }

  filter {
    name = "virtualization-type"

    values = [
      "hvm",
    ]
  }

  owners = [
    var.ami_owner,
  ]

  most_recent = true
}
