#!/bin/bash
set -e

bin/airbnbex eval "HostSync.Release.migrate"
bin/airbnbex start

exec "$@"
