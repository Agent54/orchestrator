#!/bin/bash

# TODO: is this not possible declaratively?

# Wait for Kibana to be ready
echo "Waiting for Kibana to be ready..."
until curl -s http://localhost:5601/api/status | grep -q '"overall":{"level":"available"}'
do
  echo "Kibana not ready yet, waiting..."
  sleep 5
done

echo "Kibana is ready, creating index patterns..."

# Create Docker logs index pattern
curl -X POST "localhost:5601/api/saved_objects/index-pattern/docker-logs-*" \
  -H 'Content-Type: application/json' \
  -H 'kbn-xsrf: true' \
  -d '{
    "attributes": {
      "title": "docker-logs-*",
      "timeFieldName": "@timestamp"
    }
  }'

# Create Request logs index pattern
curl -X POST "localhost:5601/api/saved_objects/index-pattern/request-logs-*" \
  -H 'Content-Type: application/json' \
  -H 'kbn-xsrf: true' \
  -d '{
    "attributes": {
      "title": "request-logs-*",
      "timeFieldName": "@timestamp"
    }
  }'

# Create Activity logs index pattern
curl -X POST "localhost:5601/api/saved_objects/index-pattern/activity-logs-*" \
  -H 'Content-Type: application/json' \
  -H 'kbn-xsrf: true' \
  -d '{
    "attributes": {
      "title": "activity-logs-*",
      "timeFieldName": "@timestamp"
    }
  }'

# Create Console logs index pattern
curl -X POST "localhost:5601/api/saved_objects/index-pattern/console-logs-*" \
  -H 'Content-Type: application/json' \
  -H 'kbn-xsrf: true' \
  -d '{
    "attributes": {
      "title": "console-logs-*",
      "timeFieldName": "@timestamp"
    }
  }'

echo "Index patterns created successfully!" 