/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DO;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BillDO {

    private int id;
    private List<FoodDO> food;
    private List<Integer> quantity;
    private List<Float> price;

    public BillDO(int id) {
        this.id = id;
        this.food = new ArrayList<>();
        this.quantity = new ArrayList<>();
        this.price = new ArrayList<>();
    }

    public BillDO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<FoodDO> getFood() {
        return food;
    }

    public void setFood(List<FoodDO> food) {
        this.food = food;
    }

    public List<Integer> getQuantity() {
        return quantity;
    }

    public void setQuantity(List<Integer> quantity) {
        this.quantity = quantity;
    }

    public List<Float> getPrice() {
        return price;
    }

    public void setPrice(List<Float> price) {
        this.price = price;
    }
}
