package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class SharedCounts3_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      coreservlets.AccessCountBean counter = null;
      synchronized (application) {
        counter = (coreservlets.AccessCountBean) _jspx_page_context.getAttribute("counter", PageContext.APPLICATION_SCOPE);
        if (counter == null){
          counter = new coreservlets.AccessCountBean();
          _jspx_page_context.setAttribute("counter", counter, PageContext.APPLICATION_SCOPE);
          out.write("\n");
          out.write("            ");
          org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("counter"), "firstPage", "SharedCounts3.jsp", null, null, false);
          out.write("\n");
          out.write("        ");
        }
      }
      out.write("\n");
      out.write("        Of SharedCounts3.jsp (this page), \n");
      out.write("        <A HREF=\"SharedCounts2.jsp\">SharedCounts1.jsp</A>, and\n");
      out.write("        <A HREF=\"SharedCounts3.jsp\">SharedCounts2.jsp</A>, \n");
      out.write("            ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((coreservlets.AccessCountBean)_jspx_page_context.findAttribute("counter")).getFirstPage())));
      out.write("\n");
      out.write("        was the first page accessed.\n");
      out.write("        <P/>\n");
      out.write("        Collectively, the three pages have been accessed \n");
      out.write("        ");
      out.write(org.apache.jasper.runtime.JspRuntimeLibrary.toString((((coreservlets.AccessCountBean)_jspx_page_context.findAttribute("counter")).getAccessCount())));
      out.write("\n");
      out.write("        times. \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.introspecthelper(_jspx_page_context.findAttribute("counter"), "accessCountIncrement", "1", null, null, false);
      out.write("\n");
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
