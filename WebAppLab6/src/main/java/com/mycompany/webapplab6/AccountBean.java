/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.webapplab6;

/**
 *
 * @author Admin
 */
public class AccountBean {
    private String accountName;
    private String accountVISA;
    private String accountAddress;
    private Cart cart = new Cart(true);

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getAccountVISA() {
        return accountVISA;
    }

    public void setAccountVISA(String accountVISA) {
        this.accountVISA = accountVISA;
    }

    public String getAccountAddress() {
        return accountAddress;
    }

    public void setAccountAddress(String accountAddress) {
        this.accountAddress = accountAddress;
    }

    public AccountBean() {
    }

    public AccountBean(String accountName, String accountVISA, String accountAddress, Cart cart) {
        this.accountName = accountName;
        this.accountVISA = accountVISA;
        this.accountAddress = accountAddress;
        this.cart = cart;
    }

    
}
