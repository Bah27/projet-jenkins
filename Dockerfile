FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y
ADD static-website-example/ /var/www/html/
RUN useradd -m myuser
USER myuser
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
