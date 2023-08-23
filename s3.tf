resource "aws_s3_bucket" "mybucket" {
   bucket = "testi_bucket"
   acl = "private"
   versioning {
      enabled = true
   }
   tags = {
     Name = "Buckettest"
     
   }
}
    

