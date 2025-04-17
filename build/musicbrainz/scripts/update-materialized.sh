#!/bin/bash

set -e

dockerize -wait "tcp://${MUSICBRAINZ_POSTGRES_SERVER}:5432" -timeout 60s sleep 0
exec carton exec -- ./admin/BuildMaterializedTables --force --database=MAINTENANCE all
