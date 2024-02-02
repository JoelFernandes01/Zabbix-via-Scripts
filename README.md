<h2>Script com instalação padrão do Zabbix, MySQL e o NGINX #</h2>

<p>Download da ISO do Ubuntu Server</p>
<p>https://releases.ubuntu.com/22.04.3/ubuntu-22.04.3-live-server-amd64.iso</p>

<p>Desenvolvido e personalizado por Joel Fernandes</p>
<h2>Meus contatos :</h2>
<p>- Celular:  (61) 98468-1921</p>
<p>- Linkedin: https://www.linkedin.com/in/joel-fernandes-25838425/</p>
<p>- Facebook: https://www.facebook.com/JoelFernandesSilvaFilho/</p>
--------------------------------------------------------------------------
<h3>Esse script foi desenvolvido para trabalhos de testes nas versões 6.0, 6.4 e 7.0</h3>
Ele deve ser usado apenas para ambiente de testes e laboratórios, pois está apenas reproduzindo os comandos que estão no site da Zabbix no linl "Download" , https://www.zabbix.com/download .

<p>Baixe o script em seu Ubuntu Server 22;04, e o execute .</p>
<p>Passos:</p>
<p>git  clone https://github.com/JoelFernandes01/Zabbix-via-Scripts.git</p>
<p>cd Zabbix-via-Scripts/</p>
<p>./Zabbix-MySQL-Install.sh</p>
<p>Ao final do script, ele informará o IP , Usuário e Senha de acesso ao Zabbix</p>

<h2>Importante:</h2>
<h4>Nele você irá encontrar três opções, que devem serem habilitadas ou não conforme seu laborário.</h4>
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