FROM node:alpine as builder
WORKDIR '/app'
COPY package.json . 
# copying in root directory
RUN npm install 
COPY . . 
# copying from local machine to container
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

