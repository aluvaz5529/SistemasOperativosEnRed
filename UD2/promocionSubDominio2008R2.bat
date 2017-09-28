
#Supongamos que se parte de un dominio raiz ya promocionado a Controlador del Dominio y que se llama smr.local. 
#El siguiente paso es crear el subdominio sor mediante el comando dcpromo:

dcpromo /unattend /InstallDNS:yes /ParentDomainDNSName:smr.local /UserName:Administrador
/userDomain:smr /Password:* /replicaOrNewDomain:domain /NewDomain:child
/newDomainDnsName:sor.smr.local /ChildName:sor /DomainNetbiosName:sor
/databasePath:"c:\ntds" /LogPath:"c:\ntdslogs" /sysvolpath:"c:\sysvol" /safeModeAdminPassword:Eeupqt,9
/rebootOnCompletion:yes

#Nota:
# El parámetro /Password:* --> El * indica que nos solitirá el password durante el proceso de promoción, y a sí
# se oculta en el comando para mantener la seguridad de revelación de claves.
#Referencias
#https://support.microsoft.com/es-es/kb/947034
#https://technet.microsoft.com/es-es/library/cc732887%28v=ws.10%29.aspx
