package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ShowInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Information</title>\n");
      out.write("        <link rel=\"icon\" href=\"hcmiu_logo.png\" type=\"image\" sizes=\"16x16\">\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            ol{\n");
      out.write("                color: red;\n");
      out.write("                font-family: \"Arial\", sans-serif;\n");
      out.write("                font-style: italic;\n");
      out.write("            }\n");
      out.write("            ul{\n");
      out.write("                color: blue;\n");
      out.write("                font-family: \"Times New Roman\", serif;\n");
      out.write("            }\n");
      out.write("            table, th, td {\n");
      out.write("                border: 1px solid black;\n");
      out.write("                background-color: pink;\n");
      out.write("                color: red;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            table{\n");
      out.write("                border-collapse: collapse;\n");
      out.write("                width: 80%;\n");
      out.write("                height: 100%;\n");
      out.write("            }\n");
      out.write("            iframe{\n");
      out.write("                border: none;\n");
      out.write("            }\n");
      out.write("            a{\n");
      out.write("                color: blue;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("            a:hover{\n");
      out.write("                color: red;\n");
      out.write("                text-decoration: underline;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Your Information</h1>\n");
      out.write("        <p>");

            String name = request.getParameter("name");
            out.println("Name: " + name);
        
      out.write("</p>\n");
      out.write("        <p>");

            String id = request.getParameter("id");
            out.println("ID: " + id);
        
      out.write("</p>\n");
      out.write("        <p>");

            String school = request.getParameter("school");
            out.println("School: " + school);
        
      out.write("</p>\n");
      out.write("        <p>");

            String department = request.getParameter("department");
            out.println("Department: " + department);
        
      out.write("</p>\n");
      out.write("        <table>\n");
      out.write("            <caption><p style=\"color:red\">Subjects</p></caption>\n");
      out.write("            <tr>\n");
      out.write("                <th>Subject</th>\n");
      out.write("                <th>Credits</th>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <th>Web Application</th>\n");
      out.write("                <th>3</th>\n");
      out.write("            </tr>\n");
      out.write("            <tr>\n");
      out.write("                <th>Computer Network</th>\n");
      out.write("                <th>3</th>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
      out.write("        <p>Plan:</p>\n");
      out.write("        <ul type=\"circle\">\n");
      out.write("            <li>3rd year\n");
      out.write("                <ol type==\"A\">\n");
      out.write("                    <li>Operating System</li>\n");
      out.write("                    <li>Artificial Intelligent</li>\n");
      out.write("                </ol>\n");
      out.write("            </li>\n");
      out.write("            <li>4th year\n");
      out.write("                <ol type=\"1\">\n");
      out.write("                    <li>Thesis</li>\n");
      out.write("                    <li>Graduate</li>\n");
      out.write("                </ol>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("        <p><iframe src=\"hcmiu_logo.png\" height=\"300\" width=\"400\"></iframe></p>\n");
      out.write("        <p><a href=\"index.html\">back</a></p>\n");
      out.write("        <form method='post' action=\"Test.jsp\">\n");
      out.write("            <select name='test'>\n");
      out.write("                <option value='test 1'>Test 1</option>\n");
      out.write("                <option value='test 2'>Test 2</option>\n");
      out.write("            </select>\n");
      out.write("            <button type=\"submit\" name=\"test\" value=\"Test 1\">Test 1</button>\n");
      out.write("        </form>\n");
      out.write("        \n");
      out.write("    </body>\n");
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
