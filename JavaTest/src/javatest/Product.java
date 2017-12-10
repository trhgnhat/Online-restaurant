/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatest;

/**
 *
 * @author Admin
 */
public class Product {
    private String productName;

    public Product(String productName, int productPrice) {
        this.productName = productName;
        this.productPrice = productPrice;
    }
    private int productPrice;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
}
