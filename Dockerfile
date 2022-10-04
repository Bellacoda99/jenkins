FROM node:lts-alpine
WORKDIR /usr/src/app
COPY app/package*.json ./
RUN ls -l
RUN npm install
COPY app ./
RUN ls -l
COPY app/app.js dist/app.js
WORKDIR /usr/src/app/dist
EXPOSE 3000
CMD [ "node", "app.js" ]
