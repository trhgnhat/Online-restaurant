/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.edu.hcmiu.scse.lab3.myfirstdb;

import java.util.ArrayList;

/**
 *
 * @author junnguyen
 */
public class AppTest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
//        
        DatabaseService databaseService = new DatabaseService();
        ArrayList<Student> listOfStudents = databaseService.getAllStudents();
        
        for (Student student : listOfStudents) {
            
            System.out.println(student.getId() 
                    + " - " + student.getName() 
                    + " - " + student.getGpa());
            
            
        }
        
        

//         Student student = new Student("it777", "Nam", 70);
//         databaseService.createStudent(student);
      
//          Student student = new Student("it777-3333", "Nam-2", 90);
//          databaseService.updateStudent("it777", student);

//          databaseService.deleteStudent(student);


        
        
        
    }
    
}
