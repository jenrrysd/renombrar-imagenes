#!/bin/bash

echo " "
echo "RENOMBRAR IMAGENES"
echo " "
read -p "Paso 1 - Escribe el nombre de la carpeta: " carpeta
read -p "Paso 2 - A partir de que numero quieres que empize a renombrar?
escribe un numero y da enter: " numero

# Verificar si la carpeta existe
if [ ! -d "$carpeta" ]; then
    echo "Error: La carpeta '$carpeta' no existe."
    exit 1
fi

# Contador para los nombres secuenciales
# A partir de que numero quieres que empieze a renombrar?
contador=$numero

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
