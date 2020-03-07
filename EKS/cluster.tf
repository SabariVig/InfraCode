resource "aws_eks_cluster" "demo" {
    name="demo-terraform"
    role_arn= aws_iam_role.eks_cluster_role.arn
    
  depends_on = [
    aws_iam_role_policy_attachment.eks_service,
    aws_iam_role_policy_attachment.eks_cluster,
  ]

    vpc_config {
        security_group_ids =[aws_security_group.eks-sg.id]
        subnet_ids = aws_subnet.public_subnet[*].id
    
    }
    
}