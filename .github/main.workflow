workflow "New workflow" {
  on = "push"
  resolves = ["Docker push"]
}

action "Docker build" {
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  args = "build -t preetamjinka/contrast-notes:latest ."
  needs = ["Docker login"]
}

action "Docker push" {
  uses = "actions/docker/cli@86ff551d26008267bb89ac11198ba7f1d807b699"
  args = "push preetamjinka/contrast-notes:latest"
  needs = ["Docker build"]
}

action "Docker login" {
  uses = "actions/docker/login@master"
  args = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}
