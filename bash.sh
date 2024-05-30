#!/bin/bash

# Ejecuta las pruebas con Cypress
npx cypress run --headless

# Obtiene el resultado de las pruebas
TEST_RESULT=$?

# Muestra el resultado de las pruebas
echo "Resultado de las pruebas: $TEST_RESULT"

# Comprueba si las pruebas fueron exitosas
if [ $TEST_RESULT -eq 0 ]; then
    echo "Las pruebas fueron exitosas. Se procederá con el despliegue."
    # Ejecuta el despliegue en Vercel si las pruebas fueron exitosas
    npm install -g vercel
    vercel --prod --token $VERCEL_TOKEN

    # Indica que no se necesita una nueva construcción
    exit 0
else
    echo "Las pruebas fallaron. No se realizará el despliegue."
    # Indica que se necesita una nueva construcción
    exit 1
fi
