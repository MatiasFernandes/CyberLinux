#!/bin/bash

VERDE="\33[38;5;119m"
VERMELHO="\e[31m"

# 1 - Verificar se é uma máquina Debian
if [ `lsb_release -a 2>/dev/null | grep ID | cut -d $'\t' -f2` == "Debian" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi
# 2 - Verificar quantidade de memória RAM
if [ `cat /proc/meminfo | grep MemTotal | cut -d ' ' -f9` -gt "2000000" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 3 - Verificar o tamanho do disco adicionado
if [ "`fdisk -l | grep -w "/dev/sdb" | awk -F' ' '{print $3,$4}' | cut -d ',' -f1`" == "10 GiB" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 4 - Verificar o hostname do servidor
if [ `hostname` == "srvdebian" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi



# 5 - Verificar se a pasta /arquivos está montada
if [ "`df -Th | grep "/arquivos"`"  ]
then
      echo "Resposta Correta"
else
      echo "Resposta Errada"
fi


# 6 - Verificar se a partição montada está em ext4
if [ "`df -Th | grep /arquivos | cut -d ' ' -f7`" == "ext4" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 7 - Verificar se as pastas estão criadas dentro de /arquivos/
if [ "`ls -la /arquivos/ | grep vendas | grep drwx | cut -d ' ' -f11`" == "vendas" ] && [ "`ls -la /arquivos/ | grep financeiro | grep drwx | cut -d ' ' -f11`" == "financeiro" ]
then 
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 8 - Verificar se os arquivos foram criados dentros de suas respectivas pastas
if [ "`ls -la /arquivos/vendas | grep vendas1.txt | cut -d ' ' -f11`" == "vendas1.txt" ] && [ "`ls -la /arquivos/financeiro | grep financeiro1.txt | cut -d ' ' -f11`" == "financeiro1.txt" ]
then 
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 9 - Verificar o conteúdo dentro de cada arquivo criado
if [ "`cat /arquivos/vendas/vendas1.txt`" == "arquivo vendas" ] && [ "`cat /arquivos/financeiro/financeiro1.txt`" == "arquivo financeiro" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 10 - Verificar se os usuarios foram criados
if [ "`cat /etc/passwd | grep uservendas | cut -d ':' -f1`" == "uservendas" ] && [ "`cat /etc/passwd | grep userfinanceiro | cut -d ':' -f1`" == "userfinanceiro" ]
then 
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 11 - Verificar se os grupos foram criados
if [ "`cat /etc/group | grep -w vendas | cut -d ':' -f1`" == "vendas" ] && [ "`cat /etc/group | grep -w financeiro | cut -d ':' -f1`" == "financeiro" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 12 - Verificar se os usuários estão nos grupos corretos
if [ "`cat /etc/group | grep -w vendas | cut -d ':' -f4`" == "uservendas" ] && [ "`cat /etc/group | grep -w financeiro | cut -d ':' -f4`" == "userfinanceiro" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi


# 13 - Verificar se o servidor está escutando as portas TCP/22 e UDP/69
if [ "`ss -ntpl | grep 22`" ] && [ "`ss -nupl | grep 69`" ]
then
	echo "Resposta Correta"
else
	echo "Resposta Errada"
fi




