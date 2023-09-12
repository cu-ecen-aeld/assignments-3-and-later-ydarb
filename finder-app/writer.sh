#!/usr/bin/env bash

set -ueo pipefail

declare writefile="${1:-}"
declare writestr="${2:-}"

if [[ -z "${writefile}" ]]; then
    echo "ERROR: First positional argument 'writefile' must be provided."
    exit 1
fi
if [[ -z "${writestr}" ]]; then
    echo "ERROR: Second positional argument 'writestr' must be provided."
    exit 1
fi

if ! mkdir -p "$(dirname "${writefile}")"; then
    echo "ERROR: Failed to create directory: $(dirname "${writefile}")"
    exit 1
fi

if ! echo "${writestr}" > "${writefile}"; then
    echo "ERROR: Failed to write string '${writestr}' to file '${writefile}'"
    exit 1
fi
