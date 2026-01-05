#!/bin/bash

# optional to use an entrypoint script
# but not currently used in this setup
# and ENTRYPOINT is commented out in Dockerfile
# as keeping it simple for now
# to re-enable this approach,
# uncomment the relevant lines in Dockerfile
# and rename this file to entrypoint.sh

set -e

# Install JS dependencies if needed
# I think this is being done in the Dockerfile already
# if [ -f yarn.lock ]; then
#   yarn install --check-files
# fi

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Start Rails server (default CMD)
exec "$@"
