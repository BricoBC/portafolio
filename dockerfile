# Utiliza una imagen base con Node.js y NPM
FROM node:18-alpine

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo de configuración de dependencias e instala las dependencias
COPY package*.json ./
RUN npm install

# Copia el resto de la aplicación
COPY . .

# Construye la aplicación Quasar para producción
RUN npm run build

# Configura Nginx como servidor web
FROM nginx:alpine

# Copia los archivos generados de Quasar a la carpeta de Nginx
COPY --from=0 /app/dist /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Comando para arrancar Nginx
CMD ["nginx", "-g", "daemon off;"]
