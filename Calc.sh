#!/bin/bash

echo "Calculadora Simples"
echo "Operações disponíveis:"
echo "1: Soma"
echo "2: Subtração"
echo "3: Multiplicação"
echo "4: Divisão"

read -p "Escolha uma operação (1-4): " operacao
read -p "Digite o primeiro número: " num1
read -p "Digite o segundo número: " num2

case $operacao in
    1)
        resultado=$(echo "$num1 + $num2" | bc)
        operador="+"
        ;;
    2)
        resultado=$(echo "$num1 - $num2" | bc)
        operador="-"
        ;;
    3)
        resultado=$(echo "$num1 * $num2" | bc)
        operador="*"
        ;;
    4)
        if [ "$num2" -eq 0 ]; then
            echo "Erro: Divisão por zero!"
            exit 1
        fi
        resultado=$(echo "scale=2; $num1 / $num2" | bc)
        operador="/"
        ;;
    *)
        echo "Operação inválida!"
        exit 1
        ;;
esac

echo "Resultado: $num1 $operador $num2 = $resultado"
