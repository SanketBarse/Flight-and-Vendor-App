#!/bin/bash

#-------------------------------------------------------------------
#  This script expects the following environment variables
#     HUB_HOST
#     BROWSER
#     THREAD_COUNT
#     TEST_SUITE
#-------------------------------------------------------------------

# Let's print what we have received
echo "-------------------------------------------"
echo "HUB_HOST      : ${HUB_HOST:-hub}"
echo "BROWSER       : ${BROWSER}"
echo "TEST_SUITE    : ${TEST_SUITE}"
echo "-------------------------------------------"

# Do not start the tests immediately. Hub has to be ready with browser nodes
echo "Checking if hub is ready..!"
count=0
while [ "$( curl -s http://${HUB_HOST}:4444/status | jq -r .value.ready )" != "true" ]

do
  echo  "$( curl http://${HUB_HOST}:4444/status | jq -r .value.ready)"
  echo "http://${HUB_HOST}:4444/status"
  count=$((count+1))
  echo "Attempt: ${count}"
  if [ "$count" -ge 30 ]
  then
      echo "**** HUB IS NOT READY WITHIN 30 SECONDS ****"
      exit 1
  fi
  sleep 1
done

# At this point, selenium grid should be up!
echo "Selenium Grid is up and running. Running the test...."

# Start the java command
java -cp "libs/*" \
    -Dbrowser=${BROWSER} \
    -Dselenium_grid_enable=true \
    -Dselenium_grid_hub_host=${HUB_HOST} \
    org.testng.TestNG \
    test-suits/${TEST_SUITE}