<%-- 
    Document   : datos
    Created on : 03-mar-2023, 17:35:37
    Author     : alumno
--%>

<%@page import="dao.MensajeDaoImplement"%>
<%@page import="model.Mensaje"%>
<%@page import="dao.CuentaDaoImplement"%>
<%@page import="model.Cuenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  Usuario usuario = (Usuario) session.getAttribute("usuario");%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos cuentas</title>
    </head>
    <body>
        <h2>Datos de las cuentas de <%= usuario.getNombre()%></h2>
        <br/> 

        <article>
            <p>Nombre: <%= usuario.getNombre() + " " + usuario.getApellido()%></p>
            <p>Numero de usuario: <%= usuario.getNumero()%>
            <p>Fecha de nacimiento: <%= usuario.getFechanacimiento().toString()%>></p>
            <p><image src='<%= session.getAttribute("url")%>/fotos/<%= usuario.getFoto()%>'></image></p>
        </article>

        <br/><br/>

        <h2>Cuentas de <%= usuario.getNombre()%></h2>
        <br/>

        <%
            ArrayList<Cuenta> cuentas = new CuentaDaoImplement().getCuentaByUsuario(Integer.parseInt((String) session.getAttribute("id_usuario")));

            for (int i = 0; i < cuentas.size(); i++) {

                Cuenta c = cuentas.get(i);

                ArrayList<Mensaje> recibidos = new MensajeDaoImplement().getMensajeByCuentaDestino(cuentas.get(i).getCodigo());
                ArrayList<Mensaje> enviados = new MensajeDaoImplement().getMensajeByCuentaOrigen(cuentas.get(i).getCodigo());

                int totalrecibidos = recibidos.size();
                int totalenviados = enviados.size();

        %><h3>Cuenta <%= i + 1%>:</h3>
        <p>Email: <%= c.getEmail()%></p>
        <p>Numero de cuenta: <%= c.getCodigo()%></p>
        <p>Fecha de alta: <%= c.getFechaalta().toString()%></p>
        <p>Máximo de mensajes: <%= c.getMaximomensajes()%></p>
        <p>Coste mensaje extra: <%= c.getCostemensajeextra()%></p>
        <p>Mensajes enviados: <%= totalrecibidos %></p>
        <p>Mensajes recibidos: <%= totalenviados %></p>

        <br/>
        <%}
        %>
        
        <br/>
        <form action='principal.jsp'>
            <input type='submit' value='Volver a la página principal'/>
        </form>
    </body>
</html>
