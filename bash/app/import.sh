#!/usr/bin/env bash

appImportArgs() {
  _NEEDS_APP_LOCATION=true
  # shellcheck disable=SC2034
  _ARGUMENTS=(
    "${WEX_APP_ARG_APP_DIR}"
  )
}

appImport() {
  wex-exec hook/exec -c=appImport
}
