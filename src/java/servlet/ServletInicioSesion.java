/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.UsuarioDaoImplement;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author alumno
 */
@WebServlet(name = "ServletInicioSesion", urlPatterns = {"/ServletInicioSesion"})
public class ServletInicioSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String nombre = (String) request.getParameter("name");
        String contraseña = (String) request.getParameter("password");

        ArrayList<Usuario> usuarios = new UsuarioDaoImplement().getUsuariosConWhere(nombre, contraseña);

        HttpSession session = request.getSession();

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet inicio de sesion</title>");
            out.println("</head>");
            out.println("<body>");

            if (session.getAttribute("sesion_iniciada") == null
                    || ((Boolean) session.getAttribute("sesion_iniciada")).booleanValue() == false) {

                if (usuarios.isEmpty()) {

                    out.println("<h2>Por favor, vuelva a iniciar sesión y compruebe sus datos</h2>");
                    out.println("<form action='index.jsp'>");
                    out.println("<input type='submit' value='Volver a Iniciar Sesion'>");
                    out.println("</form>");

                } else {

                    Usuario usuario = usuarios.get(0);
                    out.println("<h2>Sesión Iniciada Correctamente</h2>");
                    out.println("<h2>Hola, " + usuario.getNombre() + "</h2>");

                    out.println("<form action='principal.jsp'>");
                    out.println("<input type='submit' value='Ir a la página principal'/>");
                    out.println("</form>");

                    session.setAttribute("sesion_iniciada", new Boolean(true));
                    session.setAttribute("id_usuario", new String(Integer.toString(usuario.getNumero())));
                    session.setAttribute("nombre_usuario", new String(usuario.getNombre()));
                    session.setAttribute("usuario", usuario);

                }

            } else {

                out.println("<p>Error, usted ya ha iniciado sesion ("+session.getAttribute("nombre_usuario")+")");
                out.println("<form action='principal.jsp'>");
                out.println("<input type='submit' value='Volver a Página Principal'>");
                out.println("</form>");
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
