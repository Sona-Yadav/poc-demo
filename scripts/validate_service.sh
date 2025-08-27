#!/bin/bash
set -e
curl --fail http://localhost/ || (echo "service validation failed" && exit 1)
echo "service validation passed"
