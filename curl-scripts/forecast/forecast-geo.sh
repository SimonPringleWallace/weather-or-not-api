#!/bin/bash

curl "https://weather-or-not-api.herokuapp.com/forecast/${CITY}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \


echo
