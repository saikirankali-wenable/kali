resource "aws_s3_bucket" "mybucket" {
   bucket = "test_bucket"
   acl = "private"
   versioning {
      enabled = true
   }
   tags = {
     Name = "Bucket_test"
     
   }
}
    

