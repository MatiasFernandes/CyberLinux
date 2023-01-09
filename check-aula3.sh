#!/bin/bash

VERDE="\033[38;5;119m"
VERMELHO="\e[31m"
RESET_COR="\e[0m"


RESPOSTA1_1="`ls /arquivos | grep administrativo`"
RESPOSTA1_2="`ls /arquivos | grep financeiro`"
RESPOSTA1_3="`ls /arquivos | grep publico`"
RESPOSTA1_4="`ls /arquivos | grep vendas`"
RESPOSTA2_1="`ls /arquivos/administrativo | grep admin1.txt`"
RESPOSTA2_2="`ls /arquivos/financeiro | grep financeiro1.txt`"
RESPOSTA2_3="`ls /arquivos/publico | grep pub1.txt`"
RESPOSTA2_4="`ls /arquivos/vendas | grep vendas1.txt`"
RESPOSTA3_1="`ls -l /arquivos | grep administrativo | cut -d ' ' -f 3`"
RESPOSTA3_2="`ls -l /arquivos | grep financeiro | cut -d ' ' -f 3`"
RESPOSTA3_3="`ls -l /arquivos | grep publico | cut -d ' ' -f 3`"
RESPOSTA3_4="`ls -l /arquivos | grep vendas | cut -d ' ' -f 3`"
RESPOSTA3_5="`ls -l /arquivos | grep administrativo | cut -d ' ' -f 4`"
RESPOSTA3_6="`ls -l /arquivos | grep financeiro | cut -d ' ' -f 4`"
RESPOSTA3_7="`ls -l /arquivos | grep publico | cut -d ' ' -f 4`"
RESPOSTA3_8="`ls -l /arquivos | grep vendas | cut -d ' ' -f 4`"
RESPOSTA4_1="`ls -l /arquivos | grep administrativo | cut -d ' ' -f 1`"
RESPOSTA4_2="`ls -l /arquivos | grep financeiro | cut -d ' ' -f 1`"
RESPOSTA4_3="`ls -l /arquivos | grep publico | cut -d ' ' -f 1`"
RESPOSTA4_4="`ls -l /arquivos | grep vendas | cut -d ' ' -f 1`"





# 1 - Verificar se foram criadas todas as pastas dentro de /arquivos/

echo "1 - Estão criadas as seguintes pastas dentro de /arquivos: $RESPOSTA1_1 $RESPOSTA1_2 $RESPOSTA1_3 $RESPOSTA1_4"

if [ $RESPOSTA1_1 ] && [ $RESPOSTA1_2 ] && [ $RESPOSTA1_3 ] && [ $RESPOSTA1_4 ]
then
	echo -e "${VERDE}OK${RESET_COR}\n"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}\n"
fi


# 2 - Verificar se foram criados todos os arquivos dentro de suas respectivas pastas

echo -e "2 - Foram criados os seguintes arquivos dentro de suas respectivas pastas: \n $RESPOSTA1_1: $RESPOSTA2_1, \n $RESPOSTA1_2: $RESPOSTA2_2, \n $RESPOSTA1_3: $RESPOSTA2_3, \n $RESPOSTA1_4: $RESPOSTA2_4"

if [ $RESPOSTA2_1 ] && [ $RESPOSTA2_2 ] && [ $RESPOSTA2_3 ] && [ $RESPOSTA2_4 ]
then
	echo -e "${VERDE}OK${RESET_COR}\n"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}\n"
fi


# 3 - Verificar se o usuário root é dono de todas as pastas

echo -e "3 - Quais são os donos e grupos de todas as pastas: \n $RESPOSTA1_1: $RESPOSTA3_1:$RESPOSTA3_5 \n $RESPOSTA1_2: $RESPOSTA3_2:$RESPOSTA3_6 \n $RESPOSTA1_3: $RESPOSTA3_3:$RESPOSTA3_7 \n $RESPOSTA1_4: $RESPOSTA3_4:$RESPOSTA3_8"

if [ "$RESPOSTA3_1" == "root" ] && [ "$RESPOSTA3_2" == "root" ] && [ "$RESPOSTA3_3" == "root" ] && [ "$RESPOSTA3_4" == "root" ]
then
	echo -e "${VERDE}OK${RESET_COR}\n"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}\n"
fi


# 4 - Verificar se o usuário root tem permissão total em todas as pastas

echo -e "4 - Quais são as permissões de todas as pastas: \n $RESPOSTA1_1: $RESPOSTA4_1 \n $RESPOSTA1_2: $RESPOSTA4_2 \n $RESPOSTA1_3: $RESPOSTA4_3 \n $RESPOSTA1_4: $RESPOSTA4_4"

if [ "$RESPOSTA4_1" == "drwx------" ] && [ "$RESPOSTA4_2" == "drwxrwx---" ] && [ "$RESPOSTA4_3" == "drwxrwxrwx" ] && [ "$RESPOSTA4_4" == "drwxrwx---" ]
then
	echo -e "${VERDE}OK${RESET_COR}\n"
else
	echo -e "${VERMELHO}ERRADO${RESET_COR}\n"
fi


