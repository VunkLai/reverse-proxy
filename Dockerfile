FROM nginx:1.25-alpine

COPY ./nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY ./ssl /etc/nginx/ssl

EXPOSE 80
EXPOSE 443
