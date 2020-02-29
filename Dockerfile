FROM node:8-alpine

WORKDIR /code

COPY package.json /code
COPY package-lock.json /code

RUN npm config set registry https://registry.npm.taobao.org && \
    npm install pm2 -g && \
    npm install

COPY . /code

RUN npm run build

EXPOSE 7300

CMD NODE_ENV=production pm2-runtime --json app.js
