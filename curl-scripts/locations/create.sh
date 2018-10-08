#!/bin/bash

curl "http://localhost:4741/locations" \
  --include \
  --request POST \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "locations": {
      "city": "'"${CITY}"'",
      "state": "'"${STATE}"'",
      "latitude": "'"${LATITUDE}"'",
      "longitude": "'"${LONGITUDE}"'",
      "user_id": "'"${USER_ID}"'"
    }
  }'

echo
