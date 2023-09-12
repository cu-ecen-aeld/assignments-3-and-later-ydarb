#!/usr/bin/env bash

set -ueo pipefail

declare filesdir="${1:-}"
declare searchstr="${2:-}"

if [[ -z "${filesdir}" ]]; then
    echo "ERROR: First positional argument 'filesdir' must be provided."
    exit 1
fi
if [[ -z "${searchstr}" ]]; then
    echo "ERROR: Second positional argument 'searchstr' must be provided."
    exit 1
fi

if [[ ! -d "${filesdir}" ]]; then
    echo "ERROR: '${filesdir}' does not exist on the filesystem."
    exit 1
fi

declare num_files
num_files=$(find "${filesdir}" -type f | wc -l | awk '{print $1}')

declare num_matching_lines
num_matching_lines=$(grep -r "${searchstr}" "${filesdir}" | wc -l)

echo "The number of files are ${num_files} and the number of matching lines are ${num_matching_lines}"
