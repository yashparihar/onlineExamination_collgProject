
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.student;
import proj.operation.dbOperation;


public class createStudent extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException , Exception {
          PrintWriter out=response.getWriter();
       HttpSession session = request.getSession();
       student stud=new student();
         String pass1 = request.getParameter("password");
       String pass2 = request.getParameter("repassword");
       
   if (pass1!=pass2) {      
        response.sendRedirect("production/Login2.jsp?status='wrongPassword'");
   } 
   
    stud.setLoginid(request.getParameter("username")); 
     
    stud.setGender(request.getParameter("gender"));
    stud.setDeptid(request.getParameter("deptid"));
   // stud.setLoginid(request.getParameter(""));
  stud.setStudentaddress(request.getParameter("address"));
   
    stud.setStudentemailid(request.getParameter("eid"));
    stud.setStudentmobileno(request.getParameter("mobno"));
     stud.setStudentrollno(request.getParameter("rollno"));
     stud.setStudentname(request.getParameter("name"));
     
  
      stud.setStudentdob(request.getParameter("dob"));   
    
     //logobj._IdentifyLogin = "student";
                
     dbOperation dbobj = new dbOperation() ;

  
 dbobj.updateQuery("insert into login values('"+stud.getLoginid()+"' ,'"+pass1+"' , 'student')");

    dbobj.updateQuery("insert into student values('"+stud.getStudentrollno()+"' ,'"+stud.getStudentname()+"' ,'"+stud.getDeptid()+"' ,'"+stud.getLoginid()+"' , '', 0 ,'"+stud.getStudentdob()+"', '' ,'"+stud.getStudentaddress()+"' ,'"+stud.getStudentmobileno()+"' , '"+stud.getGender()+"' )  ") ;

     //out.println("here: "+dob);
    
   // dbobj.close();
 //  response.sendRedirect("production/Login2.jsp");
   response.sendRedirect("production/Login2.jsp?status='done'");
  
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(createStudent.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
