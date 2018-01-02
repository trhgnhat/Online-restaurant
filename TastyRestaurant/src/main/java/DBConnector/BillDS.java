/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.BillDO;
import DO.FoodDO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BillDS {

    private MySqlConnectionManager sqlConnectionManager;

    public BillDS() {
        sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "restaurant_website", "root", "nntadotzip");
    }

    public void createBill(BillDO bill) {
        sqlConnectionManager.openConnection();

        for (int i = 0; i < bill.getFood().size(); i++) {
            String sqlStatement = "INSERT INTO bill VALUES(" + Integer.toString(bill.getId()) + ","
                    + Integer.toString(bill.getFood().get(i).getId()) + ","
                    + Integer.toString(bill.getQuantity().get(i)) + ","
                    + Float.toString(bill.getPrice().get(i)) + ")";
            sqlConnectionManager.ExecuteUpdate(sqlStatement);

        }
        sqlConnectionManager.closeConnection();
    }

    public List getAllBills() {
        List<BillDO> bills = new ArrayList<>();

        String sqlStatement = "SELECT * FROM bill";

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                bills.add(getBill(db_id));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BillDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return bills;
    }

    public BillDO getBill(int id) {
        BillDO bill = null;
        
        String sqlStatement = "SELECT * FROM bill WHERE id=" + Integer.toString(id);

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                bill = new BillDO(id);
                int db_food_id = rs.getInt("food_id");
                bill.getFood().add(new FoodDS().getFood(db_food_id));
                bill.getQuantity().add(rs.getInt("food_quantity"));
                bill.getPrice().add(rs.getFloat("price"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BillDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return bill;
    }

    public void deleteBill(BillDO bill) {

        String sqlStatement = "DELETE FROM bill"
                + " WHERE id=" + Integer.toString(bill.getId()) + "";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
}
