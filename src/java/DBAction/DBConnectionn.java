/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBAction;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author DHARANI
 */
public class DBConnectionn {
 public static Connection con=null;
        public static  Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/event","root","root");
            if(con!=null){
                return con;
            }
            else{
             return con;
            }}
        catch(Exception e){
           e.printStackTrace();
        }
    return con;}
}
    

