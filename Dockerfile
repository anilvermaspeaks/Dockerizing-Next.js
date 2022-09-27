FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
RUN npm build && npm --production

FROM node:alpine
WORKDIR /app
COPY --from=builder /app .
EXPOSE 3000
CMD ["node_modules/.bin/next", "start"]
