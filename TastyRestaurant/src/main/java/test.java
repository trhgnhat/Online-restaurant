/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnector.FoodDS;
import DBConnector.MemberDS;
import DBConnector.OrderDS;
import DO.FoodDO;
import DO.MemberDO;
import DO.OrderDO;
import Enscrypt.EncryptDecrypt;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

/**
 *
 * @author Admin
 */
public class test {

    public static void main(String[] args) throws UnsupportedEncodingException, NoSuchPaddingException, NoSuchAlgorithmException, InvalidAlgorithmParameterException, InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
//        MemberDS memberds = new MemberDS();
//        List<MemberDO> members = memberds.getAllMembers();
//        for (MemberDO member : memberds.getAllMembers()) {
//            System.out.println(member.getId());
//            System.out.println(member.getUsername());
//            System.out.println(member.getPassword());
//            System.out.println(member.getAddress());
//            System.out.println(member.getPhone());
//            System.out.println(member.getEmail());
//            System.out.println(member.getPoint());
//            System.out.println(member.getCreditCard());
//        }
//        MemberDO member = memberds.getMember("trhgnhat","123456");
//        EncryptDecrypt service = new EncryptDecrypt();
//        String message = "This is a secret string @!@!#%_)@(*%_)@(_#( ";
//        System.out.println(message);
//        System.out.println(service.encrypt(message));
//        System.out.println(service.decrypt(service.encrypt(message)));
//        List<Integer> numbers = new ArrayList<>();
//        for (int i = 0; i<10; i++){
//            numbers.add(i);
//        }
//        System.out.println(numbers);
//        System.out.println(numbers.size());
//        System.out.println(numbers.indexOf(1));
//        numbers.add(1, 11);
//        System.out.println(numbers);
//        System.out.println(numbers.size());
//        System.out.println(numbers.indexOf(1));
//        numbers.remove(2);
//        System.out.println(numbers);
//        System.out.println(numbers.size());
//        System.out.println(numbers.indexOf(2));
//        numbers.add(1);
//        numbers.add(2);
//        numbers.add(3);
//        System.out.println(numbers);
//        MemberDO member = new MemberDS().getMember(1);
//        List<OrderDO> orders = new OrderDS().getOrdersByMemberID(member.getId());
////        List<OrderDO> orders = new OrderDS().getAllOrders();
//        for (OrderDO order : orders){
//            System.out.println(order.getId());
//            System.out.println(order.getBill().getId());
//            System.out.println(order.getMember().getId());
//            System.out.println(order.getTable().getId());
//            System.out.println(order.getDate_time());
//            System.out.println(order.getTotal_price());
//            System.out.println(order.getClass());
//            System.out.println("***********************************************");
//        }
//        OrderDS ods = new OrderDS();
//        List<OrderDO> orders = ods.getAllOrders();
//        for (OrderDO order : orders){
//            System.out.println(order.getDate_time());
//            System.out.println(order.getDate_time().getYear());
//            System.out.println(order.getDate_time().getMonth().getValue());
//            System.out.println(order.getDate_time().getDayOfMonth());
//        }
//        System.out.println(LocalDateTime.now().getDayOfYear());
//        System.out.println(new OrderDS().getOrderByOrderID(1).getDate_time().getDayOfYear()); 
        //System.out.println(LocalDateTime.now().toLocalDate() - new OrderDS().getOrderByOrderID(1).getDate_time().toLocalDate());

        List<OrderDO> orders = new OrderDS().getAllOrders();
        for (OrderDO order : orders) {
            
            int yeargap = LocalDate.now().getYear() - order.getDate_time().toLocalDate().getYear();
            int daygap = LocalDate.now().getDayOfYear() - order.getDate_time().toLocalDate().getDayOfYear();
            System.out.println(order.getDate_time().toLocalDate().getYear());
            System.out.println(LocalDate.now().getYear());
            System.out.println(order.getDate_time().toLocalDate().getDayOfYear());
            System.out.println(LocalDate.now().getDayOfYear());
            if (yeargap == 0) {
                if (daygap <= 30) {
                    if (daygap <= 7) {
                        if (daygap <= 1) {
                            System.out.println("<tr name='lastDay'>");
                        } else {
                            System.out.println("<tr name='lastWeek'>");
                        }
                    } else {
                        System.out.println("<tr name='lastMonth'>");
                    }
                } else {
                    System.out.println("<tr name='otherTime'>");
                }
            } else {
                daygap += 365;
                if (daygap <= 30) {
                    if (daygap <= 7) {
                        if (daygap <= 1) {
                            System.out.println("<tr name='lastDay'>");
                        } else {
                            System.out.println("<tr name='lastWeek'>");
                        }
                    } else {
                        System.out.println("<tr name='lastMonth'>");
                    }
                } else {
                    System.out.println("<tr name='otherTime'>");
                }
            }

        }
    }
}
