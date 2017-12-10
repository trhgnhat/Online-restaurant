/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.com.iu.scse.sample.sampleservlet;

import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author junnguyen
 */
public class ApplicationAttributeService {
    
    private ServletContext servletContext;

    public ApplicationAttributeService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }
    
    public void addMember(String memberName){
        
        ArrayList<String> memberList = (ArrayList)servletContext.getAttribute("memberList");
        
        if (memberList==null) {
            memberList = new ArrayList<String>();
            memberList.add(memberName);
            servletContext.setAttribute("memberList", memberList);
            
        } else {
            memberList.add(memberName);
        }
        
    }
    
    public ArrayList<String> getMemberList(){
        ArrayList<String> memberList = (ArrayList)servletContext.getAttribute("memberList");
        
        if (memberList==null) {
            memberList = new ArrayList<String>();
        } 
        return memberList;
    }
    
    
    
}
