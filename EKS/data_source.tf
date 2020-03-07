data "aws_availability_zones" "azs" {

}

# data "aws_ami" "ami" {
#     most_recent=true 
#     owners =["602401143452"]

#     filter{
#         name="name"
#         values=["amazon-eks-node-${aws_eks_cluster.demo.version}-v*"]
#     }
# }