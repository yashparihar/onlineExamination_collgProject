<%-- 
    Document   : createQuestionBankVAL
    Created on : 4 Apr, 2017, 4:31:12 PM
    Author     : Yash
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="proj.operation.dbOperation"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="models.examiner"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! 
   examiner exauser=new examiner() ;
 
  String who="";
%>

<% 
  who = (String)session.getAttribute("userIdentification");

  if (who.equals("") ){
      response.sendRedirect("Login.jsp");
      return;
  }
  else{
      exauser =(examiner)session.getAttribute("userDetails");
  }

  
  

   String qbid=request.getParameter("questionbankid");
   int totQuestion= Integer.parseInt( request.getParameter("totalquestion") );
  // String questionid[]=new String[totQuestion+1];
   
   
   
   
   out.println("qbid: "+qbid+" totq:"+totQuestion);
   
   dbOperation dbobj=new dbOperation();
   
   
   
   for(int i=1;i<=totQuestion;i++){
      String questionid= qbid.substring(1, 3)+exauser.getExaminerid().substring(1, 3) + i ;
       
      String q=request.getParameter(i+"question");
     String opa=request.getParameter(i+"option_a");
     String opb=request.getParameter(i+"option_b") ;
     String opc=request.getParameter(i+"option_c");
     String opd=request.getParameter(i+"option_d");
     String correctop=request.getParameter(i+"correctoption");
     
 //    out.println("<br/>questions: "+q+" qid:"+questionid);
  //   out.println("<br/>ops: "+opa+" "+opb+" "+opc+" "+opd);
 //    out.println("<br/>correct op: "+correctop);
     correctop=questionid+"_"+correctop;
     
     String addquestionqry = "insert into questions values('"+questionid+"','"+qbid+"' ,'"+q+"',null,null )" ;
     dbobj.updateQuery(addquestionqry);
     
     
     dbobj.updateQuery("insert into options values('"+questionid+"_A' , '"+questionid+"' , '"+opa+"' , null )") ;
     
     dbobj.updateQuery("insert into options values('"+questionid+"_B' , '"+questionid+"' , '"+opb+"' , null )") ;
     
     dbobj.updateQuery("insert into options values('"+questionid+"_C' , '"+questionid+"' , '"+opc+"' , null )") ;
     
     dbobj.updateQuery("insert into options values('"+questionid+"_D' , '"+questionid+"' , '"+opd+"' , null )") ;
     
     dbobj.updateQuery(" update questions set correctOptionId='"+correctop+"' where questionid='"+questionid+"'");
    
     
       //  insert into questions values('54321exras','5431' ,'question is what?',null,null);
     
       
       
       
  }
   
response.sendRedirect("questionbankProfile.jsp?qbid="+qbid);

%>