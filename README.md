# How to run:
- add mysql variables:
```
touch ./env

cat <<EOF >> ./ansbile.cfg 
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress_user
MYSQL_PASSWORD=your_password
MYSQL_ROOT_PASSWORD=root_password
EOF
```
- add tg creds:
```
touch ./config.sh

cat <<EOF >> ./config.sh
TOKEN=
CHAT_ID=
EOF
```
- run docker compose and notify script
```
docker-compose up -d && ./check_and_notify.sh
```
