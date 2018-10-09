#!/bin/bash

curl "http://localhost:4741/forecast" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --data '{
    "forecasts": {
      "latitude": "'"${LATITUDE}"'",
      "longitude": "'"${LONGITUDE}"'"
    }
  }'

echo
