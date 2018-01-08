/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DBConnector.BillDS;
import DBConnector.BookingDS;
import DBConnector.FoodDS;
import DBConnector.MemberDS;
import DBConnector.OrderDS;
import DBConnector.TableDS;
import DO.BillDO;
import DO.BookingDO;
import DO.FoodDO;
import DO.MemberDO;
import DO.OrderDO;
import DO.TableDO;
import Enscrypt.EncryptDecrypt;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
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

//        LocalDate date = LocalDate.now();
//        DateTimeFormatter formatters = DateTimeFormatter.ofPattern("d/MM/uuuu");
//        //String text = date.format(DateTimeFormatter.ofPattern("MM-dd-uuuu"));
//        String text = "11-25-1997";
//        LocalDate parsedDate = LocalDate.parse(text, DateTimeFormatter.ofPattern("MM-dd-uuuu"));
//        
//        System.out.println("date: " + date); // date: 2016-09-25
//        System.out.println("Text format " + text); // Text format 25/09/2016
//        System.out.println("parsedDate: " + parsedDate); // parsedDate: 2016-09-25
//        LocalTime time = LocalTime.now();
//        String inputtime = "11:03:05";
//        LocalTime formattedTime = LocalTime.parse(inputtime, DateTimeFormatter.ofPattern("HH:mm:ss"));
//        System.out.println("time: " + time);
//        System.out.println("formattedTime: " + formattedTime);
        OrderDO order = new OrderDO(((OrderDO) new OrderDS().getAllOrders().get(new OrderDS().getAllOrders().size() - 1)).getId() + 1, new MemberDS().getMember(1), new TableDS().getTable(1), new BillDS().getBill(4));
        new OrderDS().createOrder(order);
    }
}
