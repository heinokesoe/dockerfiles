#!/bin/sh

/app/telepush -address 0.0.0.0 -disableIPv6 -dataDir /srv/data -mode webhook -whitelist /srv/data/whitelist.txt -token ${BOT_TOKEN}
