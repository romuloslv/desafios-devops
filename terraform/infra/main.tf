resource "aws_instance" "idwall-devops" {
  ami             = "${lookup(var.amis, var.aws_region)}"
  instance_type   = "${var.instance_type}"
  security_groups = ["sg_DefaultWebserver"]
  key_name        = "${var.key_name}"
  user_data       = "${file("dckr.sh")}"

    tags {
    Name            = "idwall-devops"
    Provider        = "terraform"
    Role            = "test"
  }
}
