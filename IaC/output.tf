output "public_ip"{
  value = "${aws_instance.devops.*.public_ip}"
}