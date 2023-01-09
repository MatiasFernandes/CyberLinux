#!/bin/bash

VERDE="\033[38;5;119m"
VERMELHO="\e[31m"
RESET_COR="\e[0m"


RESPOSTA1="`lsb_release -a 2>/dev/null | grep ID | cut -d $'\t' -f2`"
RESPOSTA2="`cat /proc/meminfo | grep MemTotal | cut -d ' ' -f9`"
RESPOSTA3="`fdisk -l | grep -w "/dev/sdb" | awk -F' ' '{print $3,$4}' | cut -d ',' -f1`"
RESPOSTA4="`hostname`"
RESPOSTA5="`df -Th | grep /arquivos`"
RESPOSTA6="`df -Th | grep /arquivos | cut -d ' ' -f7`"
RESPOSTA7_1="`ls /arquivos/ | grep vendas`"
RESPOSTA7_2="`ls /arquivos/ | grep financeiro`"
RESPOSTA8_1="`ls /arquivos/vendas | grep vendas1.txt`"
RESPOSTA8_2="`ls /arquivos/financeiro | grep financeiro1.txt`"
RESPOSTA9_1="`cat /arquivos/vendas/vendas1.txt`"
RESPOSTA9_2="`cat /arquivos/financeiro/financeiro1.txt`"
RESPOSTA10_1="`cat /etc/passwd | grep uservendas | cut -d ':' -f1`"
RESPOSTA10_2="`cat /etc/passwd | grep userfinanceiro | cut -d ':' -f1`"
RESPOSTA11_1="`cat /etc/group | grep -w vendas | cut -d ':' -f1`"
RESPOSTA11_2="`cat /etc/group | grep -w financeiro | cut -d ':' -f1`"
RESPOSTA12_1="`cat /etc/group | grep -w vendas | grep -w uservendas`"
RESPOSTA12_2="`cat /etc/group | grep -w financeiro | grep -w userfinanceiro`"
RESPOSTA13_1="`ss -ntpl | grep 22`"
RESPOSTA13_2="`ss -nupl | grep 69`"


# 1 - Verificar se é uma máquina Debian

echo "1 - O servidor tem instalado uma distribuição: $RESPOSTA1"

if [ $RESPOSTA1 == "Debian" ]
then
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 2 - Verificar quantidade de memória RAM

echo "2 - Quantidade de Memória RAM: $RESPOSTA2"

if [ $RESPOSTA2 -gt "2000000" ]
then
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 3 - Verificar o tamanho do disco adicionado

echo "3 - Tamanho do disco adicionado: $RESPOSTA3"

if [ "$RESPOSTA3" == "10 GiB" ]
then
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 4 - Verificar o hostname do servidor

echo "4 - Hostname do Servidor: $RESPOSTA4"

if [ $RESPOSTA4 == "srvdebian" ]
then
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi



# 5 - Verificar se a pasta /arquivos está montada

echo "5 - Pasta arquivo está montada?:"

if [ "$RESPOSTA5" ]
then
	echo "$RESPOSTA5"
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo "$RESPOSTA\n"
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 6 - Verificar se a partição montada está em ext4

echo "6 - A partição montada está em: $RESPOSTA6"

if [ $RESPOSTA6 == "ext4" ]
then
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 7 - Verificar se as pastas estão criadas dentro de /arquivos/

echo "7 - As seguintes pastas estão criadas dentro de /arquivos/: $RESPOSTA7_1 e $RESPOSTA7_2"

if [ $RESPOSTA7_1 == "vendas" ] && [ $RESPOSTA7_2 == "financeiro" ]
then 
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 8 - Verificar se os arquivos foram criados dentros de suas respectivas pastas

echo "8 - Os seguintes arquivos estão criados dentro das pastas $RESPOSTA7_1 e $RESPOSTA7_2: $RESPOSTA8_1 e $RESPOSTA8_2"

if [ $RESPOSTA8_1 == "vendas1.txt" ] && [ $RESPOSTA8_2 == "financeiro1.txt" ]
then 
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 9 - Verificar o conteúdo dentro de cada arquivo criado

echo -e "9 - O conteudo do arquivo $RESPOSTA8_1 é: $RESPOSTA9_1 \n    O conteudo do arquivo $RESPOSTA8_2 é: $RESPOSTA9_2"

if [ "$RESPOSTA9_1" == "arquivo vendas" ] && [ "$RESPOSTA9_2" == "arquivo financeiro" ]
then 
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 10 - Verificar se os usuarios foram criados

echo "10 - Foram criados os usuários uservendas e userfinanceiro?"

if [ $RESPOSTA10_1 == "uservendas" ] && [ $RESPOSTA10_2 == "userfinanceiro" ]
then 
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 11 - Verificar se os grupos foram criados

echo "11 - Foram criados os grupos vendas e financeiro?"

if [ $RESPOSTA11_1 == "vendas" ] && [ $RESPOSTA11_2 == "financeiro" ]
then
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 12 - Verificar se os usuários estão nos grupos corretos

echo "12 - Os usuários $RESPOSTA10_1 e $RESPOSTA10_2 estão associados aos grupos $RESPOSTA11_1 e $RESPOSTA11_2?: "

if [ "$RESPOSTA12_1" ] && [ "$RESPOSTA12_2" ]
then
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi


# 13 - Verificar se o servidor está escutando as portas TCP/22 e UDP/69

echo "13 - As portas TCP/22 e UDP/69 estão abertas no servidor?"

if [ "$RESPOSTA13_1" ] && [ "$RESPOSTA13_2" ]
then
	echo -e "${VERDE}OK${RESET_COR}"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}"
fi




