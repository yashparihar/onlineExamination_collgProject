<%-- 
    Document   : departmentCreateExaminerVAL
    Created on : 3 Apr, 2017, 12:17:19 AM
    Author     : Yash
--%>

<%@page import="proj.operation.dbOperation"%>
<%@page import="models.department"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! 
   department deptuser=new department();
   
  String who="";
%>

<% 
  who = (String)session.getAttribute("userIdentification");
  
  if (who.equals("") ){
      response.sendRedirect("Login2.jsp");
  }
  else{
      deptuser =(department)session.getAttribute("userDetails");
  }
 
    
    
  //String eid=request.getParameter("id");  
  String ename=request.getParameter("name");
  String emailid=request.getParameter("email") ;
  String euserid=request.getParameter("userid");
  String epassword=request.getParameter("password");
String eid = deptuser.getDeptid().substring(1, 3)+ename.substring(1, 3)+euserid.substring(1, 2) ;

    dbOperation dbobj = new dbOperation() ;

 dbobj.updateQuery("insert into login values('"+euserid+"' , '"+epassword+"' , 'examiner') ") ;
 
dbobj.updateQuery("insert into examiner values('"+eid+"' , '"+ename+"' , '"+euserid+"' , '"+emailid+"' ,'"+deptuser.getDeptid()+"' ) ");

  
response.sendRedirect("departmentHome.jsp");

%>