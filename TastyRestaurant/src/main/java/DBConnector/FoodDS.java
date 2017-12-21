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
import java.util.List;
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
                "localhost", "3306", "restaurant_website", "root", "nntadotzip");
    }

    public void createFood(FoodDO food) {
        String sqlStatement = "INSERT INTO food VALUES(" + Integer.toString(food.getId()) + ",'"
                + food.getName() + "',"
                + Float.toString(food.getPrice()) + ",'"
                + food.getCategory() + "')";
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }

    public List<FoodDO> getAllFoods() {
        List<FoodDO> foods = new ArrayList<>();

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
                String db_category = rs.getString("category");
                food = new FoodDO(db_id, db_name, db_price, db_category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return food;
    }
    public List getFoodsByCategory(String category) {
        List<FoodDO> foods = new ArrayList<>();

        String sqlStatement = "SELECT * FROM food WHERE category='" + category +"'";

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                foods.add(getFood(db_id));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return foods;
    }

    public void updateFood(FoodDO food) {

        String sqlStatement = "UPDATE food "
                + "SET "
                + "name='" + food.getName() + "', "
                + "price=" + Float.toString(food.getPrice())
                + "category='" + food.getCategory() + "' "
                + " WHERE id=" + Integer.toString(food.getId()) + "";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
}
