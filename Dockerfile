FROM ubuntu
#FROM nginx:alpine
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y nginx git
#ADD static-website-example/ /var/www/html/
RUN git clone https://github.com/diranetafen/static-website-example.git /var/www/html/
RUN useradd -m myuser
USER myuser
COPY nginx.conf /etc/nginx/conf.d/default.conf
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
