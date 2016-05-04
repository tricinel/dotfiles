function docker-point {
  eval "$(docker-machine env $1)"
}

function dcm-use {
  docker-machine start $@ && eval "$(docker-machine env $@)"
  echo "Active machine: ${DOCKER_MACHINE_NAME}"
}

function dcm-stop {
  if [[ $1 ]]; then
    docker-machine stop $1
  else
    docker-machine stop ${DOCKER_MACHINE_NAME}
  fi
}