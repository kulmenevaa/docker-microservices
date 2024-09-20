FROM nginx:1.21-alpine

ARG STAGE=${STAGE}
COPY ./.docker/nginx/${STAGE}/default.conf /etc/nginx/conf.d/default.conf
COPY ./.docker/nginx/${STAGE}/entrypoint.sh /usr/local/bin/

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]