# 🐳 Task Manager Docker - Aplicación Multicontenedor

[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=flat&logo=docker)](https://www.docker.com/)
[![Node.js](https://img.shields.io/badge/Node.js-18-339933?style=flat&logo=node.js)](https://nodejs.org/)
[![MongoDB](https://img.shields.io/badge/MongoDB-7.0-47A248?style=flat&logo=mongodb)](https://www.mongodb.com/)

Aplicación web de gestión de tareas desarrollada con **Node.js + Express** y **MongoDB**, desplegada en un entorno multicontenedor con Docker.

## 📋 Descripción

Esta aplicación permite:
- ✅ Crear tareas con título y descripción
- ✅ Marcar tareas como completadas
- ✅ Eliminar tareas
- ✅ Visualización en tiempo real del estado de la base de datos
- ✅ Interfaz web moderna y responsiva

## 🏗️ Arquitectura

La aplicación está compuesta por **2 contenedores**:

1. **webapp**: Contenedor con Node.js + Express (puerto 3000)
2. **mongodb**: Contenedor con MongoDB 7.0 (puerto 27017)

Los contenedores se comunican a través de una **red Docker personalizada** (`app-network`), permitiendo que la aplicación web lea y escriba datos en la base de datos MongoDB.

## 🚀 Requisitos Previos

- [Docker](https://www.docker.com/get-started) instalado (versión 20.10 o superior)
- [Docker Compose](https://docs.docker.com/compose/install/) instalado (versión 2.0 o superior)
- Puerto 3000 y 27017 disponibles en tu máquina

## 📦 Instalación y Despliegue

### 1. Clonar el repositorio

```bash
git clone https://github.com/tu-usuario/task-manager-docker.git
cd task-manager-docker
```

### 2. Construir y levantar los contenedores

```bash
docker-compose up -d --build
```

Este comando:
- Construye la imagen personalizada de la aplicación Node.js
- Descarga la imagen de MongoDB
- Crea la red `app-network`
- Levanta ambos contenedores en segundo plano

### 3. Verificar que los contenedores están corriendo

```bash
docker-compose ps
```

Deberías ver algo similar a:

```
NAME                  IMAGE              STATUS         PORTS
task-manager-app      task-manager-app   Up             0.0.0.0:3000->3000/tcp
task-manager-db       mongo:7.0          Up             0.0.0.0:27017->27017/tcp
```

### 4. Acceder a la aplicación

Abre tu navegador y ve a:

```
http://localhost:3000
```

## 🛠️ Comandos Útiles

### Ver logs de los contenedores

```bash
# Ver todos los logs
docker-compose logs -f

# Ver logs solo de la aplicación
docker-compose logs -f webapp

# Ver logs solo de MongoDB
docker-compose logs -f mongodb
```

### Detener los contenedores

```bash
docker-compose down
```

### Detener y eliminar volúmenes (⚠️ elimina todos los datos)

```bash
docker-compose down -v
```

### Reiniciar los contenedores

```bash
docker-compose restart
```

### Reconstruir las imágenes

```bash
docker-compose up -d --build --force-recreate
```

## 📁 Estructura del Proyecto

```
task-manager-docker/
├── app.js                 # Aplicación principal Node.js + Express
├── package.json           # Dependencias del proyecto
├── Dockerfile            # Imagen personalizada de la aplicación
├── docker-compose.yml    # Configuración multicontenedor
├── .dockerignore         # Archivos excluidos de la imagen
├── public/
│   └── index.html        # Interfaz web frontend
└── README.md             # Este archivo
```

## 🔗 Conexión entre Contenedores

La aplicación web se conecta a MongoDB usando el **nombre del servicio** como hostname:

```javascript
const MONGO_URL = 'mongodb://mongodb:27017/taskdb';
```

Docker Compose resuelve automáticamente el nombre `mongodb` a la IP interna del contenedor de la base de datos dentro de la red `app-network`.

## 🧪 Probar la Aplicación

1. **Agregar una tarea**: Completa el formulario y haz clic en "Agregar Tarea"
2. **Marcar como completada**: Haz clic en el botón ✓
3. **Eliminar tarea**: Haz clic en el botón 🗑️
4. **Verificar persistencia**: Detén y vuelve a levantar los contenedores. Las tareas se mantienen gracias al volumen de MongoDB.

## 📸 Capturas de Pantalla

### Interfaz Principal
![Aplicación funcionando](screenshot.png)

### Estado de la conexión
El indicador en la parte superior muestra el estado de la conexión con MongoDB en tiempo real.

## 🐛 Solución de Problemas

### La aplicación no se conecta a MongoDB

```bash
# Verificar que MongoDB está corriendo
docker-compose logs mongodb

# Reiniciar los contenedores
docker-compose restart
```

### Puerto 3000 ya está en uso

Modifica el puerto en `docker-compose.yml`:

```yaml
ports:
  - "8080:3000"  # Cambiar 3000 por otro puerto disponible
```

### Error al construir la imagen

```bash
# Limpiar caché de Docker
docker system prune -a

# Reconstruir desde cero
docker-compose build --no-cache
```

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:

1. Haz fork del proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Agrega nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 👤 Autor

**Tu Nombre**
- GitHub: [@SAnino25](https://github.com/SAnino25)

## 📚 Recursos Adicionales

- [Documentación de Docker](https://docs.docker.com/)
- [Documentación de Docker Compose](https://docs.docker.com/compose/)
- [Node.js Documentation](https://nodejs.org/docs/)
- [MongoDB Documentation](https://docs.mongodb.com/)

---

⭐ Si te ha gustado este proyecto, ¡dale una estrella en GitHub!
