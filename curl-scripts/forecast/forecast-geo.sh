#!/bin/bash

curl "http://localhost:4741/forecast/${CITY}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \


echo
