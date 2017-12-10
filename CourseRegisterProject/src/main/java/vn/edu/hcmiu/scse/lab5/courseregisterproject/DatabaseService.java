/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmiu.scse.lab5.courseregisterproject;

import DO.CourseDO;
import DO.StudentDO;
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
        STUDENTS   
    */
    public void createStudent(StudentDO student) {
   
        String sqlStatement ="INSERT INTO STUDENT VALUES('" + student.getId() + "','"
                + student.getName()+"',"
                + student.getGpa()+" )";
        
        //System.out.println("SQL: " + sqlStatement );
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
      
    }
    
    public void updateStudent(String studentId, StudentDO student) {
   
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
    
    public ArrayList<StudentDO> getAllStudents(){
        
        ArrayList<StudentDO> listOfStudents = new ArrayList<StudentDO>();
        
        
        String sqlStatement ="SELECT * FROM STUDENT";
        
        sqlConnectionManager.openConnection();
        
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        
        
        try {
            while(rs.next()){
                String id = rs.getString("id");
                String name = rs.getString("name");
                double gpa = rs.getDouble("gpa");
                
                StudentDO student = new StudentDO(id, name, gpa);
                listOfStudents.add(student);
          
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        sqlConnectionManager.closeConnection();
    
        return listOfStudents;
    }
    
    public void deleteStudent(StudentDO student) {
        
        
        String sqlStatement ="DELETE FROM STUDENT " 
                + "WHERE id='" + student.getId() +"'";
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
        
    }
    public ArrayList<CourseDO> getAttendedCourses(String studentID){
        ArrayList<CourseDO> listOfCourses = new ArrayList<CourseDO>();
        String sqlStatement = "SELECT course.ID, course.Name FROM course, study\n" +
                        "WHERE course.ID = study.CourseID AND study.StudentID='" + studentID + "'";
        sqlConnectionManager.openConnection();
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        try {
            while(rs.next()){
                String id = rs.getString("id");
                String name = rs.getString("name");
                CourseDO course = new CourseDO(id, name);
                listOfCourses.add(course);
        
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDO.class.getName()).log(Level.SEVERE, null, ex);
        }
       sqlConnectionManager.closeConnection();   
        return listOfCourses;
        
    }
    public void deleteCourseOfStudent(String studentID, String courseID) {
  
        String sqlStatement ="DELETE FROM STUDY " 
                + "WHERE StudentID='" + studentID +"' AND CourseID='" + courseID + "'";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
        
    }
     public void AddCourseToStudent(String studentID, String courseID) {
  
        String sqlStatement ="INSERT INTO STUDY " 
                + "VALUES ('" + studentID +"', '" + courseID + "');";

        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
        
    }
    
    /*
        COURSES   
    */
    public void createCourse(CourseDO course) {
   
        String sqlStatement ="INSERT INTO COURSE VALUES('" + course.getId() + "','"
                + course.getName()+" )";
        
        //System.out.println("SQL: " + sqlStatement );
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
      
    }
    
    public void updateCourse(String courseId, CourseDO course) {
   
        String sqlStatement ="UPDATE COURSE "
                + "SET id='" + course.getId() + "', " 
                + "name='"+ course.getName()             
                + " WHERE id='"+courseId+"'";
        
        System.out.println("SQL: " + sqlStatement );
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
      
    }
    
    public ArrayList<CourseDO> getAllCourses(){
        
        ArrayList<CourseDO> listOfCourses = new ArrayList<CourseDO>();
        
        
        String sqlStatement ="SELECT * FROM COURSE";
        
        sqlConnectionManager.openConnection();
        
        ResultSet rs = sqlConnectionManager.ExecuteQuery(sqlStatement);
        
        
        try {
            while(rs.next()){
                String id = rs.getString("id");
                String name = rs.getString("name");
                                
                CourseDO course = new CourseDO(id, name);
                listOfCourses.add(course);
          
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        sqlConnectionManager.closeConnection();
    
        return listOfCourses;
    }
    
    public void deleteCourse(CourseDO course) {
        
        
        String sqlStatement ="DELETE FROM COURSE " 
                + "WHERE id='" + course.getId() +"'";
        
        sqlConnectionManager.openConnection();
        sqlConnectionManager.ExecuteUpdate(sqlStatement);
        sqlConnectionManager.closeConnection();
        
    }  
     
}
