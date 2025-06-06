FROM mysql:8.0.36-oracle

# Variables de entorno para el contenedor
ENV MYSQL_DATABASE=nominas_bd
ENV MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD

# Copiar el archivo de la base de datos
COPY ./database/nominas_bd.sql /docker-entrypoint-initdb.d/

# Ajustar permisos
RUN chmod 644 /docker-entrypoint-initdb.d/nominas_bd.sql


# Configurar zona horaria del sistema (EST o -05:00)
RUN ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime && \
    echo "America/Bogota" > /etc/timezone