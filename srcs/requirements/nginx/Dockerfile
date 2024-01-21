#Lates stable version of Debian
FROM debian:bookworm

RUN apt update
#installs nginx and -y makes sure that all prompts are answered with yes not to pause the installation
RUN apt install -y nginx
RUN apt install -y openssl

RUN mkdir -p /etc/nginx/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	#private key
	-keyout /etc/nginx/certs/lkavalia.key \
	#public certificate
	-out /etc/nginx/certs/lkavalia.crt \
	-subj "/L=Wolfsburg/CN=localhost"

#Copy my configuration to the nginx configuration
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

#For documentation purposes
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]