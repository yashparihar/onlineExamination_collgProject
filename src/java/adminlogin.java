
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import proj.operation.dbOperation;


public class adminlogin extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
       HttpSession session=request.getSession();
       
          String id = request.getParameter("adminid");
    String pass= request.getParameter("password");
    
        dbOperation obj = new dbOperation();

          ResultSet rs = obj.fetchRecord("select * from admin where AdminId='"+id+"' and AdminPassword='"+pass+"'");
                
          
                 if (rs.next()){
                     
                     session.setAttribute("userIdentification","admin");
                     session.setAttribute("adminId", rs.getString("AdminId"));
                    
                      response.sendRedirect("production/adminhome.jsp");
                 }
                 else{
                  //   out.println("WRONG USERID OR PASSWORD"); 
                  //   out.println("- "+request.getRequestURI());
                     RequestDispatcher rd= request.getRequestDispatcher("production/adminlogin.jsp");
                    rd.forward(request, response);
                  
                 }
    

        
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
