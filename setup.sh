#!/usr/bin/env bash

set -eou pipefail

setup () {
  readonly DIR="$(dirname "$0")"

  . "${DIR}/all.sh"

setup
