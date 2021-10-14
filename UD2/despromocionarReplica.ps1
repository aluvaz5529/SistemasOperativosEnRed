#POWERSHELL
#Antes de quitar un Controlador de Dominio de forma "correcta", es necesario que cheques los siguientes puntos:
#Estado de Salud del Servidor: Estado de salud (event viewer) del sistema operativo del servidor.
#Estado del salud Controlador de Dominio: es necesario que ejecutes un DCDIAG /v sobre el Controlador de Dominio a eliminar.
#Conectividad con el 2do Controlador de Dominio (réplica): verificar la conectividad con el controlador de dominio restante.
#Estado de Replicación: es necesario chequear la replicación entre los DC con los comandos repadmin.
#Teniendo todos estos puntos OK, podras proceder a eliminar el DC. 


#1º. Disminuir nivel (degradación)
#2º. Hay que elimnar los Roles AD DS y DNS

uninstall-ADDSDomainController 
# Importamos el módulo ADDS
if (!(Get-Module -Name ADDSDeployment)) #Se comprueba si se tiene cargado el módulo
{
  Import-Module ADDSDeployment #Se carga el módulo
}

# Despromocionamos el dominio adicional
# ForceRemoval desinstalará AD DS aunque no haya conexión con ningún otro controlador de dominio en la red.
# para evitar que el cmdlet pueda interrumpir su ejecución, el argumento Force hace que no se tenga en cuenta ningún aviso que pueda aparecer durante el proceso.

Uninstall-ADDSDomainController-ForceRemoval:$true -Force:$true

#Descripción de los parámetros
#Uninstall-ADDSDomainController: desistala un controlador de dominio en el Active Directory.
#ForceRemoval:$true: elimina cualquier conectividad con otro controlador de dominio.
 
#Desinstalar los roles Servicios de dominio de Active Directory y DNS
Uninstall-WindowsFeature -Name AD-Domain-Services, DNS -Confirm:$false


#Referencia: https://blog.ragasys.es/eliminar-controlador-de-dominio-adicional-sobre-ms-windows-server-2016
