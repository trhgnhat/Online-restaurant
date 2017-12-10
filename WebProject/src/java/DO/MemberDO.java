/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DO;
//Database Object

import java.util.ArrayList;

/**
 *
 * @author junnguyen
 */
public class MemberDO {

    private int id;

    private String username;

    private String password;

    private ArrayList info;
    /*ArrayList info contains:
        0/name - Full Name of the account owner
        1/address 
        2/phone
        3/email
        4/point - Cumulative points (for booking table)
        5/credit_card
     */
    
    public MemberDO(int id, String username, String password, ArrayList info) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.info = info;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public ArrayList getInfo() {
        return info;
    }

    public void setInfo(ArrayList info) {
        this.info = info;
    }

}
