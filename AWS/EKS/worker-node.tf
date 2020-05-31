# resource "aws_eks_node_group" "worker-nodes" {
#   cluster_name    = aws_eks_cluster.demo.name
#   node_group_name = "tf-worker-eks"
#   node_role_arn   = aws_iam_role.eks_worker_role.arn
#   subnet_ids      = aws_subnet.public_subnet[*].id
#   instance_types  = ["m4.large"]
#   release_version = "1.14.8-20191213"


#   scaling_config {
#     desired_size = 2
#     min_size     = 1
#     max_size     = 3

#   }


#   remote_access {
#     ec2_ssh_key = "temp"

#   }

#   depends_on = [aws_iam_role_policy_attachment.eks_wn_p, aws_iam_role_policy_attachment.eks_cni_p, aws_iam_role_policy_attachment.eks_cr_p]
# }


resource "aws_launch_configuration" "eks-worker" {
  iam_instance_profile        = aws_iam_instance_profile.eks_profile.name
  image_id                    = data.aws_ami.ami.id
  instance_type               = "m4.large"
  name_prefix                 = "worker-node"
  security_groups             = [aws_security_group.esk-worker-node-sg.id]
  associate_public_ip_address = true
  user_data_base64            = base64encode(local.demo-node-userdata)
  # key_name =temp 
}


resource "aws_autoscaling_group" "eks_ags" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  launch_configuration = aws_launch_configuration.eks-worker.id
  name                 = "EKS ASG"
  vpc_zone_identifier  = aws_subnet.public_subnet.*.id

  tag {
    key                 = "Name"
    value               = "EKS ASG"
    propagate_at_launch = true
  }
  tag {
    key                 = "kubernetes.io/cluster/${var.cluster-name}"
    value               = "owned"
    propagate_at_launch = true


  }
}


