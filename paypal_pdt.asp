<%@LANGUAGE="VBScript"%>
<%
'***********************************************
' Versión básica para ASP Classic
'***********************************************

'Declaración de variables
Dim authToken
Dim txToken
Dim strRequest
Dim strSandbox
Dim strLive

'Este es nuestro código personal de identidad (Conviene guardar en base de datos)
authToken = "vXtmjz8sX03ASDASOdasdY4Jp-0datVkSeu8_wGr6lzjWFHyekuhk13hjkhkjhjkh"

'Recuperamos el Id de la transacción.
txToken = Request.QueryString("tx")

'Creamos una cadena para obtener la respuesta a través de SOAP
'de que lo recibido por este script viene de Paypal
strRequest = "cmd=_notify-synch&tx=" & txToken & "&at=" & authToken

'Los dos servidores de paypal, pruebas y real.
strSandbox = "https://www.sandbox.paypal.com/cgi-bin/webscr"
strLive = "https://www.paypal.com/cgi-bin/webscr"

'Validamos la respuesta de Paypal, para ello mandamos la cadena
'obtenida por GET (Request.Querystring) a paypal.
set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
'set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP.4.0")
'set objHttp = Server.CreateObject("Microsoft.XMLHTTP")

'Ejecuto la llamada al servidor de pruebas (sandbox) o al real.
objHttp.open "POST", strSandbox, false
'objHttp.open "POST", strLive, false

objHttp.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
objHttp.Send strRequest

'Entramos si la respuesta no viene de paypal
if (objHttp.status <> 200 ) then

	Response.Write "HTTP error handling"


elseif (Instr(objHttp.responseText, "SUCCESS") <> 0) then

	Response.Write("<p><h3>Your order has been received.</h3></p>")
	Response.Write "Id transaccion: " & Request.Querystring("tx") & "</br>"
	Response.Write "Estado: " & Request.Querystring("st") & "</br>"
	
elseif (objHttp.responseText = "FAIL") then

	Response.Write "Unable to retrive transaction detail"

else

	Response.Write "Unknown Error"

end if

set objHttp = nothing
%>
