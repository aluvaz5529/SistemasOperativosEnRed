#
#Creación de las unidades organizativas
#
$fichero = import-csv -Path unidades_org.csv
$ADSI = [ADSI]"LDAP://$dc"
$Class = "OrganizationalUnit"
foreach($linea in $fichero)
{
	$ou = "ou="+$linea.Unidad
	$OrganizationalUnit = $ADSI.create($Class, $ou)
	$OrganizationalUnit.setInfo()
	$OrganizationalUnit.put("Description", $($linea.Descripcion))
	$OrganizationalUnit.setInfo()
}
