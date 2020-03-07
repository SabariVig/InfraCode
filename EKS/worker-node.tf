resource "aws_eks_node_group" "worker-nodes" {
  cluster_name    = aws_eks_cluster.demo.name
  node_group_name = "tf-worker-eks"
  node_role_arn   = aws_iam_role.eks_worker_role.arn
  subnet_ids      = aws_subnet.public_subnet[*].id
  instance_types   = ["m4.large"]
  release_version = "1.14.8-20191213"


  scaling_config {
    desired_size = 2
    min_size     = 1
    max_size     = 3

  }

remote_access{
    ec2_ssh_key="temp"

}

  depends_on = [aws_iam_role_policy_attachment.eks_wn_p, aws_iam_role_policy_attachment.eks_cni_p, aws_iam_role_policy_attachment.eks_cr_p]
}
