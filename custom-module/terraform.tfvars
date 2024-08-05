cluster_name=""

container_default= {
    cpu=512
    memory=256
    essential=true
    default_port = [
    {
      containerPort = 3000
      hostPort      = 3000
    }
  ]
}
