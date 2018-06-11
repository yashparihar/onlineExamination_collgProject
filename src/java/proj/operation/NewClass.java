package proj.operation;

import java.sql.ResultSet;
import java.sql.SQLException;


public class NewClass {
    
  public static void main(String args[]) throws SQLException, ClassNotFoundException{
          dbOperation obj = new dbOperation();
  
        ResultSet rs = obj.fetchRecord("select * from department d inner join login l inner join institute i on d.LoginId=l.LoginId and d.InstituteId=i.InstituteId;");
     
     //   obj.setOperationOnTable("adminmaster");
   
        while(rs.next()){
            System.out.println("id : "+rs.getString("loginid")+" password: "+rs.getString("instituteid") );//+" EMAIL: "+rs.getString("ADMINEMAILID"));    
        }
  }
    
}
