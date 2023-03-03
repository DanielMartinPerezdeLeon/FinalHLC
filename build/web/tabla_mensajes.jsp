<%-- 
    Document   : tabla_mensajes
    Created on : 03-mar-2023, 19:17:39
    Author     : alumno
--%>

<%@page import="dao.MensajeDaoImplement"%>
<%@page import="model.Mensaje"%>
<%@page import="dao.CuentaDaoImplement"%>
<%@page import="model.Cuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Usuario usuario = (Usuario) session.getAttribute("usuario"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>tablon mensajes</title>
    </head>
    <body>
        <%
            ArrayList<Cuenta> cuentas = new CuentaDaoImplement().getCuentaByUsuario(Integer.parseInt((String) session.getAttribute("id_usuario")));

            for (int i = 0; i < cuentas.size(); i++) {

                Cuenta c = cuentas.get(i);

                ArrayList<Mensaje> recibidos = new MensajeDaoImplement().getMensajeByCuentaDestino(cuentas.get(i).getCodigo());
                ArrayList<Mensaje> enviados = new MensajeDaoImplement().getMensajeByCuentaOrigen(cuentas.get(i).getCodigo());
        %> 
        
        <br/>
        <h2>Cuenta <%= i+1 %> (<%= c.getEmail()%>): </h2>
            <br/>
            <h3>Mensajes recibidos:</h3>
            
            <table>
                <tr>
                    <th>Numero de mensaje</th>
                    <th>Asunto</th>
                    <th>Contenido</th>
                    <th>>¿Leido?</th>
                    <th>Fecha</th>
                    <th>Cuenta de origen</th>
                </tr>
        <%
            for (int j = 0; j < recibidos.size(); j++) {
                Mensaje m = recibidos.get(j);
                String leido;
                if (m.getLeido() == 1) {
                    leido = "si";
                } else {
                    leido = "no";
                }
                Cuenta cuentaenviada = new CuentaDaoImplement().getCuentaByNumero(m.getCuecodigoorigen());
        %>

                <tr id="mensaje<%= i%>-<%= j%>">
                    <td><%= m.getNumero()%></td>
                    <td><%= m.getAsunto()%></td>
                    <td><%= m.getContenido()%></td>
                    <td><%= leido%></td>
                    <td><%= m.getFecha().toString()%></td>
                    <td><%= cuentaenviada.getEmail()%></td>
                </tr>
        <%  }    %>
    </table>
        <br/><br/>
    <h3>Mensajes enviados:</h3>
            
            <table>
                <tr>
                    <th>Numero de mensaje</th>
                    <th>Asunto</th>
                    <th>Contenido</th>
                    <th>Fecha</th>
                    <th>Cuenta enviada</th>
                </tr>
        <%
            for (int j = 0; j < enviados.size(); j++) {
                Mensaje m = enviados.get(j);

                Cuenta cuentaenviada = new CuentaDaoImplement().getCuentaByNumero(m.getCuecodigodestino());
        %>

                <tr>
                    <td><%= m.getNumero()%></td>
                    <td><%= m.getAsunto()%></td>
                    <td><%= m.getContenido()%></td>
                    <td><%= m.getFecha().toString()%></td>
                    <td><%= cuentaenviada.getEmail()%></td>
                </tr>
             
        <%  }    %>
    </table>
    <br/>
    <br/>
    <br/>
        <%}%>
        
        <br/><br/>
        <form action='principal.jsp'>
            <input type='submit' value='Volver a la página principal'/>
        </form>
</body>
</html>
