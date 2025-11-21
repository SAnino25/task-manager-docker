# Usar Node.js como base
FROM node:18-alpine

# Información del mantenedor
LABEL maintainer="marino.aricur@educa.jcyl.es"
LABEL description="Task Manager App con Node.js y Express"

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install --production

# Copiar el código de la aplicación
COPY . .

# Exponer el puerto
EXPOSE 3000

# Variables de entorno por defecto
ENV NODE_ENV=production
ENV MONGO_URL=mongodb://mongodb:27017/taskdb

# Comando para ejecutar la aplicación
CMD ["node", "app.js"]