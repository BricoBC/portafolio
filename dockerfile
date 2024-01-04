#Descargo la imamgen
FROM node:18-alpine

#En la máquina virtual de Docker se crea la carpeta
RUN mkdir -p /home/appPortafolio/

# Copia desde el sistema anfitrio al de Docker
COPY . /home/appPortafolio

WORKDIR /home/appPortafolio
RUN npm install

# Puerto al cual se conecta el sistema anfitrio a la aplicación cuando Docker lo ejecuta
EXPOSE 9000

#En la ruta, se abre la terminal y se ejecuta lo siguiente:
CMD [ "npm","run", "dev"]
