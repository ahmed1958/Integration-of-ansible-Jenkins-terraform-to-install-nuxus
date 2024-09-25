
vpc-data = {
#here is the cidr and the name of the vpc
     "vpc_1" = "10.0.0.0/16"
     }

subnet-data = {
     "public_sub" = ["10.0.1.0/24","us-east-1a","vpc_1"]
     }

igw-data = {
     "my-gateway" = "vpc_1"
    }
my-routes-data = {
"my_route_table" =["vpc_1","0.0.0.0/0","my-gateway"]

}
terraform-associate-data= {
  "public_sub" = ["my_route_table"]  
} 
my-sec-data= {
     "my-sec-1"=["vpc_1",22,"tcp","0.0.0.0/0",80,"tcp","0.0.0.0/0",8081,"tcp","0.0.0.0/0",0,"-1","0.0.0.0/0"]
}
my-ec2-data = {
  "hamada public" = [ "ami-066784287e358dad1", "t3.medium" , "public_sub" , true,"my-sec-1","DAY3",
   <<-EOF
      #!/bin/bash
      yum update -y
      yum install -y httpd
      systemctl start httpd
      systemctl enable httpd
    EOF 
      ,
      "public"  ]
}
