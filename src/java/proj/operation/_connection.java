package proj.operation;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Yash
 */
public class _connection {
    
   // Connection con;
     public Connection con;
    public Statement stat;
    public ResultSet rs;
    
    public _connection() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        String dburl="jdbc:mysql://127.0.0.1:3306/onlineexaminationsystem?useSSL=false";
        String user="root";
        String pass=""; 
         con = DriverManager.getConnection(dburl,user,pass);
    }
    
  
   public int fireUPDATEQuery(String qry) throws SQLException {
        stat = con.createStatement();
        return stat.executeUpdate(qry);
    }
   
   public ResultSet fireSELECTQuery(String qry) throws SQLException {
        stat = con.createStatement();
        rs =stat.executeQuery(qry);
        return rs;
    }

    void close() throws SQLException {
        con.close();
    }
    
}
