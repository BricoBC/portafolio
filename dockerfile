# Etapa 1: Construir la aplicación Quasar
FROM node:18-alpine AS builder

WORKDIR /app

# Copia solo los archivos necesarios para instalar dependencias
COPY package*.json ./

# Instala dependencias
RUN npm install

# Copia el resto de la aplicación
COPY . .

# Construye la aplicación Quasar para producción
RUN npm run build

# Etapa 2: Configurar Nginx y copiar los archivos generados por Quasar
FROM nginx:stable-alpine

# Copia solo los archivos necesarios de la etapa de construcción
COPY --from=builder /app/dist /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Comando para arrancar Nginx
CMD ["nginx", "-g", "daemon off;"]
