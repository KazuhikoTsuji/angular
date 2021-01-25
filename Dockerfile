FROM node:alpine as BUILD
WORKDIR '/app'
COPY package.json .
RUN npm install -g npm@7.4.3
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=BUILD /app/dist/my-dream-app /usr/share/nginx/html