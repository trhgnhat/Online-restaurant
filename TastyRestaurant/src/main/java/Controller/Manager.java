/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBConnector.BookingDS;
import DBConnector.FoodDS;
import DBConnector.MemberDS;
import DBConnector.OrderDS;
import DBConnector.TableDS;
import DO.FoodDO;
import DO.MemberDO;
import DO.TableDO;
import Services.Mailer;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.RandomStringUtils;

/**
 *
 * @author nnta.zip
 */
@WebServlet(name = "Manager", urlPatterns = {"/Manager"})
public class Manager extends HttpServlet {

    private ServletContext context;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
//        super.init(config); //To change body of generated methods, choose Tools | Templates.
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            if (action.equals("changeTableStatus")) {
                TableDO table = new TableDS().getTable(Integer.parseInt(request.getParameter("tableId")));
                if (table.getStatus() == 1) {
                    table.setStatus(0);
                } else if (table.getStatus() == 0) {
                    table.setStatus(1);
                }
                new TableDS().updateTable(table);
                //response.getOutputStream().print((table.getStatus() == 1) ? "Busy" : "Available");
                response.setContentType("text/html");
                response.setHeader("Cache-Control", "no-cache");
                response.setHeader("Pragma", "no-cache");
                out.print((table.getStatus() == 1) ? "Busy" : "Available");
            }
        };
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        request.getSession().invalidate();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        if (action.equals("login")) {
            request.getSession().setAttribute("isLoggedIn", "TRUE");
            out.println("<script type=\"text/javascript\">");
            out.println("location='manager.jsp';");
            out.println("</script>");
        }
        if (action.equals("logout")) {
            request.getSession().setAttribute("isLoggedIn", "FALSE");
            out.println("<script type=\"text/javascript\">");
            out.println("location='managerLogin.jsp';");
            out.println("</script>");
        }
        if (action.equals("addFood")) {
            List<FoodDO> foods = new FoodDS().getAllFoods();
            int newFoodId = 1;
            if (!foods.isEmpty()) {
                newFoodId = (new FoodDS().getAllFoods().get(new FoodDS().getAllFoods().size() - 1)).getId() + 1;
            }
            String newFoodName = request.getParameter("addFoodName");
            Float newFoodPrice = Float.parseFloat(request.getParameter("addFoodPrice"));
            String newFoodCategory = request.getParameter("addFoodCategory");
            FoodDO newFood = new FoodDO(newFoodId, newFoodName, newFoodPrice, newFoodCategory);
            boolean flag = false;
            for (FoodDO food : foods) {
                if (newFoodName.equals(food.getName())) {
                    flag = true;
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Name " + food.getName() + " already exists!!');");
                    out.println("location='addFood.jsp';");
                    out.println("</script>");
                }
            }
            if (flag == false) {
                new FoodDS().createFood(newFood);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Adding successfully!!');");
                out.println("location='addFood.jsp';");
                out.println("</script>");
            }
        }
        if (action.equals("chooseFood")) {
            int foodID = Integer.parseInt(request.getParameter("foodIdBtn"));
            request.getSession().setAttribute("Food", new FoodDS().getFood(foodID));
            out.println("<script type=\"text/javascript\">");
            out.println("location='editKitchen.jsp';");
            out.println("</script>");
        }
        if (action.equals("editFood")) {
            FoodDO food = (FoodDO) request.getSession().getAttribute("Food");
            food.setName(request.getParameter("foodName"));
            food.setPrice(Float.parseFloat(request.getParameter("foodPrice")));
            food.setCategory(request.getParameter("foodCategory"));
            new FoodDS().updateFood(food);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Edit successfully!!');");
            out.println("location='kitchenManager.jsp';");
            out.println("</script>");
        }
        if (action.equals("deleteFood")) {
            String[] checkboxes = request.getParameterValues("foodCheckBox");
            if (checkboxes != null) {
                for (String checkbox : checkboxes) {
                    new FoodDS().deleteFood(new FoodDS().getFood(Integer.parseInt(checkbox)));
                }
                out.println("<script type=\"text/javascript\">");
                out.println("location='kitchenManager.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please choose at least ONE food');");
                out.println("location='kitchenManager.jsp';");
                out.println("</script>");
            }
        }
        if (action.equals("deleteOrder")) {
            String[] checkboxes = request.getParameterValues("orderCheckBox");
            if (checkboxes != null) {
                for (String checkbox : checkboxes) {
                    new OrderDS().deleteOrder(new OrderDS().getOrderByOrderID(Integer.parseInt(checkbox)));
                }
                out.println("<script type=\"text/javascript\">");
                out.println("location='saleManager.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please choose at least ONE food');");
                out.println("location='saleManager.jsp';");
                out.println("</script>");
            }
        }
        if (action.equals("deleteBooking")) {
            String[] checkboxes = request.getParameterValues("bookingCheckBox");
            if (checkboxes != null) {
                for (String checkbox : checkboxes) {
                    new BookingDS().deleteBooking(new BookingDS().getBooking(Integer.parseInt(checkbox)));
                }
                out.println("<script type=\"text/javascript\">");
                out.println("location='restaurantManager.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please choose at least ONE food');");
                out.println("location='restaurantManager.jsp';");
                out.println("</script>");
            }
        }
        if (action.equals("addTable")) {
            int id = 1;
            if (!new TableDS().getAllTables().isEmpty()) {
                id = (new TableDS().getAllTables().get(new TableDS().getAllTables().size() - 1)).getId() + 1;
            }
            TableDO newTable = new TableDO(id, Integer.parseInt(request.getParameter("addTableSeat")), 0);
            new TableDS().createTable(newTable);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Adding successfully!!');");
            out.println("location='tableManager.jsp';");
            out.println("</script>");
        }
        if (action.equals("resetPassword")) {
            MemberDO member = new MemberDS().getMember(Integer.parseInt(request.getParameter("resetButton")));
            String newPassword = RandomStringUtils.random(6, "ABCDEFGHIJKLMNOPQRSTUVUWXYZ0123456789");
            member.setPassword(newPassword);
            new MemberDS().updateMember(member);
            String msg = "Your new password is: " + member.getPassword();
            Mailer mailer = new Mailer(member.getEmail(), "[RESET PASSWORD]", msg);
            out.println("<script type=\"text/javascript\">");
            out.println("location='userManager.jsp';");
            out.println("</script>");
        }
        if (action.equals("deleteTable")) {
            String[] checkboxes = request.getParameterValues("tableCheckBox");
            if (checkboxes != null) {
                for (String checkbox : checkboxes) {
                    new TableDS().deleteTable(new TableDS().getTable(Integer.parseInt(checkbox)));
                }
                out.println("<script type=\"text/javascript\">");
                out.println("location='tableManager.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please choose at least ONE food');");
                out.println("location='tableManager.jsp';");
                out.println("</script>");
            }
        }
        if (action.equals("deleteMember")) {
            String[] checkboxes = request.getParameterValues("memberCheckBox");
            if (checkboxes != null) {
                for (String checkbox : checkboxes) {
                    new MemberDS().deleteMember(new MemberDS().getMember(Integer.parseInt(checkbox)));
                }
                out.println("<script type=\"text/javascript\">");
                out.println("location='userManager.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please choose at least ONE food');");
                out.println("location='userManager.jsp';");
                out.println("</script>");
            }
        }
        if (action.equals("changeTableStatus")) {

            TableDO table = new TableDS().getTable(Integer.parseInt(request.getParameter("tableId")));
            if (table.getStatus() == 1) {
                table.setStatus(0);
            } else if (table.getStatus() == 0) {
                table.setStatus(1);
            }
            new TableDS().updateTable(table);
            //response.getOutputStream().print((table.getStatus() == 1) ? "Busy" : "Available");
            response.setContentType("text/html");
            response.setHeader("Cache-Control", "no-cache");
            out.write((table.getStatus() == 1) ? "Busy" : "Available");
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Servlet');");
//            out.println("location='tableManager.jsp';");
//            out.println("</script>");
        }
        if (action.equals("chooseTable")) {
            int tableID = Integer.parseInt(request.getParameter("tableIdBtn"));
            request.getSession().setAttribute("Table", new TableDS().getTable(tableID));
            out.println("<script type=\"text/javascript\">");
            out.println("location='editTable.jsp';");
            out.println("</script>");
        }
        if (action.equals("editTable")) {
            TableDO table = (TableDO) request.getSession().getAttribute("Table");
            table.setSeat(Integer.parseInt(request.getParameter("editTableSeat")));
            new TableDS().updateTable(table);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Edit successfully!!');");
            out.println("location='tableManager.jsp';");
            out.println("</script>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private Float pasreFloat(String parameter) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
