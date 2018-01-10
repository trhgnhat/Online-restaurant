/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.BookingDO;
import DO.MemberDO;
import DO.TableDO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class BookingDS {

    private MySqlConnectionManager sqlConnectionManager;

    public BookingDS() {
        sqlConnectionManager = new MySqlConnectionManager();
    }

    public void createBooking(BookingDO booking) {
        String sqlStatement = "INSERT INTO booking VALUES(" + Integer.toString(booking.getId()) + ","
                + Integer.toString(booking.getTable().getId()) + ","
                + Integer.toString(booking.getMember().getId()) + ", '"
                + booking.getBooked_date().toString() + "', '"
                + booking.getBooked_time().toString() + "', '"
                + booking.getExpired_time().toString() + "')";
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }

    public List<BookingDO> getAllBookings() {
        List<BookingDO> bookings = new ArrayList<>();

        String sqlStatement = "SELECT * FROM booking";

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                bookings.add(getBooking(db_id));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return bookings;
    }

    public BookingDO getBooking(int id) {
        BookingDO booking = null;
        String sqlStatement = "SELECT * FROM booking WHERE id=" + Integer.toString(id);

        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while (rs.next()) {
                int db_id = rs.getInt("id");
                LocalDate db_date = rs.getTimestamp("booking_date").toLocalDateTime().toLocalDate();
                LocalTime db_time = rs.getTimestamp("booking_time").toLocalDateTime().toLocalTime();
                MemberDO db_member = new MemberDS().getMember(rs.getInt("member_id"));
                TableDO db_table = new TableDS().getTable(rs.getInt("table_id"));
                booking = new BookingDO(db_id, db_member, db_table, db_date, db_time);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookingDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        sqlConnectionManager.closeConnection();
        return booking;
    }

    public void deleteBooking(BookingDO booking) {

        String sqlStatement = "DELETE FROM booking"
                + " WHERE id=" + Integer.toString(booking.getId()) + "";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
}
