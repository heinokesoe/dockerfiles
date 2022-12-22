#!/bin/sh

/app/telepush -mode webhook -whitelist /srv/data/whitelist.txt -token ${BOT_TOKEN}
