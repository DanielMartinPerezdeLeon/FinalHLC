<%-- 
    Document   : index.jsp
    Created on : 03-mar-2023, 15:15:30
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- guardo la url principal en nun variable de sesion -->
<% session.setAttribute("url", request.getRequestURL()); %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final HLC Indice</title>
    </head>

    <body>
        <h1>Practica Final HLC</h1>
        <br/><br/><br/>
        
        <!-- SI NO SE HA INICIADO SESION-->
        <%  if ( session.getAttribute("sesion_iniciada") == null ||
               ((Boolean)session.getAttribute("sesion_iniciada")).booleanValue() == false) { %>
            
               <!--Mis datos -->
            <section>
                <h2>Autor: Daniel Martin Pérez de León</h2>
                <br/>
                <p>Email: damarpele@gmail.com </p>
                <p>GitHub: DanielMartinPerezdeLeon </p>
            </section>
            <br/><br/><br/>
            
            <!-- Formulario de inicio de sesion-->
            <section>
                <h2>Iniciar Sesión</h2>
                <br/>

                <form action="ServletInicioSesion" method="post">
                    <label for="name">Nombre:</label>
                    <input type="text" name="name">
                    <br>
                    
                    <label for="password">Contraseña:</label>
                    <input type="password" name="password">
                    <br/>
                    
                    <input type="submit" value="Iniciar Sesion">
                </form>
            </section>

    
            <!-- SI SE HA INICIADO SESION-->
        <%} else {%>
            <p>Usted ya ha iniciado sesion (<%= session.getAttribute("nombre_usuario")%>),
                por favor desconectese correctamente </p>
            
            <form action='principal.jsp'>
                <input type='submit' value='Volver a la página principal'/>
            </form>
        <% } %>
    
        </body>
        
        
</html>
