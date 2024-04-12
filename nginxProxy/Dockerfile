FROM nginx:latest

RUN apt update && apt install -y git \
&& rm /etc/nginx/conf.d/default.conf \
&& git clone https://github.com/vishnevayakostochka/configs.git /tmp/configs/ \
&& mv /tmp/configs/toDocker/nginx.conf /etc/nginx/conf.d/ \
&& rm -r /tmp/configs/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
