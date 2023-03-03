<%-- 
    Document   : principal
    Created on : 03-mar-2023, 15:39:21
    Author     : alumno
--%>

<%@page import="model.Cuenta"%>
<%@page import="dao.MensajeDaoImplement"%>
<%@page import="model.Mensaje"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CuentaDaoImplement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Página Principal de <%=  session.getAttribute("nombre_usuario")%> </h1>
        <br/><br/>
        <button onclick="calcular()">Calcular Datos del usuario</button>
        <form action='principal.jsp'>
        <input type='submit' value='Ver Datos Cuenta'/>
        </form>
        <form action='principal.jsp'>
            <input type='submit' value='Tabla mensajes l'/>
        </form>
    </body>

    <script>

        function calcular() {
        <%
            ArrayList<Cuenta> cuentas = new CuentaDaoImplement().getCuentaByUsuario(Integer.parseInt((String) session.getAttribute("id_usuario")));

            int totalrecibidos = 0;
            int totalenviados = 0;

            for (int i = 0; i < cuentas.size(); i++) {
                ArrayList<Mensaje> recibidos = new MensajeDaoImplement().getMensajeByCuentaDestino(cuentas.get(i).getCodigo());
                ArrayList<Mensaje> enviados = new MensajeDaoImplement().getMensajeByCuentaOrigen(cuentas.get(i).getCodigo());

                totalrecibidos += recibidos.size();
                totalenviados += enviados.size();

            }

        %>
            alert('Numero de cuentas: ' + '<%= cuentas.size()%>' +
                    '\nNumero de mensajes recibidos: ' + '<%= totalrecibidos%>' +
                    '\nNumero de mensajes enviados: ' + '<%= totalenviados%>');
        }

        alert("pepe");

    </script>
</html>
