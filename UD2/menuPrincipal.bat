rem Menú gráfico.
:menu
cls
echo ++++++++++++++++++++++++++++++++++++++++++++
echo +Programa de creacion de usuarios, grupos y+
echo +unidades organizativas en un dominio unico+
echo ++++++++++++++++++++++++++++++++++++++++++++
echo.
echo Selecciona la opcion deseada
echo ----------------------------
echo.
echo A. Acción 1.
echo B- Acción 2.
echo S-Salir de la aplicación.
echo.

rem Aquí creamos el menú de selección.

choice /C ABS /N /T 10 /D S /M "Seleccione la acción que quiere realizar:"
if errorlevel 3 goto fin
if errorlevel 2 goto  Acción-2
if errorlevel 1 goto Accion-1
if errorlevel 0 goto menu

rem Etiquetas utilizadas en el menú - Funciones
: Acción-1
  goto menu
: Acción-2
goto menu
