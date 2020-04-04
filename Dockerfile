FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

CMD ["npm", "run", "build"]

FROM nginx as deploy
COPY --from=builder "/app/build" "/usr/share/nginx/html"
ENV DEFAULT_HOST=damp.dev

