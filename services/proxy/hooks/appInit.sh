#!/usr/bin/env bash

proxyAppInit() {
  local SERVICE_DIR=$(wex app::service/dir -s="proxy")

  cp -R "${SERVICE_DIR}samples/proxy" .
  cp -R "${SERVICE_DIR}samples/tmp" .
}