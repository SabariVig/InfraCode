resource "aws_security_group" "eks-sg" {
    vpc_id = aws_vpc.main.id
    description="Security Group For EKS"
    egress {
        cidr_blocks=["0.0.0.0/0"]
        from_port=0
        to_port=0
        protocol="-1"

    }
    ingress{
        cidr_blocks =["0.0.0.0/0"]
        from_port=0
        to_port=0
        protocol="-1"
    }
}


