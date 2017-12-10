
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex4Session extends HttpServlet {

    private static int count;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String title = "SESSION EXAMPLE";
        String heading = "";
        HttpSession session = request.getSession(true);
        Integer accessCount = (Integer)session.getAttribute("Access");
        if(accessCount != null){
            accessCount = (Integer)session.getAttribute("Access") + 1;
            heading = "Welcome back";
        }
        else{
            heading = "Welcome, newcomer";
            accessCount = 0;
        }
        session.setAttribute("Access", accessCount);
        out.println(ServletUtilities.headWithTitle(title)
                + "<BODY BGCOLOR=\"#FDF5E6\">\n"
                + "<H1 ALIGN=\"CENTER\">" + heading
                + "</H1>\n"
                + "<TABLE ALIGN=\"CENTER\" BORDER=1>"
                + "<TR>"
                        + "<TH>Info Type"
                        + "<TH>Value"
                + "<TR>"
                        + "<TD>Session ID"
                        + "<TD>" + session.getId()
                + "<TR>"
                        + "<TD>Creation Time"
                        + "<TD>" + new Date(session.getCreationTime())
                + "<TR>"
                        + "<TD>Creation Time"
                        + "<TD>" + new Date(session.getLastAccessedTime())
                + "<TR>"
                        + "<TD>Access Time"
                        + "<TD>" + session.getAttribute("Access")
        );
        out.println("</BODY></HTML>");
    }
}
