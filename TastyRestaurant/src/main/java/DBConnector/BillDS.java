/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.BillDO;
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
public class BillDS {

    private MySqlConnectionManager sqlConnectionManager;

    public BillDS() {
        sqlConnectionManager = new MySqlConnectionManager();
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
                boolean isNotExist = true;
                for (BillDO bill : bills) {
                    if (bill.getId() == rs.getInt("id")) {
                        isNotExist = false;
                    }
                }
                if (bills.isEmpty() || isNotExist) {
                    int db_id = rs.getInt("id");
                    bills.add(getBill(db_id));
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(BillDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return bills;
    }

    public BillDO getBill(int id) {
        BillDO bill = new BillDO(id);

        String sqlStatement = "SELECT * FROM bill WHERE id=" + Integer.toString(id);

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
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
