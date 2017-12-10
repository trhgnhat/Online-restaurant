/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DO;
//Database Object
/**
 *
 * @author junnguyen
 */
public class MemberDO {
    
    private String id;
    private String username;
    private String password;

    public MemberDO(String id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return username;
    }

    public void setName(String username) {
        this.username = username;
    }

    public String getGpa() {
        return password;
    }

    public void setGpa(String password) {
        this.password = password;
    }
}
