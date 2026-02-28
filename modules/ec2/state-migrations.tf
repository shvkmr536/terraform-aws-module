# Old resource
#resource "aws_s3_bucket" "app" {}

# New structure inside module
#module "s3" {
#  source = "../modules/s3"
#}

#moved {
 # from = aws_s3_bucket.app
 # to   = module.s3.aws_s3_bucket.this
#}

/*usecase:

You previously had:
resource "aws_instance" "web" {
  count = 2
}
You convert to:

resource "aws_instance" "web" {
  for_each = var.instances
}
You may need:

moved {
  from = aws_instance.web[0]
  to   = aws_instance.web["web1"]
}*/