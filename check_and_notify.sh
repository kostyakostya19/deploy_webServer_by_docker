#!/bin/bash

source ./config.sh

#function all_services_healthy {
#  [[ $(docker-compose ps | awk '{print $4}' | grep -c "healthy") -eq 3 ]]
#}

function all_services_healthy {
    healthy_count=$(docker ps --filter "health=healthy" --format "{{.Names}}" | wc -l)
    if [ "$healthy_count" -eq 3 ]; then
        return 0
    else
        return 1
    fi
}

until all_services_healthy; do
    echo "waiting for all services to be healthy"
    sleep 10
done

MESSAGE="all containers are up and running"
curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d chat_id="$CHAT_ID" -d text="$MESSAGE"
