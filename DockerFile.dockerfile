FROM node:alpine as build
WORKDIR /app
COPY package.json ./
RUN yarn install
COPY ..
RUN yarn build

FROM nginx:alpine
COPY --from=builder /app/build/usr/share/nginx/html
