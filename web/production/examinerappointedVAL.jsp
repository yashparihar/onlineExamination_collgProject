<%-- 
    Document   : examinerappointedVAL
    Created on : 3 Apr, 2017, 2:02:08 AM
    Author     : Yash
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="proj.operation.dbOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String examid= request.getParameter("examid");
String examinerid = request.getParameter("examinerid");

//out.println("examid="+examid+" examiner="+examinerid);


dbOperation dbobj=new dbOperation();

 // ResultSet examrequestRS=dbobj.fetchRecord("select * from exam where IsItApproved=0");
 String approvedExam ="update exam set IsItApproved=1 where examid='"+examid+"'"; 
 dbobj.updateQuery(approvedExam);
 
 
String examinerappointed ="insert into examinerappointed values ('"+examid+examinerid+"'  , '"+examinerid+"' , '"+examid+"' , null ) " ;
  dbobj.updateQuery(examinerappointed);

 
response.sendRedirect("adminExamCatalog.jsp");

%>