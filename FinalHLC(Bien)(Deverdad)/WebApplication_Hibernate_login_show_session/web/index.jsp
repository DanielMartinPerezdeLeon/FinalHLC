<%-- 
    Document   : index.jsp
    Created on : 03-mar-2023, 15:15:30
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final HLC</title>
    </head>

    <body>
        <h1>Practica Final HLC</h1>
        <br/><br/><br/>

        <section>
            <h2>Autor: Daniel Martin Pérez de León</h2>
            <br/>
            <p>Email: damarpele@gmail.com </p>
            <p>GitHub: DanielMartinPerezdeLeon </p>
        </section>
        <br/><br/><br/>

        <section>
            <h2>Iniciar Sesión</h2>
            <br/>

            <form action="ServletInicioSesion">
                <label for="name">Nombre:</label>
                <input type="text" name="name">
                <br>
                <label for="password">Contraseña:</label>
                <input type="password" name="password">
                <br/>
                <input type="submit" value="Iniciar Sesion">
            </form>
        </section>

    </body>

</html>
