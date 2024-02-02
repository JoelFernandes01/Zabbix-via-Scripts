#----------------------------------------------------------------------------
# Instalação automatizada do Zabbix e o MySQL no Ubuntu Server 22.04
#
# Download da ISO do Ubuntu Server
# https://releases.ubuntu.com/22.04.3/ubuntu-22.04.3-live-server-amd64.iso
#----------------------------------------------------------------------------
# Desenvolvido e personalizado por Joel Fernandes
# Meus contatos :
# - Celular:  (61) 98468-1921
# - Linkedin: https://www.linkedin.com/in/joel-fernandes-25838425/
# - Facebook: https://www.facebook.com/JoelFernandesSilvaFilho/
#----------------------------------------------------------------------------
clear
echo "#------------------------------------------------------#"
echo      			"Instalando o MySQL"
echo "#------------------------------------------------------#"
export DEBIAN_FRONTEND=noninteractive
apt update && apt install mysql-server -y
echo "----------------------------------------------------------------------------"

echo "#------------------------------------------------------#"
echo      "Criando o banco de dados Zabbix e seu usuário"
echo "#------------------------------------------------------#"
mysql -u root -e "create database zabbix character set utf8mb4 collate utf8mb4_bin;" && \
mysql -u root -e "create user zabbix@localhost identified by 'zabbix';" && \
mysql -u root -e "grant all privileges on zabbix.* to zabbix@localhost;" && \
mysql -u root -e "set global log_bin_trust_function_creators = 1;"
echo "----------------------------------------------------------------------------"
# Comando para verificar usuários criados no banco de dados
# SELECT user FROM mysql.user;

# Comando para verificar os privilégios do usuário 
# SHOW GRANTS FOR zabbix@localhost;

echo "#----------------------------------------------------------------#"
echo "Baixando e instalando o repositório do Zabbix e suas dependências"
echo "#----------------------------------------------------------------#"
#echo "#------------------------------------------------------#"
#echo "Linha para instalar a versão 6.0 do Zabbix"
#echo "#------------------------------------------------------#"
#wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb
#dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb
echo "#------------------------------------------------------#"
echo "Linha para instalar a versão 6.4 do Zabbix"
echo "#------------------------------------------------------#"
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb
dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb
#echo "#------------------------------------------------------#"
#echo "Linha para instalar a versão 7.0 do Zabbix"
#echo "#------------------------------------------------------#"
#wget https://repo.zabbix.com/zabbix/6.5/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.5-1+ubuntu22.04_all.deb
#dpkg -i zabbix-release_6.5-1+ubuntu22.04_all.deb
export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y && apt list --upgradable
apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent -y
#
echo "#--------------------------------------------------------#"
echo         "Importando os dados para o Banco de dados"
echo "#--------------------------------------------------------#"
zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -pzabbix zabbix
sudo sed -i 's/^# DBPassword=/DBPassword=zabbix/' /etc/zabbix/zabbix_server.conf
#
echo "#------------------------------------------------------------#"
echo      "Mudando parâmetro do banco de dados Zabbix e seu usuário"
echo "#------------------------------------------------------------#"
mysql -u root -e "set global log_bin_trust_function_creators = 0;"
#
echo "#--------------------------------------------------------#"
echo            "AJUSTANDO ARQUIVO DO NGINX E PHP"
echo "#--------------------------------------------------------#"
sed -i 's/#        listen/        listen/' /etc/nginx/conf.d/zabbix.conf
sed -i 's/8080/80/' /etc/nginx/conf.d/zabbix.conf
# Extrair o valor inet da primeira placa de rede excluindo a interface "lo" e armazenar em uma variável
inet_value=$(ifconfig | awk '/inet / && $1 !~ /lo/{gsub("addr:",""); print $2; exit}')
echo "#--------------------------------------------------------#"
echo 				"Exibir o valor da variável"
echo "#--------------------------------------------------------#"
echo $inet_value
sed -i 's/#        server_name     example.com;/        server_name     '$inet_value';/' /etc/nginx/conf.d/zabbix.conf
sed -i '42s/^/#/' /etc/nginx/nginx.conf
sed -i '43s/^/        root         \/usr\/\share\/\zabbix;'/ /etc/nginx/nginx.conf
#sed -i 's/post_max_size = 8M/post_max_size = 16M/' /etc/php.ini
#sed -i 's/max_execution_time = 30/max_execution_time = 300/' /etc/php.ini
#sed -i 's/max_input_time = 60/max_input_time = 300/' /etc/php.ini
#
echo "#--------------------------------------------------------#"
echo      "COLOCANDO SERVIÇOS NO BOOT DO S.O E REINICIANDO"
echo "#--------------------------------------------------------#"
systemctl restart zabbix-server zabbix-agent nginx php8.1-fpm
systemctl enable zabbix-server zabbix-agent nginx php8.1-fpm

echo "Zabbix instalado com sucesso !"
#==     show access url ==#
echo    "########============================================########"
echo    "######## URL de acesso : http://$inet_value/        ########"
echo    "######## Usuário Zabbix: Admin                      ########"
echo    "######## Senha		    : zabbix                     ########"
echo    "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo    "######## Note: Não esqueça de mudar a senha depois  ########"
echo    "########============================================########"