FROM node:14

WORKDIR /app

COPY . .

RUN npm install

EXPOSE 8093

CMD ["node", "app.js"]


