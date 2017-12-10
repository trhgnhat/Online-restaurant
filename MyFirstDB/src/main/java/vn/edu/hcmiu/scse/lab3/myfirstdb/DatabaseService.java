/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmiu.scse.lab3.myfirstdb;

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
    
    
    public void createStudent(Student student) {
   
        String sqlStatement ="INSERT INTO STUDENT VALUES('" + student.getId() + "','"
                + student.getName()+"',"
                + student.getGpa()+" )";
        
        //System.out.println("SQL: " + sqlStatement );
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
      
    }
    
    
    public void updateStudent(String studentId, Student student) {
   
        String sqlStatement ="UPDATE StUDENT "
                + "SET id='" + student.getId() + "', " 
                + "name='"+ student.getName()+"', "
                + "gpa=" + student.getGpa() 
                + " WHERE id='"+studentId+"'";
        
        System.out.println("SQL: " + sqlStatement );
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
      
    }
    
    
    
    
    
    public ArrayList<Student> getAllStudents(){
        
        ArrayList<Student> listOfStudents = new ArrayList<Student>();
        
        
        String sqlStatement ="SELECT * FROM STUDENT";
        
        sqlConnectionManager.openConnection();
        
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        
        
        try {
            while(rs.next()){
                String id = rs.getString("id");
                String name = rs.getString("name");
                double gpa = rs.getDouble("gpa");
                
                Student student = new Student(id, name, gpa);
                listOfStudents.add(student);
          
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(AppTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        sqlConnectionManager.closeConnection();
    
        return listOfStudents;
    }
    
    public void deleteStudent(Student student) {
        
        
        String sqlStatement ="DELETE FROM STUDENT " 
                + "WHERE id='" + student.getId() +"'";
        
        System.out.println("SQL: " + sqlStatement );
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
        
    }
    
    
    
    
    
    
    
    
}
