/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.MemberDO;
import java.util.List;

/**
 *
 * @author Admin
 */
public class test {
    public static void main(String[] args) {
        MemberDS memberds = new MemberDS();
        List<MemberDO> members = memberds.getAllMembers();
        for (MemberDO member : memberds.getAllMembers()) {
            System.out.println(member.getId());
            System.out.println(member.getUsername());
            System.out.println(member.getPassword());
            System.out.println(member.getAddress());
            System.out.println(member.getPhone());
            System.out.println(member.getEmail());
            System.out.println(member.getPoint());
            System.out.println(member.getCreditCard());
        }
        MemberDO member = memberds.getMember("trhgnhat","123456");
    }
}
