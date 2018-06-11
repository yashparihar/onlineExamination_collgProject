<%-- 
    Document   : logincheck
    Created on : 16 Mar, 2017, 5:27:43 PM
    Author     : Yash
--%>

<%@page import="models.examiner"%>
<%@page import="models.department"%>
<%@page import="models.student"%>
<%@page import="proj.operation.dbOperation"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <%
            //PrintWriter out = response.getWriter();
        try{    String id = request.getParameter("userid");
            String pass = request.getParameter("password");
            
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
                 //    RequestDispatcher rd= request.getRequestDispatcher("Login2.jsp?status=wrong_choice");
                 //   rd.forward(request, response);
                   response.sendRedirect("Login2.jsp?status=wrong_choice");
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
                 
                 
                 
                  response.sendRedirect(who+"Home.jsp");
                 
         
        }catch(Exception ex){
            out.println("error:"+ex);
        }
        
      
            
            %>
    
