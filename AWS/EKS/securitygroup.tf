# Cluster
resource "aws_security_group" "eks-sg" {
  name_prefix = "EKS-Cluster"
  vpc_id      = aws_vpc.main.id
  description = "Security Group For EKS"
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

  }
}

resource "aws_security_group_rule" "conn-workstation-cluster" {
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Connect This PC To The Cluster"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  type              = "ingress"
  security_group_id = aws_security_group.eks-sg.id

}

resource "aws_security_group_rule" "conn-pods" {
  description              = "Rule To Communicate Between Pods"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks-sg.id
  source_security_group_id = aws_security_group.esk-worker-node-sg.id
  type                     = "ingress"
}




#Worker-Node

resource "aws_security_group" "esk-worker-node-sg" {
  name_prefix = "EKS-Worker"
  vpc_id      = aws_vpc.main.id
  description = "SG For EKS Worker"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

  }
  tags = {
    "Name"                                      = "worker-node-sg"
    "kubernetes.io/cluster/${var.cluster-name}" = "owned"
  }
}


resource "aws_security_group_rule" "comm-pod" {
  description              = "Allows Communication Between Pods"
  from_port                = 0
  to_port                  = 65535
  security_group_id        = aws_security_group.esk-worker-node-sg.id
  source_security_group_id = aws_security_group.esk-worker-node-sg.id
  protocol                 = "tcp"
  type                     = "ingress"
}

resource "aws_security_group_rule" "comm-kubectl" {
  description              = "Allows Communication Between Kubectl And Pods"
  from_port                = 1025
  to_port                  = 65535
  security_group_id        = aws_security_group.esk-worker-node-sg.id
  source_security_group_id = aws_security_group.eks-sg.id
  protocol                 = "tcp"
  type                     = "ingress"
}




# resource "aws_security_group_rule" "conn-alb" {
#   description              = "Allows Connection From ALB"
#   from_port                = 0
#   to_port                  = 65535
#   source_security_group_id = aws_security_group.eks_alb.id
#   security_group_id        = aws_security_group.esk-worker-node-sg.id
#   protocol                 = "tcp"
#   type                     = "ingress"

# }





# #ALB

# resource "aws_security_group" "eks_alb" {
#   vpc_id      = aws_vpc.main.id
#   description = "Allows External Communication"
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]

#   }
#   tags = {
#     name = "SG For ALB"

#   }

# }

# resource "aws_security_group_rule" "allow_http" {
#   from_port                = 80
#   to_port                  = 80
#   protocol                 = "tcp"
#   type                     = "ingress"
#   source_security_group_id = aws_security_group.esk-worker-node-sg.id
#   security_group_id        = aws_security_group.eks_alb.id

# }
# resource "aws_security_group_rule" "allow_https" {
#   from_port                = 443
#   to_port                  = 443
#   protocol                 = "tcp"
#   type                     = "ingress"
#   source_security_group_id = aws_security_group.esk-worker-node-sg.id
#   security_group_id        = aws_security_group.eks_alb.id

# }
# resource "aws_security_group_rule" "allow_worker_nodes" {
#   from_port                = 0
#   to_port                  = 65535
#   protocol                 = "tcp"
#   type                     = "ingress"
#   source_security_group_id = aws_security_group.esk-worker-node-sg.id
#   security_group_id        = aws_security_group.eks_alb.id

# }
