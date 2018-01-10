/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.MemberDO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class MemberDS {

    private MySqlConnectionManager sqlConnectionManager;

    public MemberDS() {
        sqlConnectionManager = new MySqlConnectionManager();
    }

    /**
     * **********************
     * !!! REGISTER !!! **********************
     */
    public void createMember(MemberDO member) {
        String sqlStatement = "INSERT INTO member VALUES(" + Integer.toString(member.getId()) + ",'"
                + member.getUsername() + "','"
                + member.getPassword() + "','"
                + member.getName() + "','"
                + member.getAddress() + "','"
                + member.getPhone() + "','"
                + member.getEmail() + "',"
                + Integer.toString(member.getPoint()) + ",'"
                + member.getCreditCard() + "')";
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }

    /**
     * **********************
     * !!! LOGIN !!! **********************
     */
    public MemberDO getMember(String username, String password) {
        MemberDO member = null;
        String sqlStatement = "SELECT * FROM member WHERE username='" + username + "'and password='" + password + "';";

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                String db_username = rs.getString("username");
                String db_password = rs.getString("password");
                String db_name = rs.getString("name");
                String db_address = rs.getString("address");
                String db_phone = rs.getString("phone");
                String db_email = rs.getString("email");
                int db_point = rs.getInt("point");
                String db_creditCard = rs.getString("credit_card");
                member = new MemberDO(db_id, db_username, db_password, db_name, db_address, db_phone, db_email, db_point, db_creditCard);
            }
        } catch (SQLException ex) {
            member = null;
            Logger.getLogger(MemberDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return member;
    }

    public List<MemberDO> getAllMembers() {
        List<MemberDO> members = new ArrayList<>();

        String sqlStatement = "SELECT * FROM member";

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                members.add(getMember(db_id));
            }
        } catch (SQLException ex) {
            Logger.getLogger(MemberDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return members;
    }

    public MemberDO getMember(int id) {
        MemberDO member = null;
        String sqlStatement = "SELECT * FROM member WHERE id=" + id;

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                String db_username = rs.getString("username");
                String db_password = rs.getString("password");
                String db_name = rs.getString("name");
                String db_address = rs.getString("address");
                String db_phone = rs.getString("phone");
                String db_email = rs.getString("email");
                int db_point = rs.getInt("point");
                String db_creditCard = rs.getString("credit_card");
                member = new MemberDO(db_id, db_username, db_password, db_name, db_address, db_phone, db_email, db_point, db_creditCard);
            }
        } catch (SQLException ex) {
            Logger.getLogger(MemberDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return member;
    }

    /**
     * ***********************
     * !!! UPDATE RMATION !!! ***********************
     */
    public void updateMember(MemberDO member) {
        String sqlStatement = "UPDATE member "
                + "SET "
                + "name='" + member.getName() + "', "
                + "address='" + member.getAddress() + "', "
                + "phone='" + member.getPhone() + "', "
                + "email='" + member.getEmail() + "', "
                + "point=" + Integer.toString(member.getPoint()) + ", "
                + "credit_card='" + member.getCreditCard() + "', "
                + "password='" + member.getPassword() + "' "
                + " WHERE id=" + Integer.toString(member.getId()) + "";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
    public void deleteMember(MemberDO member) {

        String sqlStatement = "DELETE FROM member"
                + " WHERE id=" + Integer.toString(member.getId()) + "";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
}
