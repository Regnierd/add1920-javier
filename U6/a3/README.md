# Contenedores con Docker
Instalamos el docker.

![](./img/2.png)

Iniciamos el servicio del docker.

![](./img/3.png)
![](./img/4.png)

Incluimos a nuestro usuario en el grupo docker.

![](./img/5.png)

## 1 Habilitar el acceso a la red externa a los contenedores
Activamos la opción ```IP_FORWARD``` para poder tener acceso a la red exterior. Para ello tenemos que ponerle el valor 1.

![](./img/37.png)

### 1.1 Primera prueba
Para ver las imágenes descargadas podemos usar el comando: ```docker images```.
Para mostrar todos los contenedores creados, por ahora no debería de haber ninguno.

![](./img/6.png)

Para descargar una imagen, crear un contenedor y ejecutar la aplicación de la red usamos: ```docker run hello-world```.

![](./img/7.png)

Ahora vemos la nueva imagen ```hello-world``` descargada. Para ver los contenedores usamos: ```docker ps -a```.

![](./img/8.png)

## 2 Creación manual de nuestra imagen

### 2.1 Crear un contenedor manualmente
Buscamos en los repositorios de Docker Hub contenedores con la etiqueta debian.

![](./img/9.png)

Descargamos una imagen en local.

![](./img/10.png)

Comprobamos que se ha descargado.

![](./img/11.png)

Ahora vamos a crear un contenedor con nombre ```con_debian``` a partir de la imagen que hemos descargado.

![](./img/12.png)

### 2.2 Personalizar el contenedor
Para personalizar un poco el contenedor vamos a descargar un par de aplicaciones.

![](./img/13.png)

Instalamos nginx en el contenedor.

![](./img/14.png)

Instalamos el vi en el contenedor.

![](./img/15.png)

Creamos un fichero HTML.

![](./img/16.png)

Creamos un script.

![](./img/17.png)

Le damos permiso de ejecución al script.

![](./img/18.png)

### 2.3 Crear una imagen a partir del contenedor
A partir del contenedor vamos a crear la nueva imagen llamada javier/nginx1.

![](./img/19.png)

Comprobamos que se creó la imagen.

![](./img/20.png)

## 3 Crear contenedor a partir de nuestra imagen
### 3.1 Crear contenedor con Nginx
Creamos un contenedor con Nginx.

![](./img/21.png)

### 3.2 Comprobamos
Comprobamos que se creó el contenedor y esta activo.

![](./img/22.png)
![](./img/23.png)

Abrimos un navegador web y comprobamos el acceso al fichero html.

![](./img/38.png)
![](./img/39.png)

### 3.3 Migrar la imagen a otra máquina
Exportamos la imagen Docker a fichero .tar.

![](./img/25.png)

## 4. Dockerfile
### 4.1 Preparar ficheros
Creamos el directorio /home/nombre-alumno/dockerXXa. Ponemos una copia del fichero html y del script anterior en el nuevo directorio, además creamos un fichero llamado ```Dockerfile```.

![](./img/26.png)

### 4.2 Crear imagen a partir del Dockerfile
Construimos una nueva imagen a partir del Dockerfile.

![](./img/27.png)

Comprobamos que se construyó.

![](./img/28.png)

### 4.3 Crear contenedor y comprobar
A continuación vamos a crear un contenedor con el nombre con_nginx2, a partir de la imagen nombre-alumno/nginx2

![](./img/29.png)

Comprobamos en navegador.

![](./img/38.png)
![](./img/39.png)

### 4.4 Usar imágenes ya creadas
Creamos el directorio ```dockerXXb```. Creamos el fichero Dockerfile.

![](./img/31.png)

Creamos la imagen.

![](./img/33.png)

Creamos el contenedor.

![](./img/34.png)

## 5. Limpiar contenedores e imágenes.
Comprobamos todos los contenedores.

![](./img/35.png)

Paramos, borramos y comprobamos la eliminación del container, listamos las imágenes y eliminamos la imagen nombre-alumno/nginx3.

![](./img/36.png)

Comprobamos que se haya eliminado la imagen.

![](./img/40.png)
