# Script com instalação padrão do Zabbix, MySQL e o NGINX #

<b>Download da ISO do Ubuntu Server</b>
 https://releases.ubuntu.com/22.04.3/ubuntu-22.04.3-live-server-amd64.iso
--------------------------------------------------------------------------
Desenvolvido e personalizado por Joel Fernandes
# Meus contatos :
- Celular:  (61) 98468-1921
- Linkedin: https://www.linkedin.com/in/joel-fernandes-25838425/
- Facebook: https://www.facebook.com/JoelFernandesSilvaFilho/
--------------------------------------------------------------------------
# Esse script foi desenvolvido para trabalhos de testes nas versões 6.0, 6.4 e 7.0
Ele deve ser usado apenas para ambiente de testes e laboratórios, pois está apenas reproduzindo os comandos que estão no site da Zabbix no linl "Download" , https://www.zabbix.com/download .

### Nele você irá encontrar três opções, que devem serem habilitadas ou não conforme seu laborário.
<p>echo "#------------------------------------------------------#"</p>
<p>echo "Linha para instalar a versão 6.0 do Zabbix"<p>
<p>echo "#------------------------------------------------------#"<p>
<p>wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu22.04_all.deb</p>
<p>dpkg -i zabbix-release_6.0-4+ubuntu22.04_all.deb</p>
<p>echo "#------------------------------------------------------#"</p>
<p>echo "Linha para instalar a versão 6.4 do Zabbix"</p>
<p>echo "#------------------------------------------------------#"</p>
<p>wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu22.04_all.deb</p>
<p>dpkg -i zabbix-release_6.4-1+ubuntu22.04_all.deb</p>
<p>echo "#------------------------------------------------------#"</p>
<p>echo "Linha para instalar a versão 7.0 do Zabbix"</p>
<p>echo "#------------------------------------------------------#"</>
<p>wget https://repo.zabbix.com/zabbix/6.5/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.5-1+ubuntu22.04_all.deb</b>
<p>dpkg -i zabbix-release_6.5-1+ubuntu22.04_all.deb</p>

No caso do exemplo acima, escolhi instalar a versão Zabbix 6.4, então descomentei as linhas refrenciando essa versão.

Se achar que possa nos ajudar em melhorá-lo, entre em contato e vamos melhorar .

Agradeço a quem puder colaborar .