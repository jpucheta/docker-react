FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Cada bloque arranca con un FROM cuando encuentra otro bloque, termina el anterior
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# no hace falta pasarle el comando para iniciar nginx, lo va a iniciar solo