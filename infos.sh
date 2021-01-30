#!/usr/bin/env bash
#Autor: Matheus Santana
#Objetivo: Mostrar eficiencia do Shell Script trabalhando com variáveis globais, arquivos de sistema, subshells, variáveis especiais, e formatação de dados.

# ---- INFO SYSTEM ----
KERNEL=$(cat /proc/sys/kernel/osrelease)
OS=$(cat /proc/sys/kernel/ostype)
DIST=$(cat /proc/sys/kernel/version | cut -f3 -d" ")

# ---- RAM MEMORY ----
MEMTOTAL=$(($(cat /proc/meminfo | grep -I MemTotal | awk '{print $2}')/1024))
MEMLIVRE=$(($(cat /proc/meminfo | grep -I MemFree | awk '{print $2}')/1024))
TYPEPROC=$(cat /proc/cpuinfo | grep -I "model name" | cut -d":" -f2)

# ---- HD MEMORY ----
HDTOTAL=$(df -h | grep -E ^/dev/sd[a-z][0-9] | awk '{print $2}')
HDLIVRE=$(df -h | grep -E ^/dev/sd[a-z][0-9] | awk '{print $4}')

# ---- MEMORY SWAP ----
SWAPTOTAL=$(($(cat /proc/meminfo | grep -I "SwapTotal" | awk '{print $2}')/1024))
SWAPFREE=$(($(cat /proc/meminfo | grep -I "SwapFree" | awk '{print $2}')/1024))

# ---- OTHER ----
ZONE=$(cat /etc/timezone)

#COR: -NULO-    -FUNDO BRANCO-   -FUNDO PRETO-
#TIPO:   		   AZUL/NG 		   BRANCO/NL	
COR=("\033[0m" "\033[01;34;47m" "\033[00;00;40m")
echo -e "_______________________________________________"
echo -e "${COR[1]}INFORMATION${COR[0]}"
echo -e "-----------------------------------------------"
echo -e "${COR[2]}HOME:${COR[0]} $HOME\n${COR[2]}ZONE:${COR[0]} $ZONE"
echo -e "${COR[2]}KERNEL:${COR[0]} $KERNEL | ${COR[2]}OS:${COR[0]} $OS $DIST"
echo -e "${COR[2]}SHELL:${COR[0]} $SHELL 	  | ${COR[2]}Interface:${COR[0]} $XDG_CURRENT_DESKTOP"
echo -e "${COR[2]}IPV4:${COR[0]} $(hostname -I)\t  | ${COR[2]}Arc: ${COR[0]}$(uname -m)"
echo -e "${COR[2]}CPU:${COR[0]}$TYPEPROC"
echo -e "_______________________________________________"
echo -e "${COR[1]}RAM MEMORY:${COR[0]} \n\t${COR[2]}TOTAL:${COR[0]} $MEMTOTAL MB"
echo -e "\t${COR[2]}FREE:${COR[0]} $MEMLIVRE MB"
echo -e "${COR[1]}SWAP MEMORY:${COR[0]} \n\t${COR[2]}TOTAL:${COR[0]} $SWAPTOTAL MB"
echo -e "\t${COR[2]}FREE:${COR[0]} $SWAPFREE MB"
echo -e "-----------------------------------------------"
echo -e "${COR[1]}HD MEMOMRY:${COR[0]} \n\t${COR[2]}TOTAL:${COR[0]} $HDTOTAL"
echo -e "\t${COR[2]}FREE:${COR[0]} $HDLIVRE"
echo -e "-----------------------------------------------"
