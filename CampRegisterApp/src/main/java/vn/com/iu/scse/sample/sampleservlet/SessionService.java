/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.com.iu.scse.sample.sampleservlet;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author junnguyen
 */
public class SessionService {
    
    private HttpSession httpSession;

    public SessionService(HttpSession httpSession) {
        this.httpSession = httpSession;
    }
    
    public void addMember(String memberName){
        
        ArrayList<String> memberList = (ArrayList)httpSession.getAttribute("memberList");
        
        if (memberList==null) {
            memberList = new ArrayList<String>();
            memberList.add(memberName);
            httpSession.setAttribute("memberList", memberList);
            
        } else {
            memberList.add(memberName);
        }
        
    }
    
    public ArrayList<String> getMemberList(){
        ArrayList<String> memberList = (ArrayList)httpSession.getAttribute("memberList");
        
        if (memberList==null) {
            memberList = new ArrayList<String>();
        } 
        return memberList;
    }
    
}
