#!/usr/bin/env bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NO_COLOR='\033[0m'

handle_err() {
  local line=$1
  local command=$2
  echo -e "${RED}An error occurred at $line, when running '$command'. See above for more information."
  exit 1
}

trap 'handle_err ${LINENO} "${BASH_COMMAND}"' ERR

it() {
  echo -e "${GREEN}${1}${NO_COLOR}"
}

end() {
  echo -e "${GREEN}Success${NO_COLOR}"
}

it "should have packer installed"
  packer --version
end

it "should have ansible installed"
  ansible --version
end

it "should have ssh installed"
  ssh -V
end
