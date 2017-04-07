#!/bin/bash
cd /home/mastodon
# Run jobs:
docker-compose run --rm web rake mastodon:media:clear
docker-compose run --rm web rake mastodon:push:refresh
docker-compose run --rm web rake mastodon:push:clear
docker-compose run --rm web rake mastodon:feeds:clear
