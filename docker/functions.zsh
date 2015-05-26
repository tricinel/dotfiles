function docker-point {
  eval "$(docker-machine env $1)"
}