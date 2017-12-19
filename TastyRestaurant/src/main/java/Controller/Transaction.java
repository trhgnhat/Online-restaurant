/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBConnector.BillDS;
import DBConnector.FoodDS;
import DO.BillDO;
import DO.FoodDO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Transaction extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        if (session.getAttribute("member") == null) {
            // Link to Login page
            response.sendRedirect("login.jsp");
        } else {
            String action = request.getParameter("action");

            //Booking
            if (action.equals("booking")) {

            } //Order
            else if (action.equals("order")) {
                int id = new BillDS().getAllBills().size() + 1;
                BillDO bill = new BillDO(id);
                request.getSession().setAttribute("bill", bill);
            } //Add food into Cart (or Bill)
            else if (action.equals("addFood")) {
                BillDO bill = (BillDO) request.getSession().getAttribute("bill");
                //if The bill is empty
                if (bill.getFood().isEmpty()) {
                    //#1
//                List<FoodDO> foods = (List<FoodDO>) bill.getFood();
//                List<Integer> quantities = (List<Integer>) bill.getQuantity();
//                List<Float> prices = (List<Float>) bill.getPrice();
//                
//                FoodDO food = new FoodDS().getFood(Integer.parseInt(request.getParameter("foodID")));
//                int quantity = Integer.parseInt(request.getParameter("quantity"));
//                float price = Float.parseFloat(request.getParameter("quantity"));
//                
//                foods.add(food);
//                quantities.add(quantity);
//                prices.add(price);
//                
//                bill.setFood(foods);
//                bill.setQuantity(quantities);
//                bill.setPrice(prices);
                    //Similar to this
                    //#2
                    bill.getFood().add(new FoodDS().getFood(Integer.parseInt(request.getParameter("foodID"))));
                    bill.getQuantity().add(Integer.parseInt(request.getParameter("quantity")));
                    bill.getPrice().add(Float.parseFloat(request.getParameter("price")) * Integer.parseInt(request.getParameter("quantity")));

                }//Check duplication
                else {
                    boolean isExisted = false;
                    for (int i = 0; i < bill.getFood().size(); i++) {
                        //If the food already exist in the bill
                        if (bill.getFood().get(i).equals(new FoodDS().getFood(Integer.parseInt(request.getParameter("foodID"))))) {
                            isExisted = true;
                            bill.getFood().add(bill.getFood().get(i));
                            bill.getQuantity().add(bill.getQuantity().get(i) + Integer.parseInt(request.getParameter("quantity")));
                            bill.getPrice().add(Float.parseFloat(request.getParameter("price")) * Integer.parseInt(request.getParameter("quantity")));
                            bill.getFood().remove(i);
                            bill.getQuantity().remove(i);
                            bill.getPrice().remove(i);
                            break;
                        }
                    }
                    if (!isExisted) {
                        bill.getFood().add(new FoodDS().getFood(Integer.parseInt(request.getParameter("foodID"))));
                        bill.getQuantity().add(Integer.parseInt(request.getParameter("quantity")));
                        bill.getPrice().add(Float.parseFloat(request.getParameter("price")) * Integer.parseInt(request.getParameter("quantity")));
                    }
                }
                request.getSession().setAttribute("bill", bill);
            }
            else if(action.equals("deleteFood")){
                BillDO bill = (BillDO) request.getSession().getAttribute("bill");
                FoodDO food = new FoodDS().getFood(Integer.parseInt(request.getParameter("FoodID")));
                for (int i = 0; i < bill.getFood().size(); i++){
                    if(bill.getFood().get(i).equals(food)){
                        bill.getFood().remove(i);
                        bill.getQuantity().remove(i);
                        bill.getPrice().remove(i);
                        break;
                    }
                }
                
            }
        }
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
