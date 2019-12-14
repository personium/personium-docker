#!/bin/bash

ES_URL=elasticsearch:9200

for i in {1..30}; do
  RESULT=$(curl --silent --fail ${ES_URL}/_cat/health?h=status)
  if [ $? -eq 0 -a "${RESULT}" = green ]; then
    >&2 echo "Elasticsearch status is green"
    ./catalina.sh run
    exit 0
  else
     >&2 echo "Check status(${i}): ${RESULT}"
    sleep 10
  fi
done

>&2 echo "Elastic search is unavailable - Timeout"
exit 1
