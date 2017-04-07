#!/bin/bash
cd /home/mastodon
echo -e "Checking for update.."
git remote update
UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")
if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date. No need to continue."
    exit 0
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull - "
    echo "Pulling in 10 seconds. CTRL+C to cancel.."
    sleep 10
    docker-compose stop
    git pull
    docker-compose build
    docker-compose run --rm web rails db:migrate
    docker-compose run --rm web rails assets:precompile
    docker-compose build
    docker-compose up -d
	systemctl restart nginx.service
elif [ $REMOTE = $BASE ]; then
    echo "Need to push - nothing to do."
    exit 0
else
    echo "Diverged. Oops."
    exit 0
fi
exit 0

# docker-compose stop && docker-compose up -d
# systemctl restart nginx.server
