#!/bin/bash

# Descripcion: Script que permite elegir al usuario si securizar el sistema para entornos de pruebas
# Fecha comienzo: 14 Noviembre del 2024
# Fecha de fin:
# Hecho por: Aarón Esteban Macías
# Versión: 1.0


clear
echo
echo "*********************************************"
echo "*      Bienvenido al asistente de            *"
echo "*   securización para entornos de pruebas    *"
echo "*********************************************"
echo
echo "Este script te ayudará a fortalecer o restaurar"
echo "la configuración de seguridad de tu sistema."
echo
echo "¿Qué te gustaría hacer?"
echo "1) Securizar el sistema para pruebas"
echo "2) Revertir el sistema a su estado original"
echo

read opt

case $opt in

    1)
        echo "Iniciando el proceso de securización..."
	sudo iptables -P INPUT DROP
	sudo iptables -P FORWARD DROP
	sudo iptables -P OUTPUT DROP

	sudo iptables -A INPUT -i docker0 -j ACCEPT
	sudo iptables -A OUTPUT -o docker0 -j ACCEPT
        ;;
    2)
        echo "Restaurando la configuración original del sistema..."
	sudo iptables -P INPUT ACCEPT
	sudo iptables -P FORWARD ACCEPT
	sudo iptables -P OUTPUT ACCEPT
        ;;
    *)
        echo "Opción no válida. Por favor, selecciona 1 o 2."
        ;;
esac

