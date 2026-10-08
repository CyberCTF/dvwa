#!/bin/sh
# admin / password logs in, which proves the init job created the database.
set -e
jar=$(mktemp)
token=$(curl -fsS -c "$jar" -b "$jar" http://dvwa/login.php | sed -n "s/.*name='user_token' value='\([0-9a-f]*\)'.*/\1/p" | head -n 1)
curl -fsS -c "$jar" -b "$jar" -o /dev/null --data "username=admin&password=password&Login=Login&user_token=$token" http://dvwa/login.php
curl -fsS -c "$jar" -b "$jar" http://dvwa/index.php | grep -q "Welcome to Damn Vulnerable Web Application"
