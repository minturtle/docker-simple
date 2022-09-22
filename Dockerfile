## 1단계 : 빌드 스테이지
FROM node:14 as builder
 
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY src ./src

COPY public ./public

CMD ["npm", "run", "build"]

##2단계 RUN 스테이지
FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html