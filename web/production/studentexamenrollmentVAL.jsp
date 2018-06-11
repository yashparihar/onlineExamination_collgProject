<%-- 
    Document   : studentexamenrollmentVAL
    Created on : 9 Apr, 2017, 9:29:39 PM
    Author     : Yash
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="proj.operation.dbOperation"%>
<%@page import="models.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! student studuser=new student();   //FOR STUDENT
 
  String who="";
%>

<% 
  who = (String)session.getAttribute("userIdentification");
  
  if (who.equals("") ){
      response.sendRedirect("Login2.jsp");
      return;
  }
  else{
      studuser =(student)session.getAttribute("userDetails");
  }

  String examid = request.getParameter("examid");

  /*
  StudentEnrollId	varchar(20)
StudentRollno	varchar(20)
ExamId	varchar(20)
ExamEnrolledDate	date
  */
    
out.println("examid: "+examid);
 
LocalDate localDate = LocalDate.now();
String todaydate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate) ;
 
dbOperation dbobj=new dbOperation();
 
String enrollid = studuser.getStudentrollno() + examid  ;
 
String qry = "insert into studentexamenrollment values('"+enrollid+"' , '"+studuser.getStudentrollno()+"' , '"+examid+"' , '"+todaydate+"')" ;   
  
dbobj.updateQuery(qry);
 
response.sendRedirect("studentviewexam.jsp");

%>
