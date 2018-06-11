<%-- 
    Document   : studentExamAppearingNAV
    Created on : 17 Apr, 2017, 4:00:30 AM
    Author     : Yash
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.student"%>
<%@page import="proj.operation.dbOperation"%>
<%@page import="proj.operation.examState"%>
<%@page import="proj.operation.timerState"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! student studuser=new student();   //FOR STUDENT
 
  String who="";

  String getCurTime(){
     java.util.Date date = new java.util.Date();
       SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
      return sdf.format(date);

  }

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


dbOperation dbobj=new dbOperation();

   //String qno=request.getParameter("questionno");
    String sub=request.getParameter("submit"); //nav , prev ,next
    String op=request.getParameter("option");
    
    timerState timer= (timerState)application.getAttribute("timerState");
    examState examS= (examState)application.getAttribute("examState") ;

      String tabname='s'+examS.getExamId()+studuser.getStudentrollno();
    String qry="";
     //update 'examRollno' set markedOption='selectedoptionid' where questionid='List[questionno]'
     if (op!=null)
        qry="update "+tabname+" set markedOptionId='"+op+"' where questionId='"+examS.getQuestionId()+"'";
     else
        qry="update "+tabname+" set markedOptionId=null where questionId='"+examS.getQuestionId()+"'";
    
   out.println("submit: "+sub);
   
   String topage="";
  /* if (op==null)
       out.println("options is NULL");
   else
       out.println("options: "+op);
*/	
  
  
 dbobj.updateQuery(qry) ;
  
    if (sub.equals("next")){
        int qno=examS.getQuestionNo();
        
        if (qno+1 != examS.getQuestionIdList().size()){
            qno=qno+1;
           examS.setQuestionNo(qno) ;
           
          //     dbobj.updateQuery(qry) ;
        }
        topage="studentExamAppearing.jsp";
        
    }
    else if (sub.equals("prev")){
        int qno=examS.getQuestionNo();
        
         if (qno > 0){
              qno=qno-1;
           examS.setQuestionNo(qno) ;
           
          
        //       dbobj.updateQuery(qry) ;
        }
       topage="studentExamAppearing.jsp";
          
    }
    else if (sub.equals("returnback") ){
        
        //  response.sendRedirect("studentReturnTest.jsp") ;
        out.println("returnback");
         topage="StudentReturn.jsp?decision="+sub+"";
        
    }
    else if ( sub.equals("submittest")){
        //   response.sendRedirect("studentSubmitTest.jsp") ;
         out.println("submit test");
           topage="StudentReturn.jsp?decision="+sub+"";
        
    }
  
    else { //QUESTION NAVIGATION BTN WAS CLICKED
        
         examS.setQuestionNo(Integer.parseInt(sub)) ;
 
          //     dbobj.updateQuery(qry) ;
           topage="studentExamAppearing.jsp";
        
    }
    
    
  
     application.setAttribute("examState", examS);
      application.setAttribute("timerState", timer);
       
   response.sendRedirect(topage) ;


%>
