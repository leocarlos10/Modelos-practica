#!/bin/bash

# primero verificamos si se ha pasado la ruta del entorno y el nombre del entorno como argumentos
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Este script: $0 requiere los siguientes argumentos: <ruta_del_entorno> <nombre_del_entorno>"
  exit 1
fi

# definimos los argumentos
RUTA_ENTORNO="$1"
NOMBRE_ENTORNO="$2"

# creamos el directorio si no existe
mkdir -p "$RUTA_ENTORNO"
cd "$RUTA_ENTORNO" || exit 1

# creamos el entorno virtual
python3 -m venv .venv

# activamos el entorno virtual
source .venv/bin/activate

# instalamos las dependencias iniciales
pip install --upgrade pip
pip install ipykernel

# registramos el kernel del entorno virtual para Jupyter
python -m ipykernel install --user --name "$(basename "$RUTA_ENTORNO")" --display-name "Python ($(basename "$RUTA_ENTORNO"))"

echo "Entorno virtual '$NOMBRE_ENTORNO' creado en '$RUTA_ENTORNO' y registrado para Jupyter."
echo "Recarga la Vscode para que el nuevo kernel aparezca en la lista de kernels disponibles."
