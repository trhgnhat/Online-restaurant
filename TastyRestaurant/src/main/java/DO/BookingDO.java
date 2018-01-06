/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DO;

import java.time.*;
/**
 *
 * @author Admin
 */
public class BookingDO {
    private int id;
    private MemberDO member; //who books this ?
    private TableDO table;  // which one is booked?
    private LocalDate booked_date; 
    private LocalTime booked_time;
    private LocalTime expired_time; // default: = booked_time + 10 (minutes)

    public BookingDO(int id, MemberDO member, TableDO table, LocalDate booked_date, LocalTime booked_time) {
        this.id = id;
        this.member = member;
        this.table = table;
        this.booked_date = booked_date;
        this.booked_time = booked_time;
        this.expired_time = booked_time.plusMinutes(10);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public MemberDO getMember() {
        return member;
    }

    public void setMember(MemberDO member) {
        this.member = member;
    }

    public TableDO getTable() {
        return table;
    }

    public void setTable(TableDO table) {
        this.table = table;
    }

    public LocalDate getBooked_date() {
        return booked_date;
    }

    public void setBooked_date(LocalDate booked_date) {
        this.booked_date = booked_date;
    }

    public LocalTime getBooked_time() {
        return booked_time;
    }

    public void setBooked_time(LocalTime booked_time) {
        this.booked_time = booked_time;
    }

    public LocalTime getExpired_time() {
        return expired_time;
    }

    public void setExpired_time(LocalTime expired_time) {
        this.expired_time = expired_time;
    }

    
}
