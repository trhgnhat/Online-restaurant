/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package discretemath;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Test {

    public static void main(String[] args) {
        String b = "123456";
        String[] a;
        a = b.split("(?!^)");
        for(int i = 0; i < a.length; i++){
            System.out.println(a[i]);
        }
        
    }

}
