# FIRST STAGE

FROM node:latest AS build

WORKDIR /app

COPY package*.json ./

RUN npm install -y

COPY . .

# SECOND STAGE

FROM node:20-alpine

WORKDIR /app

COPY --from=build /app .

EXPOSE 3001

CMD ["npm", "start"]
