# Usa una imagen base de Debian Buster slim
FROM debian:buster-slim

# Evita que apt-get pida interacción durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Agrega la arquitectura ARM de 32 bits (armhf)
# Actualiza los repositorios e instala todas las dependencias necesarias para la compilación cruzada
RUN dpkg --add-architecture armhf && \
    apt-get -y update && \
    apt-get -y install \
        build-essential \
        scons \
        clang \
        sudo \
        crossbuild-essential-armhf \
        libstdc++6:armhf \
        libglib2.0-dev:armhf \
        libpng-dev:armhf \
        libfreetype6-dev:armhf \
        nano vim git curl wget unzip cmake xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Crea el directorio de trabajo principal y le da permisos
RUN mkdir -p /workspace; chmod +0777 /workspace; ln -s /usr/local/include /usr/include/sdkdir

# Copia el script ldd de compilación cruzada y asegúrate de que sea ejecutable
COPY cross-compile-ldd /usr/bin/arm-linux-gnueabihf-ldd
RUN chmod +x /usr/bin/arm-linux-gnueabihf-ldd

# Define las variables de entorno para el toolchain de compilación cruzada
ENV CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf-
ENV PREFIX=/usr
ENV PKG_CONFIG_PATH=/usr/lib/arm-linux-gnueabihf/pkgconfig/:/usr/local/lib/pkgconfig/
ENV AS="arm-linux-gnueabihf-as"
ENV CC="arm-linux-gnueabihf-gcc"
ENV CXX="arm-linux-gnueabihf-g++"
ENV LD="arm-linux-gnueabihf-ld"

# Copia y extrae los archivos fuente de las librerías SDL2 y sus complementos
# Estos archivos .tar.gz DEBEN ESTAR EN EL MISMO NIVEL QUE LA CARPETA .devcontainer/ EN TU REPO
COPY SDL2_gfx-1.0.4.tar.gz .
RUN tar xf SDL2_gfx-1.0.4.tar.gz

COPY SDL2-2.26.1.tar.gz .
RUN tar xf SDL2-2.26.1.tar.gz

COPY SDL2_ttf-2.0.13.tar.gz .
RUN tar xf SDL2_ttf-2.0.13.tar.gz
COPY SDL2_mixer-2.0.1.tar.gz .
RUN tar xf SDL2_mixer-2.0.1.tar.gz
COPY SDL2_image-2.0.1.tar.gz .
RUN tar xf SDL2_image-2.0.1.tar.gz

# Crea un directorio para las librerías específicas de Miyoo A30
# Copia y extrae los archivos .tar.xz que contienen las librerías precompiladas para la Miyoo A30
# Estos archivos .tar.xz DEBEN ESTAR EN EL MISMO NIVEL QUE LA CARPETA .devcontainer/ EN TU REPO
RUN mkdir -p miyooa30
COPY lib.tar.xz miyooa30/
RUN cd miyooa30/ && tar xf lib.tar.xz && rm lib.tar.xz
COPY usr.tar.xz miyooa30/
RUN cd miyooa30/ && tar xf usr.tar.xz && rm usr.tar.xz

# --- INICIO DE LAS LÍNEAS CORREGIDAS PARA LOS ENLACES SIMBÓLICOS (BASADO EN TUS ARCHIVOS TAR.XZ) ---
# Crea enlaces simbólicos para las librerías de Miyoo A30 para facilitar su descubrimiento por el compilador
# Asegurarse de que el origen del enlace (el primer argumento) coincida exactamente con el nombre de archivo existente
# y el destino (segundo argumento) sea el nombre genérico que el enlazador buscará (ej. libSDL2.so).
RUN cd miyooa30/usr/miyoo/lib && \
ln -s libSDL2-2.0.so.0 libSDL2.so && \
ln -s libSDL2_gfx-1.0.0.so.0 libSDL2_gfx.so && \
ln -s libSDL2_image-2.0.0.so.0 libSDL2_image.so && \
ln -s libSDL2_mixer-2.0.0.so.0 libSDL2_mixer.so && \
ln -s libSDL2_ttf-2.0.0.so.0 libSDL2_ttf.so
RUN cd miyooa30/usr/lib && \
    ln -s libfreetype.so.6 libfreetype.so && \
    ln -s libbz2.so.1.0 libbz2.so
RUN cd miyooa30/lib && \
    ln -s libmad.so.0 libmad.so && \
    ln -s libpthread.so.0 libpthread.so && \
    ln -s librt.so.1 librt.so && \
    ln -s libgcc_s.so.1 libgcc_s.so
# --- FIN DE LAS LÍNEAS CORREGIDAS EN LOS ENLACES SIMBÓLICOS ---

# Agrega un comando para listar el contenido de la carpeta miyooa30 en el log de construcción.
# Esto es para diagnóstico: te permitirá ver si los archivos .so.0 están presentes.
RUN echo "--- Listing miyooa30 contents for diagnostics ---" && \
    ls -lR miyooa30 && \
    echo "--- End miyooa30 contents ---"

# Crea el archivo config.sh con las banderas de compilación y rutas de librerías
# Le da permisos de ejecución y lo añade a .bashrc para que se cargue automáticamente.
RUN echo "MARCH='-march=armv7-a+neon-vfpv4'" > /root/config.sh && \
    echo "SDL_LIBS='-lSDL2 -lSDL2_ttf -lSDL2_mixer -lSDL2_gfx -lSDL2_image -lmad -lpthread -ldl -lrt -lfreetype -lbz2'" >> /root/config.sh && \
    echo "SDL_LIB_PATHS='-L/workspace/miyooa30/usr/miyoo/lib -L/workspace/miyooa30/usr/lib -L/workspace/miyooa30/lib'" >> /root/config.sh && \
    echo "SDL_INCLUDE='-I /workspace/SDL2-2.26.1/include -I /workspace/SDL2_mixer-2.0.1 -I /workspace/SDL2_gfx-1.0.4 -I /workspace/SDL2_ttf-2.0.13 -I /workspace/SDL2_image-2.0.1'" >> /root/config.sh && \
    chmod +x /root/config.sh && \
    echo "source /root/config.sh" >> /root/.bashrc

# Establece el directorio de trabajo predeterminado para el Codespace
WORKDIR /workspace

# El comando por defecto al iniciar el contenedor (Codespaces usualmente lo sobreescribe)
CMD ["/bin/bash"]