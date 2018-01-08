/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.BillDO;
import DO.MemberDO;
import DO.OrderDO;
import DO.TableDO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class OrderDS {

    private MySqlConnectionManager sqlConnectionManager;

    public OrderDS() {
        sqlConnectionManager = new MySqlConnectionManager();
    }

    public void createOrder(OrderDO order) {

        String sqlStatement = "INSERT INTO ordering VALUES(" + Integer.toString(order.getId()) + ","
                + Integer.toString(order.getMember().getId()) + ","
                + Integer.toString(order.getTable().getId()) + ","
                + Integer.toString(order.getBill().getId()) + ", '"
                + order.getDate_time() + "', "
                + order.getTotal_price() + ")";
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }

    public List getAllOrders() {
        List<OrderDO> orders = new ArrayList<>();

        String sqlStatement = "SELECT * FROM ordering";

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                orders.add(getOrderByOrderID(db_id));
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return orders;
    }

    public OrderDO getOrderByOrderID(int id) {
        OrderDO order = null;

        String sqlStatement = "SELECT * FROM ordering WHERE id=" + Integer.toString(id);

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                MemberDO db_member = new MemberDS().getMember(rs.getInt("member_id"));
                TableDO db_table = new TableDS().getTable(rs.getInt("table_id"));
                BillDO db_bill = new BillDS().getBill(rs.getInt("bill_id"));
                LocalDateTime db_date_time = rs.getTimestamp("date_time").toLocalDateTime();
                float db_total_price = rs.getFloat("total_price");
                order = new OrderDO(db_id, db_member, db_table, db_bill, db_date_time, db_total_price);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return order;
    }
    public List<OrderDO> getOrdersByMemberID(int memberID) {
        List<OrderDO> orders = new ArrayList<>();

        String sqlStatement = "SELECT * FROM ordering WHERE member_id=" + Integer.toString(memberID);

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                MemberDO db_member = new MemberDS().getMember(rs.getInt("member_id"));
                TableDO db_table = new TableDS().getTable(rs.getInt("table_id"));
                BillDO db_bill = new BillDS().getBill(rs.getInt("bill_id"));
                LocalDateTime db_date_time = rs.getTimestamp("date_time").toLocalDateTime();
                float db_total_price = rs.getFloat("total_price");
                OrderDO order = new OrderDO(db_id, db_member, db_table, db_bill, db_date_time, db_total_price);
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return orders;
    }

    public void deleteOrder(OrderDO order) {

        String sqlStatement = "DELETE FROM ordering"
                + " WHERE id=" + Integer.toString(order.getId()) + "";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
}
