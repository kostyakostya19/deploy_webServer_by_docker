# Вопрос/Ответ
1. Работал только с докер, не было потребности в использовании других инструментов;
2. Любой оркестратор, если требуется автоскейлинг.

# Что можно улучшить:
- Автоматичнское добавление БД-credentials в конфиг WordPress;
- Обработка со стороны PHP в отдельном контейнере;
- Выполнмть сборку из source на alpine images для всего ПО;
- Строго использовать версионирование родительских images на уровне сборки Dockerfiles.

# Workaround:
- Использован один контейнер для apache и php, т.к. не получилось реализовать интерпретирование php-кода через TCP между контейнерами apache и php (Предположительно проблема заключалась в неправильных nginx-директивах, и из-за некорректного тестирования, это не было выявлено);
- Контейнеры Wordpress и Joomla не создавались отдельно, т.к. это избыточная активность. Реализация wget выполнена на уровне Dockerfiles. Это позволило не создавать лишние volumes на уровне docker-compose.

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