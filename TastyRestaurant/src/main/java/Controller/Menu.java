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
import static java.lang.Integer.parseInt;
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
public class Menu extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        
        if (action.equals("addFood")){
        Integer newFoodId = parseInt(request.getParameter("addFoodId"));
        String newFoodName = request.getParameter("addFoodName");
        Float newFoodPrice = pasreFloat(request.getParameter("addFoodPrice"));
        String newFoodCategory = request.getParameter("addFoodCategory");
        FoodDO newFood = new FoodDO(newFoodId, newFoodName, newFoodPrice, newFoodCategory);
        List<FoodDO> foods = new FoodDS().getAllFoods();
        for (FoodDO food : foods){
            if(newFoodId == food.getId()){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ID' " + food.getId() + " 'already exists!!');");
                out.println("location='addFood.jsp';");
                out.println("</script>");
            } else if (newFoodName == food.getName()){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Name' " + food.getName() + " 'already exists!!');");
                out.println("location='addFood.jsp';");
                out.println("</script>");
            } else{
                new FoodDS().createFood(newFood);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Adding successfully!!');");
                out.println("location='addFood.jsp';");
                out.println("</script>");
            }
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
