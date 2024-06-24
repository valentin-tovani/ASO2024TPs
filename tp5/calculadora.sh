#!/bin/bash
read -p "Ingrese su nombre: " nombre
echo "Bienvenido a mi calculadora simple, $nombre"

while true; do
    echo "Por favor ingrese dos números y la operación que desea realizar:"
    read -p "Ingrese primer número: " num1
    read -p "Ingrese segundo número: " num2

    select option in suma resta multiplicacion division salir; do
        case $option in
            suma)
                resultado=$(echo "$num1 + $num2" | bc)
                echo "Resultado de la suma: $resultado"
                break
                ;;
            resta)
                resultado=$(echo "$num1 - $num2" | bc)
                echo "Resultado de la resta: $resultado"
                break
                ;;
            multiplicacion)
                resultado=$(echo "$num1 * $num2" | bc)
                echo "Resultado de la multiplicación: $resultado"
                break
                ;;
            division)
                if [ $num2 -eq 0 ]; then
                    echo "Error: No se puede dividir por 0."
                else
                    resultado=$(echo "scale=2; $num1 / $num2" | bc)
                    echo "Resultado de la división: $resultado"
                fi
                break
                ;;
            salir)
                echo "Saliendo de la calculadora, Sr./Sra. $nombre. ¡Espero que le haya gustado!"
                exit 0
                ;;
            *)
                echo "Opción no válida. Por favor ingrese una opción válida, Sr./Sra. $nombre."
                ;;
        esac
    done
done
