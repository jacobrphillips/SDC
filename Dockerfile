FROM node:lts-alpine
WORKDIR /usr/app
COPY package*.json ./
RUN npm install
COPY . .
WORKDIR /usr/app/server
RUN npm install
WORKDIR /usr/app
EXPOSE 3000:3010
CMD ["npm","run dev"]