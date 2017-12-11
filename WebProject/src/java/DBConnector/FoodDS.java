/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.FoodDO;
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

    private MySqlConnectionManager sqlConnectionManager;

    public FoodDS() {
        sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "restaurant_website", "root", "crazy123");
    }

    public void createFood(FoodDO food) {
        String sqlStatement = "INSERT INTO food VALUES(" + Integer.toString(food.getId()) + ",'"
                + food.getName() + "',"
                + Float.toString(food.getPrice()) + " )";
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }

    public ArrayList getAllFoods() {
        ArrayList<FoodDO> foods = new ArrayList<FoodDO>();

        String sqlStatement = "SELECT * FROM food";

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                foods.add(getFood(db_id));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDO.class.getName()).log(Level.SEVERE, null, ex);
            foods = null;
        }
        sqlConnectionManager.closeConnection();
        return foods;
    }

    public FoodDO getFood(int id) {
        FoodDO food = null;
        String sqlStatement = "SELECT * FROM food WHERE id=" + Integer.toString(id);

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                String db_name = rs.getString("name");
                float db_price = rs.getFloat("price");
                food = new FoodDO(db_id, db_name, db_price);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDO.class.getName()).log(Level.SEVERE, null, ex);
            food = null;
        }
        sqlConnectionManager.closeConnection();
        return food;
    }

    public void updateFood(FoodDO food) {

        String sqlStatement = "UPDATE food "
                + "SET "
                + "name='" + food.getName() + "', "
                + "price=" + Float.toString(food.getPrice())
                + " WHERE id=" + Integer.toString(food.getId()) + "";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
}
