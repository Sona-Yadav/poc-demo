#!/bin/bash
# Wait and check if service is running on port 80
for i in {1..10}
do
  if curl -s http://localhost:80 > /dev/null
  then
    echo "Service is running."
    exit 0
  else
    echo "Service not up yet. Retrying in 5s..."
    sleep 5
  fi
done

echo "Service validation failed after retries."
exit 1
