#!/bin/sh

telegram-bot-api --http-port=8081 --http-stat-port=8082 --local --dir=/app --temp-dir=/tmp/app
