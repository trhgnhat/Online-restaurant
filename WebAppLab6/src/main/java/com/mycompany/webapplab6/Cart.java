/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.webapplab6;

import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author Admin
 */
public class Cart {

    private ArrayList<Product> cart;
    private Product productInCart;

    public ArrayList getCart() {
        return cart;
    }

    public Product getProductInCart(int index) {
        this.productInCart = cart.get(index);
        return productInCart;
    }

    public Product getProductInCart() {
        return productInCart;
    }

    public void setProductInCart(Product productInCart) {
        this.productInCart = productInCart;
    }

    public void setCart(ArrayList cart) {
        this.cart = cart;
    }

    public void addToCart(Product product) {
        this.cart.add(product);
    }

    public void deleteFromCart(String productName) {
        for (Iterator<Product> it = cart.iterator(); it.hasNext();) {
            Product product = it.next();
            if (product.getProductName().equals(productName)) {
                it.remove();
            }
        }
    }

    public Cart() {
    }

    public Cart(boolean isNew) {
        if (isNew) {
            this.cart = new ArrayList<Product>();
        }
    }
}
