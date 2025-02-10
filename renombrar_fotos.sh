#!/bin/bash

echo " "
echo "Ecribe la ruta de la carpeta que contiene las
imagenes para renombrarlo numericamente, si la carpeta
estubiera entrecomillado porfavor NO ingrese las comillas
use solo el nombre de la carpeta"
echo " "
read -p "Escribe el nombre de la carpeta: " carpeta

# Ruta de la carpeta donde están las imágenes
#carpeta="fotos/"

# Verificar si la carpeta existe
if [ ! -d "$carpeta" ]; then
    echo "Error: La carpeta '$carpeta' no existe."
    exit 1
fi

# Contador para los nombres secuenciales
contador=1

# Recorrer todos los archivos .jpeg en la carpeta
for archivo in "$carpeta"/*.{jpeg,jpg,png,JPEG,JPG,PNG}; do
    # Verificar si el archivo existe (por si no hay archivos)
    if [ -f "$archivo" ]; then

	# obtener la extension original
	extension="${archivo##*.}"

        # Crear el nuevo nombre
        nuevo_nombre="$carpeta/foto-$contador.$extension"
        
        # Renombrar el archivo
        mv "$archivo" "$nuevo_nombre"
        
        # Mostrar el cambio en la terminal
        echo "Renombrado: $archivo -> $nuevo_nombre"
        
        # Incrementar el contador
        contador=$((contador + 1))
    fi
done

echo "Proceso completado."
