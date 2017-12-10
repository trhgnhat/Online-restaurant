/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.webapplab6;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ShoppingServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action != null) {
            if (action.equals("logout")) {
                request.getSession().invalidate();
                response.sendRedirect("account.jsp");
//                request.getRequestDispatcher("account.jsp").forward(request, response);
            }
            //Accessed from account.jsp
            if (action.equals("showproducts")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
                dispatcher.forward(request, response);
            }
        }
        else{
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
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
        String action = request.getParameter("action");
        //Accessed from account.jsp
        if (action.equals("showproducts")) {
            //Create an account object with the parameter got from account.jsp
            String accountName = request.getParameter("name");
            String visaCard = request.getParameter("visaCard");
            String address = request.getParameter("address");
            Cart cart = new Cart(true);
            AccountBean account = new AccountBean(accountName, visaCard, address, cart);
            //Add account object into a session
            HttpSession session = request.getSession();
            session.setAttribute("account", account);
            session.setAttribute("cart", cart);
            RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
            dispatcher.forward(request, response);
        }

        //Add product into cart
        if (action.equals("addcart")) {
            //Create an account object with the parameter got from account.jsp
            String[] value = request.getParameter("product").split("\\|");
            String productName = value[0];
            double productPrice = Double.parseDouble(value[1]);
            Integer productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
            HttpSession session = request.getSession();
            AccountBean account = (AccountBean) session.getAttribute("account");
            Cart cart = account.getCart();
            //Check if 
            if (!account.getCart().getCart().isEmpty()) {
                boolean notExisted = true;
                //Check Cart if the product is already exist in the cart
                for (int i = 0; i < cart.getCart().size(); i++) {
                    if (cart.getProductInCart(i).getProductName().equals(productName)) {
                        notExisted = false;
                        cart.getProductInCart(i).setProductQuantity(cart.getProductInCart(i).getProductQuantity() + productQuantity);
                    }
                }
                if (notExisted) {
                    Product product = new Product(productName, productPrice, productQuantity);
                    cart.addToCart(product);
                }
            } else {
                Product product = new Product(productName, productPrice, productQuantity);
                cart.addToCart(product);
            }
            session.setAttribute("account", account);
            session.setAttribute("cart", cart);
            RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
            dispatcher.forward(request, response);
        }

        //Delete product out of cart
        if (action.equals("deleteproduct")) {
            String productName = request.getParameter("productName");
            HttpSession session = request.getSession();
            AccountBean account = (AccountBean) session.getAttribute("account");
            Cart cart = account.getCart();
            cart.deleteFromCart(productName);
            session.setAttribute("account", account);
            session.setAttribute("cart", cart);
            RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
            dispatcher.forward(request, response);
        }

        //Checkout
        if (action.equals("checkout")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("Checkout.jsp");
            dispatcher.forward(request, response);
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
