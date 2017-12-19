/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import Enscrypt.EncryptDecrypt;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
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
        List<Integer> numbers = new ArrayList<>();
        for (int i = 0; i<10; i++){
            numbers.add(i);
        }
        System.out.println(numbers);
        System.out.println(numbers.size());
        System.out.println(numbers.indexOf(1));
        numbers.add(1, 11);
        System.out.println(numbers);
        System.out.println(numbers.size());
        System.out.println(numbers.indexOf(1));
        numbers.remove(2);
        System.out.println(numbers);
        System.out.println(numbers.size());
        System.out.println(numbers.indexOf(2));
        numbers.add(1);
        numbers.add(2);
        numbers.add(3);
        System.out.println(numbers);
    }
}
