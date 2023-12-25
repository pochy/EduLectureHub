FROM node:20.10.0-bullseye as base
WORKDIR /app

FROM base as bundle
COPY package-lock.json /app/package-lock.json
COPY package.json /app/package.json
RUN apt update && npm install

FROM bundle as main
COPY . .
EXPOSE 5173
CMD ["npm", "run", "dev"]