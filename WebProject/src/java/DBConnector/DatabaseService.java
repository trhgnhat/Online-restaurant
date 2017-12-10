/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnector;

import DO.FoodDO;
import DO.MemberDO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author junnguyen
 */
public class DatabaseService {
    
    private MySqlConnectionManager sqlConnectionManager;

    public DatabaseService() {
        
        sqlConnectionManager = new MySqlConnectionManager(
                "localhost", "3306", "webapplab5", "root", "crazy123");  
        
    }
    /*
        MEMBERS   
    */
    public void createMember(MemberDO member) {
   
        String sqlStatement ="INSERT INTO MEMBER VALUES('" + member.getId() + "','"
                + member.getUsername()+"',"
                + member.getPassword()+" )";
        
        //System.out.println("SQL: " + sqlStatement );
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
      
    }
    
    public void updateMember(String memberId, MemberDO member) {
   
        String sqlStatement ="UPDATE MEMBER "
                + "SET id='" + member.getId() + "', " 
                + "name='"+ member.getUsername()+"', "
                + "password=" + member.getPassword() 
                + " WHERE id='"+memberId+"'";
        
        System.out.println("SQL: " + sqlStatement );
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
    }
    
    public ArrayList<MemberDO> getAllMembers(){
        
        ArrayList<MemberDO> listOfMembers = new ArrayList<MemberDO>();
        
        
        String sqlStatement ="SELECT * FROM MEMBER";
        
        sqlConnectionManager.openConnection();
        
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        
        
        try {
            while(rs.next()){
                String id = rs.getString("id");
                String name = rs.getString("name");
                String password = rs.getString("password");
                
                MemberDO member = new MemberDO(id, name, password);
                listOfMembers.add(member);
          
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(MemberDO.class.getUsername()).log(Level.SEVERE, null, ex);
        }
        
        
        sqlConnectionManager.closeConnection();
    
        return listOfMembers;
    }
    
    public void deleteMember(MemberDO member) {
        
        
        String sqlStatement ="DELETE FROM MEMBER " 
                + "WHERE id='" + member.getId() +"'";
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
        
    }
    public ArrayList<FoodDO> getAttendedCourses(String memberID){
        ArrayList<FoodDO> listOfCourses = new ArrayList<FoodDO>();
        String sqlStatement = "SELECT course.ID, course.Username FROM course, study\n" +
                        "WHERE course.ID = study.CourseID AND study.MemberID='" + memberID + "'";
        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while(rs.next()){
                String id = rs.getString("id");
                String name = rs.getString("name");
                FoodDO course = new FoodDO(id, name);
                listOfCourses.add(course);
        
            }
        } catch (SQLException ex) {
            Logger.getLogger(FoodDO.class.getUsername()).log(Level.SEVERE, null, ex);
        }
       sqlConnectionManager.closeConnection();   
        return listOfCourses;
        
    }
    public void deleteCourseOfMember(String memberID, String courseID) {
  
        String sqlStatement ="DELETE FROM STUDY " 
                + "WHERE MemberID='" + memberID +"' AND CourseID='" + courseID + "'";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
        
    }
     public void AddCourseToMember(String memberID, String courseID) {
  
        String sqlStatement ="INSERT INTO STUDY " 
                + "VALUES ('" + memberID +"', '" + courseID + "');";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
        
    }
}
