FROM nginx

EXPOSE 80

RUN echo '\
server {\n\
  listen 80 default_server;\n\
  listen [::]:80 default_server;\n\
  server_name _;\n\
  server_tokens off;\n\
  return 301 https://www.ebre.se$request_uri;\n\
}\n\
server {\n\
  listen 443 ssl http;\n\
  listen [::]:443 ssl http;\n\
  ssl on;\n\
  ssl_certificate /etc/ssl/nginx.crt;\n\
  ssl_certificate_key /etc/ssl/nginx.key;\n\
  server_name _;\n\
  server_tokens off;\n\
  return 301 https://www.ebre.se$request_uri;\n\
}' > /etc/nginx/conf.d/default.conf
