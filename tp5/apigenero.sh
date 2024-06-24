#!/bin/bash
read -p "Ingrese un nombre para conocer su género: " nombre
nombre_genero=$(echo "$nombre" | sed 's/ /%20/g')
url="https://api.genderize.io/?name=$nombre_genero"
respuesta=$(curl -s "$url")
echo "Respuesta de la API: $respuesta"
genero=$(echo "$respuesta" | jq -r '.gender')
echo "Género extraído: $genero"
if [ "$genero" = "null" ]; then
    echo "No se pudo determinar el género para el nombre '$nombre'."
else
    echo "El género del nombre '$nombre' es: $genero"
fi



