/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javatest;

import java.text.DecimalFormat;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class JavaTest {

    private static ArrayList<Product> arr = new ArrayList();

    static ArrayList<Product> getArr() {
        return arr;
    }

    static void setArr(ArrayList<Product> arr) {
        JavaTest.arr = arr;
    }

    static void addToArr(Product product) {
        arr.add(product);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ArrayList<String> arr = new ArrayList<String>();
        for(int i = 0; i < 10; i++){
            arr.add(Integer.toString(i)+"a");
        }
        arr.remove(9);
        for(int i = 0; i < arr.size(); i++){
            System.out.print(arr.get(i));
            System.out.println("--At index of " + i);
        }
    }

}
