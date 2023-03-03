package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Final HLC Indice</title>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <h1>Practica Final HLC</h1>\n");
      out.write("        <br/><br/><br/>\n");
      out.write("        \n");
      out.write("        <h1>");
      out.print( session.getAttribute("sesion_iniciada) );
      out.write("</h1>\n");
      out.write("\n");
      out.write("        <section>\n");
      out.write("            <h2>Autor: Daniel Martin Pérez de León</h2>\n");
      out.write("            <br/>\n");
      out.write("            <p>Email: damarpele@gmail.com </p>\n");
      out.write("            <p>GitHub: DanielMartinPerezdeLeon </p>\n");
      out.write("        </section>\n");
      out.write("        <br/><br/><br/>\n");
      out.write("\n");
      out.write("        <section>\n");
      out.write("            <h2>Iniciar Sesión</h2>\n");
      out.write("            <br/>\n");
      out.write("\n");
      out.write("            <form action=\"ServletInicioSesion\">\n");
      out.write("                <label for=\"name\">Nombre:</label>\n");
      out.write("                <input type=\"text\" name=\"name\">\n");
      out.write("                <br>\n");
      out.write("                <label for=\"password\">Contraseña:</label>\n");
      out.write("                <input type=\"password\" name=\"password\">\n");
      out.write("                <br/>\n");
      out.write("                <input type=\"submit\" value=\"Iniciar Sesion\">\n");
      out.write("            </form>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    ");
 session.setAttribute("url", request.getRequestURL() ); 
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
