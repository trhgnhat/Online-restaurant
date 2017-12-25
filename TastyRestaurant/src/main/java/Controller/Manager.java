/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBConnector.FoodDS;
import DO.FoodDO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.spi.http.HttpExchange;

/**
 *
 * @author nnta.zip
 */
@WebServlet(name = "Menu", urlPatterns = {"/Menu"})
public class Manager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        PrintWriter out = response.getWriter();
        request.getSession().invalidate();
        out.println("<script type=\"text/javascript\">");
        out.println("location='managerLogin.jsp';");
        out.println("</script>");
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
            int newFoodId = foods.size() + 1;
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
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please choose at least ONE food');");
                out.println("location='kitchenManager.jsp';");
                out.println("</script>");
            }
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
