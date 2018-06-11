/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.department;
import models.examiner;
import models.student;
import proj.operation.dbOperation;


public class logincheck extends HttpServlet {

  
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              try{    String id = request.getParameter("userid");
            String pass = request.getParameter("password");
            HttpSession session=request.getSession();
            
             String who=request.getParameter("loginas") ;
               dbOperation obj = new dbOperation();

               ResultSet rs = obj.fetchRecord("select * from login where LoginId='"+id+"' and LoginPassword='"+pass+"' and IdentifyLogin='"+who+"'");
                
          
                 if (rs.next()){    
                //      who = rs.getString("IdentifyLogin");
                     session.setAttribute("userIdentification",who);              
                 }
                 else{
                  //   out.println("WRONG USERID OR PASSWORD"); 
                  //   out.println("- "+request.getRequestURI());
                     RequestDispatcher rd= request.getRequestDispatcher("production/Login2.jsp");
                    rd.forward(request, response);
                  
                 }
                 
                 
                 //---------------------------------------------------
                 
                  dbOperation obj2 = new dbOperation();
  
           //      ResultSet rs = obj.fetchRecord("select * from admin from admin where adminid='"+id+"' and adminpassword='"+pass+"' ");
             ResultSet rss = obj2.fetchRecord("select * from "+who+" where LoginId='"+id+"'") ;
           
             Object objuser=null;
            
             
                 if (rss.next()){
                     
                  if (who.equals("student")) {
                        student st=new student();
                        st.setStudentrollno(rss.getString("StudentRollno") );
                        st.setDeptid(rss.getString("DeptId"));
                        st.setLoginid( id );
                        st.setStudentname( rss.getString("StudentName"));
                        
                        objuser = st;
                      }
                 else if (who.equals("examiner")){
                       examiner ex=new examiner( );
                       ex.setExaminerid(rss.getString("ExaminerID"));
                       ex.setExaminername(rss.getString("ExaminerName"));
                       ex.setLoginid( id );
                       
                       objuser = ex;
                     }
                  else if (who.equals("department")){
                       department dp=new department();
                       dp.setDeptid( rss.getString("DeptId") );
                       dp.setDeptname( rss.getString("DeptName") );
                       dp.setLoginid(id);
                       
                       objuser = dp;
                    }
                     
                  session.setAttribute("userDetails",objuser);

                 }
                 
                 
                 
                  response.sendRedirect("production/"+who+"Home.jsp");
                 
         
        }catch(Exception ex){
            System.out.println("error:"+ex);
        }
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
