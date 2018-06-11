package proj.operation;


//import proj.operation._connection;
import java.sql.ResultSet;
import java.sql.SQLException;


public class dbOperation {
 
    _connection conn;
    String operationOnTable;
    
    public dbOperation() throws SQLException, ClassNotFoundException  { 
             conn = new _connection();
    }
    public dbOperation(String table) throws SQLException, ClassNotFoundException{
         conn = new _connection();
        operationOnTable = table;
    }
    
    public void setOperationOnTable(String table){
        operationOnTable = table;
    }
    
    
  //------------MANIPULATION--------(INSERT,UPDATE,DELETE)---------------------------  
    
    public int updateQuery(String id , String whatKey , String value) throws SQLException{
        String qry ="update "+operationOnTable+" set "+whatKey+"=' "+value+" ' where adminId='"+id+"' ";
        int result = conn.fireUPDATEQuery(qry);
        return result;  
    }
     public int updateQuery(String qry) throws SQLException{
    
        int result = conn.fireUPDATEQuery(qry);
        return result;  
    }
    
     
     
     
    //-------------FETCH---------(SELECT)--------------------------------------------------------------------
    public ResultSet fetchRecord() throws SQLException{
      String str = "select * from "+operationOnTable;
        return conn.fireSELECTQuery(str);
    }
    
    
    public ResultSet fetchRecord(String field ,String value) throws SQLException{
    String str = "select * from "+operationOnTable+" where "+field+"='"+value+"'";
        return conn.fireSELECTQuery(str);
    }
     
    public ResultSet fetchRecord(String qry) throws SQLException{
          return conn.fireSELECTQuery(qry);
    }
     
    //onlineexaminationsystem

    public void close()  throws SQLException {
        conn.close();
    }
    
   
}

