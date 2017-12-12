/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DO;

/**
 *
 * @author Admin
 */
public class TableDO {

    private int id;
    private int seat;
    private int status; //1 = TRUE is available, 0 = FALSE means this table is booked or being used.

    public TableDO(int id, int seat, int status) {
        this.id = id;
        this.seat = seat;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSeat() {
        return seat;
    }

    public void setSeat(int seat) {
        this.seat = seat;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
