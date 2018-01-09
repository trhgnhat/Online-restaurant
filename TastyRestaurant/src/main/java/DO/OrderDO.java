/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DO;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class OrderDO {

    private int id;
    private MemberDO member;
    private TableDO table;
    private BillDO bill;
    private LocalDateTime date_time;
    private float total_price = 0;

    public OrderDO(int id, MemberDO member, TableDO table, BillDO bill) {
        this.id = id;
        this.member = member;
        this.table = table;
        this.bill = bill;
        this.date_time = LocalDateTime.now();
        for (int i = 0; i < bill.getFood().size(); i++) {
            this.total_price += bill.getFood().get(i).getPrice() * bill.getQuantity().get(i);
        }
    }

    public OrderDO(int id, MemberDO member, TableDO table, BillDO bill, LocalDateTime date_time, float total_price) {
        this.id = id;
        this.member = member;
        this.table = table;
        this.bill = bill;
        this.date_time = date_time;
        this.total_price = total_price;
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

    public BillDO getBill() {
        return bill;
    }

    public void setBill(BillDO bill) {
        this.bill = bill;
    }

    public LocalDateTime getDate_time() {
        return date_time;
    }

    public void setDate_time(LocalDateTime date_time) {
        this.date_time = date_time;
    }

    public float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(float total_price) {
        this.total_price = total_price;
    }

}
