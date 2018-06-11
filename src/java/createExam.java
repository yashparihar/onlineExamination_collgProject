

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.department;
import proj.operation.dbOperation;


public class createExam extends HttpServlet {
  dbOperation obj;
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
      
        obj = new dbOperation();
       HttpSession session=request.getSession();
       department deptuser = (department)session.getAttribute("userDetails"); 
    
    
 // String eid = request.getParameter("eid");
  String ename = request.getParameter("ename");
 
 String deptid = deptuser.getDeptid();
  String examinerid = request.getParameter("examiner");
  int marks = Integer.parseInt( request.getParameter("marks") );
  String date = request.getParameter("edate");
   String schid = request.getParameter("schid");

    String duration = request.getParameter("duration");
  
   String eid = ename.substring(0, 4)+examinerid.substring(0, 3)+date.substring(5, 6)+date.substring(8, 9) ;
         
  obj.updateQuery("insert into exam values('"+eid+"' , '"+ename+"' , '"+deptid+"' , '"+schid+"','"+examinerid+"' , "+marks+", false ,'"+date+"','"+duration+"' )");
  
  /*
  
  ADDING NOTIFICATION IN APPLICATION CONTEXT THAT EXAM WAS CREATED

  
  */
  
  
  response.sendRedirect("production/departmentHome.jsp");
  
     
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      try {
          processRequest(request, response);
      } catch (SQLException ex) {
          Logger.getLogger(createExam.class.getName()).log(Level.SEVERE, null, ex);
      } catch (ClassNotFoundException ex) {
          Logger.getLogger(createExam.class.getName()).log(Level.SEVERE, null, ex);
      }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
