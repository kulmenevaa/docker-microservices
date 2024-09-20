# Node
FROM node:20-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

# Nginx
FROM nginx:1.21-alpine

COPY ./.docker/nginx.conf /etc/nginx/nginx.conf
COPY ./.docker/entrypoint.sh /usr/local/bin/

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build ./app/dist/ /usr/share/nginx/html/

EXPOSE 80

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
