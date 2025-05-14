resource "aws_ebs_volume" "data_volume" {
  availability_zone = "sa-east-1a"
  type              = "gp3"
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.data_volume.id
  instance_id = aws_instance.awsec2app.id
}