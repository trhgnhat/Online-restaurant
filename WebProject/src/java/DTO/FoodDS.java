/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import DBConnector.MySqlConnectionManager;
import DO.MemberDO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class FoodDS {
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;
import DO.MemberDO;
import DBConnector.MySqlConnectionManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Admin
 */
public class MemberDS {
    
    private MySqlConnectionManager sqlConnectionManager;

    public MemberDS() {
        sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "restaurant_website", "root", "crazy123");  
    }
    
    public void createMember(MemberDO member) {
        String sqlStatement ="INSERT INTO member VALUES('" + Integer.toString(member.getId()) + "','"
                + member.getUsername()+"',"
                + member.getPassword()+" )";
        createMemberINFO(member);
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
    
    public void createMemberINFO(MemberDO member) {
        String value = "";
        for(int i = 0; i < member.getInfo().size(); i++){
            value += "'" + member.getInfo().get(i).toString() + "'";
            if(i < (member.getInfo().size()-1)){
                value += ", ";
            }
        }
        String sqlStatement ="INSERT INTO memberINFO VALUES(" + value + ")";
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
    
    public ArrayList getMemberINFO(int id){
        ArrayList info = new ArrayList();
        
        String sqlStatement ="SELECT * FROM memberINFO WHERE id='" + id + "';";
        
        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while(rs.next()){
                String db_name = rs.getString("name");
                String db_address = rs.getString("address");
                String db_phone = rs.getString("phone");
                String db_email = rs.getString("email");
                int db_point = rs.getInt("point");
                String db_credit = rs.getString("credit_card");
            }
        } catch (SQLException ex) {
            Logger.getLogger(MemberDO.class.getName()).log(Level.SEVERE, null, ex);
            info = null;
        }
        sqlConnectionManager.closeConnection();
        return info;
    }
    
    public MemberDO getMember(String username, String password) {
        MemberDO member = null;
        String sqlStatement ="SELECT * FROM member WHERE username='" + username +"'and password='" + password + "';" ;
        
        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while(rs.next()){
                int db_id = rs.getInt("id");
                String db_username = rs.getString("username");
                String db_password = rs.getString("password");
                member = new MemberDO(db_id, db_username, db_password, getMemberINFO(db_id));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MemberDO.class.getName()).log(Level.SEVERE, null, ex);
            info = null;
        }
        sqlConnectionManager.closeConnection();
        return member;
    }
    
    public void updateMemberINFO(String memberId, MemberDO member) {
   
        String sqlStatement ="UPDATE memberINFO "
                + "name='"+ member.getUsername()+"', "
                + "password=" + member.getPassword() 
                + " WHERE id='"+memberId+"'";
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
}

}
