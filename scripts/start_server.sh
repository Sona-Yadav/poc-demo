#!/bin/bash
set -e
APP_DIR=/home/ec2-user/app
cd $APP_DIR

REGION="us-east-1"

# Fetch parameters from Parameter Store (SecureString)
DB_PASS=$(aws ssm get-parameter --name "/myapp/db_password" --with-decryption --query "Parameter.Value" --output text --region $REGION || true)
DB_USER=$(aws ssm get-parameter --name "/myapp/db_user" --with-decryption --query "Parameter.Value" --output text --region $REGION || true)
DB_HOST=$(aws ssm get-parameter --name "/myapp/db_host" --with-decryption --query "Parameter.Value" --output text --region $REGION || true)
export DB_PASS DB_USER DB_HOST

echo "[start_server] DB_USER=$DB_USER DB_HOST=$DB_HOST"

ARTIFACT_LOG="$APP_DIR/server.log"
nohup php -S 0.0.0.0:80 -t $APP_DIR > "$ARTIFACT_LOG" 2>&1 &
PID=$!
echo $PID > $APP_DIR/server.pid
echo "[start_server] php server started with PID $PID"
