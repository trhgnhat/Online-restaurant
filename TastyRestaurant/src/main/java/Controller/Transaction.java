/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBConnector.BillDS;
import DBConnector.BookingDS;
import DBConnector.FoodDS;
import DBConnector.MemberDS;
import DBConnector.OrderDS;
import DBConnector.TableDS;
import DO.BillDO;
import DO.BookingDO;
import DO.FoodDO;
import DO.MemberDO;
import DO.OrderDO;
import DO.TableDO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
        if (session.getAttribute("member") == null || session.getAttribute("member").equals("")) {
            // Link to Login page
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please Login First!');");
            out.println("location='loginSite.jsp';");
            out.println("</script>");
        } else {
            String action = request.getParameter("action");

            if (action.equals("booking")) {
                LocalDate chosenDate = LocalDate.parse(request.getParameter("pickADate"), DateTimeFormatter.ofPattern("MM/dd/uuuu"));
                LocalTime chosenTime = LocalTime.parse(request.getParameter("pickATime"), DateTimeFormatter.ofPattern("HH:mm"));
                TableDO chosenTable = new TableDS().getTable(Integer.parseInt(request.getParameter("tableChoices")));
                MemberDO member = (MemberDO) request.getSession().getAttribute("member");
                BookingDO booking = new BookingDO(new BookingDS().getAllBookings().size() + 1, member, chosenTable, chosenDate, chosenTime);
                new BookingDS().createBooking(booking);
                request.getSession().invalidate();
                request.getSession().setAttribute("member", member);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Successfully! ');");
                out.println("location='booking.jsp';");
                out.println("</script>");
            } //Show available tables for booking
            else if (action.equals("showBooking")) {
                String pickedDate = request.getParameter("pickADate"); //MM/dd/uuuu
                String pickedTime = request.getParameter("pickATime"); //"HH:mm"
                if (pickedDate.equals("") || pickedTime.equals("")) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Please Choose Date & Time!');");
                    out.println("location='booking.jsp';");
                    out.println("</script>");
                } else {
                    LocalDate date = LocalDate.parse(pickedDate, DateTimeFormatter.ofPattern("MM/dd/uuuu"));
                    LocalTime time = LocalTime.parse(pickedTime, DateTimeFormatter.ofPattern("HH:mm"));
                    List<BookingDO> apms = new BookingDS().getAllBookings();
                    List<TableDO> availableTables = new TableDS().getAllTables();
                    for (BookingDO apm : apms) {
                        if (availableTables.isEmpty()) {
                            break;
                        }
                        //If there is at least 1 book has the same booking date
                        if (apm.getBooked_date().equals(date)) {
                            // bookedTime <= pickTime <= expireTime
                            if ((time.isBefore(apm.getExpired_time()) && time.isAfter(apm.getBooked_time())) || time.equals(apm.getExpired_time()) || time.equals(apm.getBooked_time())) {
                                availableTables.remove(apm.getTable().getId() - 1);
                            }
                        }
                    }
                    request.getSession().setAttribute("availableTables", availableTables);
                    request.getSession().setAttribute("pickedDate", pickedDate);
                    request.getSession().setAttribute("pickedTime", pickedTime);
                }
                request.getRequestDispatcher("booking.jsp").forward(request, response);
            } //Order
            else if (action.equals("order")) {
                BillDO bill = (BillDO) request.getSession().getAttribute("bill");
                OrderDO lastOrder = (OrderDO) new OrderDS().getAllOrders().get(new OrderDS().getAllOrders().size() - 1);
                MemberDO member = (MemberDO) request.getSession().getAttribute("member");
                TableDO table = new TableDS().getTable(Integer.parseInt(request.getParameter("tableID")));
                OrderDO order = new OrderDO(lastOrder.getId()+1, member, table, bill);
                new BillDS().createBill(bill);
                new OrderDS().createOrder(order);
                member.setPoint(member.getPoint() + 10);
                new MemberDS().updateMember(member);
                request.getSession().setAttribute("bill", null);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Thanks you, see you again!');");
                out.println("location='homepage.jsp';");
                out.println("</script>");
            } //Add food into Cart (or Bill)
            else if (action.equals("addFood")) {
                if (request.getSession().getAttribute("bill") == null) {
                    request.getSession().setAttribute("bill", new BillDO(new BillDS().getAllBills().size() + 1));
                }
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
//                float price = Float.parseFloat(request.getParameter("price"));
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
                    out.println("<script type=\"text/javascript\">");
                    out.println("location='menu.jsp';");
                    out.println("</script>");

                }//Check duplication
                else {
                    boolean isExisted = false;
                    for (int i = 0; i < bill.getFood().size(); i++) {
                        //If the food already exist in the bill
                        if (bill.getFood().get(i).getId() == Integer.parseInt(request.getParameter("foodID"))) {
                            isExisted = true;
                            bill.getFood().add(bill.getFood().get(i));
                            bill.getQuantity().add(bill.getQuantity().get(i) + Integer.parseInt(request.getParameter("quantity")));
                            bill.getPrice().add(Float.parseFloat(request.getParameter("price")) * (bill.getQuantity().get(i) + Integer.parseInt(request.getParameter("quantity"))));
                            bill.getFood().remove(i);
                            bill.getQuantity().remove(i);
                            bill.getPrice().remove(i);
                            out.println("<script type=\"text/javascript\">");
                            out.println("location='menu.jsp';");
                            out.println("</script>");
                            break;
                        }
                    }
                    if (!isExisted) {
                        bill.getFood().add(new FoodDS().getFood(Integer.parseInt(request.getParameter("foodID"))));
                        bill.getQuantity().add(Integer.parseInt(request.getParameter("quantity")));
                        bill.getPrice().add(Float.parseFloat(request.getParameter("price")) * Integer.parseInt(request.getParameter("quantity")));
                        out.println("<script type=\"text/javascript\">");
                        out.println("location='menu.jsp';");
                        out.println("</script>");
                    }
                }
                request.getSession().setAttribute("bill", bill);
            } else if (action.equals("deleteFood")) {
                BillDO bill = (BillDO) request.getSession().getAttribute("bill");
                FoodDO food = new FoodDS().getFood(Integer.parseInt(request.getParameter("FoodID")));
                for (int i = 0; i < bill.getFood().size(); i++) {
                    if (bill.getFood().get(i).equals(food)) {
                        bill.getFood().remove(i);
                        bill.getQuantity().remove(i);
                        bill.getPrice().remove(i);
                        out.println("<script type=\"text/javascript\">");
                        out.println("location='menu.jsp';");
                        out.println("</script>");
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
