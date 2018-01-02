/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.TableDO;
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
public class TableDS {
    private MySqlConnectionManager sqlConnectionManager;

    public TableDS() {
        sqlConnectionManager = new MySqlConnectionManager();
    }

    public void createTable(TableDO table) {
        String sqlStatement = "INSERT INTO tables VALUES(" + Integer.toString(table.getId()) + ","
                + Integer.toString(table.getSeat()) + ","
                + Integer.toString(table.getStatus()) + " )";
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }

    public List getAllTables() {
        List<TableDO> tables = new ArrayList<>();

        String sqlStatement = "SELECT * FROM tables";

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                tables.add(getTable(db_id));
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return tables;
    }

    public TableDO getTable(int id) {
        TableDO table = null;
        String sqlStatement = "SELECT * FROM tables WHERE id=" + Integer.toString(id);

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                int db_seat = rs.getInt("seat");
                int db_status = rs.getInt("status");
                table = new TableDO(db_id, db_seat, db_status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TableDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return table;
    }

    public void updateTable(TableDO table) {

        String sqlStatement = "UPDATE tables "
                + "SET "
                + "seat='" + table.getSeat() + "', "
                + "status=" + Float.toString(table.getStatus())
                + " WHERE id=" + Integer.toString(table.getId()) + "";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
}
