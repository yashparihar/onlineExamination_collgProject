<%-- 
    Document   : studentRegistrationVAL
    Created on : 2 Apr, 2017, 12:26:55 PM
    Author     : Yash
--%>

<%@page import="proj.operation.dbOperation"%>
<%@page import="models.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
          student stud=new student();
         String pass1 = request.getParameter("password");
       String pass2 = request.getParameter("repassword");
  try{
   if (!pass1.equals(pass2)) {      
        response.sendRedirect("Login2.jsp?status=passnotmatch#signup");
        return;
   } 
   
    stud.setLoginid(request.getParameter("username")); 
     
    stud.setGender(request.getParameter("gender"));
    stud.setDeptid(request.getParameter("deptid"));
  stud.setStudentaddress(request.getParameter("address"));
   
    stud.setStudentemailid(request.getParameter("emailid"));
    stud.setStudentmobileno(request.getParameter("mobno"));
     stud.setStudentrollno(request.getParameter("rollno"));
     stud.setStudentname(request.getParameter("name"));
     
  
      stud.setStudentdob(request.getParameter("dob"));   
                
     dbOperation dbobj = new dbOperation() ;
 dbOperation dbobj2 = new dbOperation() ;
  
 dbobj.updateQuery("insert into login values('"+stud.getLoginid()+"' ,'"+pass1+"' , 'student')");

    dbobj2.updateQuery("insert into student values('"+stud.getStudentrollno()+"' ,'"+stud.getStudentname()+"' ,'"+stud.getDeptid()+"' ,'"+stud.getLoginid()+"' , '"+stud.getStudentemailid()+"', 0 ,'"+stud.getStudentdob()+"', '' ,'"+stud.getStudentaddress()+"' ,'"+stud.getStudentmobileno()+"' , '"+stud.getGender()+"' )  ") ;
  }
  catch(Exception ex){
       response.sendRedirect("Login2.jsp?status=error#signup");
  }
     response.sendRedirect("Login2.jsp?status=regdone");
 
    %>