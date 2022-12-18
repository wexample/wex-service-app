#!/usr/bin/env bash

WEX_DIR_PROXY=$([[ "$(uname -s)" == Darwin ]] && echo /Users/.wex/server/ || echo /opt/wex_server/) # /opt can't be mounted on macos, using Users instead.

export WEX_APPS_ENVIRONMENTS=(local dev prod)
export WEX_DIR_APP_DATA=.wex/
export WEX_DIR_APP_TMP=${WEX_DIR_APP_DATA}tmp/
export WEX_DIR_PROXY
export WEX_DIR_PROXY_TMP=${WEX_DIR_PROXY}tmp/
export WEX_FILE_APP_ENV=.env
export WEX_FILEPATH_REL_APP_ENV=${WEX_DIR_APP_DATA}${WEX_FILE_APP_ENV}
export WEX_FILEPATH_REL_COMPOSE_BUILD_YML=${WEX_DIR_APP_TMP}docker-compose.build.yml
export WEX_FILEPATH_REL_CONFIG_BUILD=${WEX_DIR_APP_TMP}config.build
export WEX_FILEPATH_REL_CONFIG=${WEX_DIR_APP_DATA}config
export WEX_PROXY_APPS_REGISTRY=${WEX_DIR_PROXY_TMP}apps

_wexAppGoTo() {
  local LOCATION

  LOCATION=$(wex app::app/locate -d="${DIR}")
  if [ "${LOCATION}" = "" ]; then
    _wexError "No app found"
    exit 0
  fi

  cd "${LOCATION}"
}
