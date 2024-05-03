FROM node:21-alpine

WORKDIR /app

RUN npm install -g npm@latest pnpm typescript

COPY package*.json /app
COPY pnpm-lock.yaml /app
COPY tsconfig*.json /app

RUN pnpm install --prod
COPY ./srcs /app/srcs

CMD [ "pnpm", "build" ]
