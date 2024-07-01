#!/usr/bin/env bash

scriptDir=$(dirname -- "$(readlink -f -- "$BASH_SOURCE")")
SERVICES_CONFIG_FILE=$scriptDir"/../../services_config.yml"

ORCHESTRATOR_URL=$(grep 'ORCHESTRATOR_URL' "$SERVICES_CONFIG_FILE" | cut -d ':' -f 2 | tr -d '[:space:]' | tr -d '"')
ORCHESTRATOR_PORT=$(grep 'ORCHESTRATOR_PORT' "$SERVICES_CONFIG_FILE" | cut -d ':' -f 2 | tr -d '[:space:]' | tr -d '"')
COUCHDB_URL=$(grep 'COUCHDB_URL' "$SERVICES_CONFIG_FILE" | cut -d ':' -f 2 | tr -d '[:space:]' | tr -d '"')
COUCHDB_PORT=$(grep 'COUCHDB_PORT' "$SERVICES_CONFIG_FILE" | cut -d ':' -f 2 | tr -d '[:space:]' | tr -d '"')

if [ -z "${ORCHESTRATOR_URL}" ]
then
      #ORCHESTRATOR_URL="orchestrator"
      ORCHESTRATOR_URL=$orchestrator_url
fi

if [ -z "${ORCHESTRATOR_PORT}" ]
then
      #ORCHESTRATOR_PORT="5000"
      ORCHESTRATOR_PORT=$orchestrator_port
fi

if [ -z "${ORCHESTRATOR_BASE_PATH}" ]
then
      URL="${ORCHESTRATOR_URL}:${ORCHESTRATOR_PORT}"
else
      URL="${ORCHESTRATOR_URL}:${ORCHESTRATOR_PORT}/${ORCHESTRATOR_BASE_PATH}"
fi
export ORCHESTRATOR_REST_URL=${URL}



if [ -z "${COUCHDB_URL}" ]
then
      #COUCHDB_URL="couchdb"
      COUCHDB_URL=$couchdb_url
fi

if [ -z "${COUCHDB_PORT}" ]
then
      #COUCHDB_PORT="5984"
      COUCHDB_PORT=$couchdb_port
fi

if [ -z "${COUCHDB_BASE_PATH}" ]
then
      URL="${COUCHDB_URL}:${COUCHDB_PORT}"
else
      URL="${COUCHDB_URL}:${COUCHDB_PORT}/${COUCHDB_BASE_PATH}"
fi
export COUCHDB_REST_URL=${URL}
