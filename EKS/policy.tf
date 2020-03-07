#Roles For EKS Master Node
resource "aws_iam_role" "eks_cluster_role" {
    description="EKS Cluster Role"
    assume_role_policy = file("cluster-policy.json")
    name_prefix="EKS_Cluster_role"
}

resource "aws_iam_role_policy_attachment" "eks_service" {
    policy_arn ="arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
    role = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cluster" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks_cluster_role.name

}

# Roles For Worker Nodes
resource "aws_iam_role" "eks_worker_role" {
    description ="EKS Worker Role"
    assume_role_policy = file("worker-policy.json")
    name_prefix = "EKS_Worker_Role"
}


resource "aws_iam_role_policy_attachment" "eks_wn_p" {
    policy_arn="arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role=aws_iam_role.eks_worker_role.name
}
resource "aws_iam_role_policy_attachment" "eks_cni_p" {
    policy_arn="arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role=aws_iam_role.eks_worker_role.name
}
resource "aws_iam_role_policy_attachment" "eks_cr_p" {
    policy_arn="arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role=aws_iam_role.eks_worker_role.name
}
