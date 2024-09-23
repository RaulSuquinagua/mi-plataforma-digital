#!/bin/bash

# Script para actualizar todas las ramas de los submódulos a la rama 17.0

for submodule in $(git submodule --quiet foreach 'echo $path'); do
    echo "Actualizando $submodule"
    cd $submodule
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    git fetch
    git pull origin $current_branch
    cd -
done

echo "Actualización de submódulos completada."
