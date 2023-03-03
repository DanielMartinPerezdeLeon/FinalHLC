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
        <title>Pagina Principal</title>
    </head>
    
    <body>
    
    <!-- Si no se ha iniciado sesion-->
    <%  if ( session.getAttribute("sesion_iniciada") == null ||
               ((Boolean)session.getAttribute("sesion_iniciada")).booleanValue() == false) { %>
        
        <p>Error, usted no ha iniciado sesion, por favor, inicie sesion </p>
        
        <form action='index.jsp'> <!-- (formulario) boton para volverha iniciar sesion-->
            <input type='submit' value='Volver a iniciar sesión'/>
        </form>
        
       
    <!-- Si se ha iniciado sesion-->
    <% }else { //si no %>
    
        
        <h1>Página Principal de <%=  session.getAttribute("nombre_usuario") %> </h1>
        <br/><br/>
        
        <button onclick="calcular()">Calcular Datos del usuario</button><br/> <!-- boton con javascript que calcula el numero de
                                                         cuentas y mmensajes del usuario -->
        <br/>  
        
        <form action='datos.jsp'>   <!-- (formulario) boton para ir a los datos de cuentas-->
        <input type='submit' value='Ver Datos Cuenta'/>
        </form>
        <br/>
        
        <form action='tabla_mensajes.jsp'>  <!-- (formulario) boton para ir a las tablas de los mensajes-->
            <input type='submit' value='Tablon de mensajes'/>
        </form>
        <br/><br/><br/>
        
        <button onclick="cerrar_sesion()">Cerrar Sesion</button><br/> <!--boton con javascript para desconectarse bien-->

            <script>
        
        <!-- funcion que calcula las cuentas y los mensajes del usuario -->
        function calcular() {
        <%
            //Calcula los datos
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
            <!-- Muestra los datos por pantalla -->
            alert('Numero de cuentas: ' + '<%= cuentas.size()%>' +
                    '\nNumero de mensajes recibidos: ' + '<%= totalrecibidos%>' +
                    '\nNumero de mensajes enviados: ' + '<%= totalenviados%>');
        }
        
        
        <!-- funcion para desconectarse bien -->
        function cerrar_sesion(){
        
            <% session.setAttribute("sesion_iniciada", new Boolean(false)); %>     
            window.location.href="index.jsp";
        }

    </script>
    
    <% } // fin else%>
    
    </body>

    
    <!-- javascript -->

    
</html>
