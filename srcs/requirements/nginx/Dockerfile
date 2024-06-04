
FROM alpine:3.19.0

RUN echo "Starting to build the image with debian:bookworm"

RUN apk update

RUN apk add --no-cache nginx openssl

RUN mkdir -p /etc/nginx/certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	#private key
	-keyout /etc/nginx/certs/lkavalia.key \
	#public certificate
	-out /etc/nginx/certs/lkavalia.crt \
	-subj "/L=Wolfsburg/CN=localhost"

#Copy my configuration to the nginx configuration
COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

#For documentation purposes
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]