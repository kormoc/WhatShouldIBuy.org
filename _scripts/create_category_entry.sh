#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

category="${1}"
filepath="${2}"

TMP=$(mktemp)

echo "Generating '${filepath}' using category template '${category}'"

echo "---" >> "${TMP}"
yq '.Template.[].[] | map_values((parent | key + "/") + .) | .[] + ":" ' "_data/category/${category}/_template.yml" | \
    egrep -v "/Total:$" \
    >> "${TMP}"
cat << EOF >> "${TMP}"

Reviews:
  - Site: TBD
    Url: TBD
    Rating: TBD

Notes: |+
  Any Additional Interesting Technical Notes would go here
EOF

if [[ -f "${filepath}" ]]
then
    yq --inplace ea '. as $item ireduce ({}; . * $item )'  "${TMP}" "${filepath}"
fi

cat "${TMP}" > "${filepath}"

rm "${TMP}"
