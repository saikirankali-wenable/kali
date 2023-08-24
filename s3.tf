resource "aws_s3_bucket" "mybucket" {
   bucket = "test-bucket-wenable"
   acl = "private"
   versioning {
      enabled = true
   }
   tags = {
     Name = "Bucket_test-W1"
     
   }
}
    

