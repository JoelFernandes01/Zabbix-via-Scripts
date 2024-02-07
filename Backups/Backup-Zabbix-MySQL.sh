#!/bin/bash

# Diretório de backup
BACKUP_DIR="/backup-zabbix/"  # Altere para o diretório desejado
DATE=$(date +%d-%m-%Y-%H:%M)

# Criando as pastas
echo "Criando as pastas..."
sudo mkdir -p $BACKUP_DIR/banco zabbix

# Parar o serviço zabbix-server
echo "Parando o serviço zabbix-server..."
sudo systemctl stop zabbix-server

# Verifica se o serviço foi parado com sucesso
if [ $? -eq 0 ]; then
    echo "Serviço zabbix-server parado com sucesso."
else
    echo "Erro ao parar o serviço zabbix-server."
    exit 1
fi

# Backup do banco de dados Zabbix
echo "Fazendo backup do banco de dados Zabbix..."
sudo mysqldump -u root zabbix > $BACKUP_DIR/banco/zabbix_backup_$DATE.sql

# Verifica se o backup do banco de dados foi realizado com sucesso
if [ $? -eq 0 ]; then
    echo "Backup do banco de dados Zabbix concluído com sucesso."
else
    echo "Erro ao fazer backup do banco de dados Zabbix."
    exit 1
fi

# Backup dos arquivos de configuração do Zabbix
echo "Fazendo backup dos arquivos de configuração do Zabbix..."
sudo cp /etc/zabbix/zabbix_server.conf $BACKUP_DIR/zabbix/zabbix_server_conf_backup_$DATE.conf
sudo cp /etc/zabbix/zabbix_agentd.conf $BACKUP_DIR/zabbix/zabbix_agent_conf_backup_$DATE.conf
sudo cp /etc/zabbix/web/zabbix.conf.php $BACKUP_DIR/zabbix/zabbix_web_conf_backup_$DATE.php

# Verifica se o backup dos arquivos de configuração foi realizado com sucesso
if [ $? -eq 0 ]; then
    echo "Backup dos arquivos de configuração do Zabbix concluído com sucesso."
else
    echo "Erro ao fazer backup dos arquivos de configuração do Zabbix."
    exit 1
fi

# Backup do arquivo de configuração do nginx
echo "Fazendo backup do arquivo de configuração do Nginx..."
sudo cp /etc/nginx/conf.d/zabbix.conf $BACKUP_DIR/nginx/nginx_conf_backup_$DATE.conf

# Verifica se o backup do arquivo de configuração do nginx foi realizado com sucesso
if [ $? -eq 0 ]; then
    echo "Backup do arquivo de configuração do Nginx concluído com sucesso."
else
    echo "Erro ao fazer backup do arquivo de configuração do Nginx."
    exit 1
fi

# Reiniciar o serviço zabbix-server
echo "Reiniciando o serviço zabbix-server..."
sudo systemctl start zabbix-server

# Verifica se o serviço foi reiniciado com sucesso
if [ $? -eq 0 ]; then
    echo "Serviço zabbix-server reiniciado com sucesso."
else
    echo "Erro ao reiniciar o serviço zabbix-server."
    exit 1
fi

echo "Operação concluída com sucesso."