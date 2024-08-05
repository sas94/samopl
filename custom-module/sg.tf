
# resource "aws_security_group" "alb" {
#   name        = "alb-sg"
#   description = "alb-sg"
#   vpc_id      = aws_vpc.main.id
# }

# resource "aws_security_group_rule" "alb-eg-all" {
#   security_group_id = aws_security_group.alb.id
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "alb-ingress-80" {
#   security_group_id = aws_security_group.alb.id
#   type              = "ingress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "alb"
# }

# resource "aws_security_group_rule" "alb-ingress-3000" {
#   security_group_id = aws_security_group.alb.id
#   type              = "ingress"
#   from_port         = 3000
#   to_port           = 3000
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "alb"
# }

# resource "aws_security_group_rule" "alb-ingress-4001" {
#   security_group_id = aws_security_group.alb.id
#   type              = "ingress"
#   from_port         = 4001
#   to_port           = 4001
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "alb"
# }

# resource "aws_security_group_rule" "alb-ingress-22" {
#   security_group_id = aws_security_group.alb.id
#   type              = "ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "alb"
# }



# resource "aws_security_group" "allow-ssh" {
#   vpc_id      = aws_vpc.main.id
#   name        = "allow-ssh"
#   description = "security group that allows ssh and all egress traffic"
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port = 3000
#     to_port   = 3000
#     protocol  = "TCP"
#     security_groups = [
#       aws_security_group.alb.id
#     ]
#   }
#   ingress {
#     from_port = 4001
#     to_port   = 4001
#     protocol  = "TCP"
#     security_groups = [
#       aws_security_group.alb.id
#     ]
#   }
#   tags = {
#     Name = "service-SG"
#   }
# }



# ############################
# resource "aws_security_group" "test" {
#   name        = "alb-test"
#   description = "alb-sg"
#   vpc_id      = aws_vpc.main.id
# }

# resource "aws_security_group_rule" "alb-test-all" {
#   security_group_id = aws_security_group.test.id
#   type              = "egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "alb-test-ig-all" {
#   security_group_id = aws_security_group.test.id
#   type              = "ingress"
#   from_port         = 0
#   to_port           = 65535
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "alb"
# }
