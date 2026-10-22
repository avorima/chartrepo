#!/usr/bin/env bash

set -o errexit
set -o pipefail

CHART_NAME=${1?missing chart name}
CHART_REF=${2?missing chart ref}

if [[ $CHART_REF =~ oci://.* ]]; then
    rm -rf charts/"$CHART_NAME"
    helm pull --untar --untardir charts/ "$CHART_REF"
else
    echo "must provide OCI chart" >&2
    exit 1
fi
