locals {
  ecs_services = {
    for service_name, service in var.application.services : service_name => {
      container_configuration = [
        for container in service.container_configuration : {
          name              = container.name
          essential         = try(container.essential,var.container_default.essential)
          image             = container.image
          cpu               = try(container.cpu, var.container_default.cpu)
          memoryReservation = try(container.memoryReservation, var.container_default.memory)
          dependsOn         = try(
                                contains(keys(container), "dependsOn") && container.dependsOn ? [
                                  {
                                    containerName = "${container.name}-migration"
                                    condition     = "COMPLETE"
                                  }
                                ] : [],
                                []
                              )
          portMappings      = (
                                [
                                  {
                                    containerPort = container.port
                                    protocol      = "tcp"
                                    hostPort      = container.port
                                  }
                                ]
                              )
          environment       = try(container.environment, var.common_environment_vars)
          environmentFiles  = try(container.environmentFiles, [])
        }
      ]
    }
  }
}
