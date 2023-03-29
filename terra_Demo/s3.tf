resource "aws_s3_bucket" "c"{
    bucket="golmal876y"
    tags = {
        name        =   "My Bucket"
        Environment =   "Dev" 
    }
}
resource "aws_s3_bucket_acl" "example"{
    bucket=aws_s3_bucket.c.id
    acl="private"
}