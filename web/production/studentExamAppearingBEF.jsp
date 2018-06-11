<%-- 
    Document   : studentExamAppearingBEF
    Created on : 16 Apr, 2017, 5:46:41 PM
    Author     : Yash
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.sql.ResultSet"%>
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

 // out.println("it is "+who); 
  out.println("name: "+studuser.getStudentrollno()+" and "+studuser.getStudentname() );
 
dbOperation dbobj=new dbOperation();



//OBJECT OF EXAMSTATE AND TIMERSTATE
timerState timer= new timerState();
examState examS=new examState();

  // application.setAttribute("TimerState",);
 // application.setAttribute("ExamState", ));

 //GETTING STATUS OF SUBMISSION WHETHER EXAM IS STATED FRESH OR CONTINUED
  String wher=(String)request.getParameter("status");
  String examid=(String)request.getParameter("examid");
  String examdate=(String)request.getParameter("examdate");
  
  // examdate = examdate.substring(6, 9)+"-"+examdate.substring(3,4)+"-"+examdate.substring(0, 1);
  
  //SETTING IN EXAMSTATE -> EXAMID , examname
   
    
        String enrollid = studuser.getStudentrollno() + examid  ;
 
                examS.setExamId(examid); //STORING IN CONTEXT...    
               examS.setExamName(request.getParameter("examname"));
               examS.setStudEnrollId(enrollid); //STORING IN CONTEXT...    
      
               examS.setQuestionNo(0);  //STORING IN CONTEXT...    
             
  
    
    
    
  if (wher.equals("continue")){
      out.println("continue exam");
      
      
      
      
      //FETCHING QUESTIONS FROM STUDENTSTATETABLE
      
       String tabname='s'+examid+studuser.getStudentrollno();
     
      String qry3="select * from "+tabname; 
      
      ResultSet qbRS= dbobj.fetchRecord(qry3) ;
      
        
      while(qbRS.next()){
          String qbid=qbRS.getString("questionid");
          examS.addQuestion(qbid); //STORING IN CONTEXT...    
      }
     //..............................................
     
     
     //FETCHING EXAMSCHEDULE OF EXAM AND STUDENTTARTINGTIME..........................
      
           String qry4="select e.Duration,es.StartTime,es.EndTime from exam e inner join examschedule es on e.ScheduleId=es.ScheduleId where e.examid='"+examid+"'"; 
      
           String qry5="select studentstarttime from studentexamappearance where StudentEnrollId='"+enrollid+"'";
    
              ResultSet scheduleRS=dbobj.fetchRecord(qry4);
      
      if (scheduleRS.next()){
          timer.setDuration(Integer.parseInt( scheduleRS.getString("Duration") ) );
          timer.setExamStartTime( scheduleRS.getString("StartTime"));
          timer.setExamEndTime( scheduleRS.getString("EndTime"));
     //     timer.setStudentStartTime(getCurTime());   //DO THESE AT LAST
      }
      
      ResultSet starttimeRS=dbobj.fetchRecord(qry5);
      
      
      if (starttimeRS.next()){
          timer.setExamStartTime( starttimeRS.getString("studentstarttime") );
      }
      
      //........................................................
      
      
      
    
  }
  else //IF FRESH START OF EXAM-----------------------------------------------------
  {
    
    //  out.println("starting: "+examS.getStudEnrollId());
      
      
      
        String qry1 = "insert into studentexamappearance values('"+enrollid+"' , curtime() , null , 0 , curtime() )"; 
 
        dbobj.updateQuery(qry1);
      
      

   
      String tabname='s'+examid+studuser.getStudentrollno();
    
      out.println("tabname: "+tabname) ;
      
      String qry2_1="create table "+tabname+" ( StudentEnrollId varchar(20), questionId varchar(20) ,markedOptionId varchar(20) )";

      dbobj.updateQuery(qry2_1) ;

       String qry2_2="alter table "+tabname+" add constraint "+tabname+"_fk0 foreign key(questionId) references questions(questionid)";  

      dbobj.updateQuery(qry2_2) ;
      
       String qry2_3="alter table "+tabname+" add constraint "+tabname+"_fk1 foreign key(markedOptionId) references options(optionId)";

      dbobj.updateQuery(qry2_3) ;
      
        String qry2_4="alter table "+tabname+" add constraint "+tabname+"_fk2 foreign key(StudentEnrollId) references studentexamenrollment(StudentEnrollId)";  

        dbobj.updateQuery(qry2_4) ;
      
   
      
        
        
      String qry3="select q.questionid from questions q where questionBank_ID = (  select questionBank_ID from examinerappointed where examid = '"+examid+"') "; 
      
      ResultSet qbRS= dbobj.fetchRecord(qry3) ;
      
      while(qbRS.next()){
          String qbid=qbRS.getString("questionid");
          examS.addQuestion(qbid); //STORING IN CONTEXT...    
      }
      
       Collections.shuffle(examS.getQuestionIdList());
           ArrayList quesId=examS.getQuestionIdList();
      for(int i=0;i<quesId.size();i++){
          String qry3_1 ="insert into "+tabname+" values('"+enrollid+"','"+quesId.get(i)+"',null) ";
          dbobj.updateQuery(qry3_1);
      }

 
   
      //SETTING THE TIMER..................
      
      String qry4="select e.Duration,es.StartTime,es.EndTime from exam e inner join examschedule es on e.ScheduleId=es.ScheduleId where e.examid='"+examid+"'"; 
      
      ResultSet scheduleRS=dbobj.fetchRecord(qry4);
      
      if (scheduleRS.next()){
          timer.setDuration(Integer.parseInt( scheduleRS.getString("Duration") ) );
          timer.setExamStartTime( scheduleRS.getString("StartTime"));
          timer.setExamEndTime( scheduleRS.getString("EndTime"));
          timer.setExamdate(examdate);
          timer.setStudentStartTime(getCurTime());   //DO THESE AT LAST
      }
       
      out.println("<br> Timer: duration:"+timer.getDuration()+" E st:"+timer.getExamStartTime()+" E et:"+timer.getExamEndTime()+" Stud ST:"+timer.getStudentStartTime() );
  

     //SETTING THE 
     






















      %>
      <%--
      
            <div class="col-md-9 col-sm-9 col-xs-12">
                <b><strong><h4>  
                   
                  <% 
                  int quescnt=1 ;
                while (qRs.next()){   
                     out.println("<h4><strong>"+quescnt+" Question: "+qRs.getString("question")+"</strong></h4> ") ;
                        
                           quescnt++;
                        %>
                        
           <div class="clearfix"></div>
                  <div class="panel-body">
                            <table class="table table-striped">
                              <thead>
                                <tr>
                                  <th width="5%">Option id</th>
                                  <th width="45%">Option </th>
                               
                                </tr>
                              </thead>
                              <tbody>
                                  <%
                                      int cnt=1;
                                      //{
                                          do {
                                          %>
                                          <tr>
                                              <td>  <% out.println(qRs.getString("optionid"));  %>
                                              </td>
                                        
                                              <td>  <% out.println(qRs.getString("option"));  %>
                                              </td>
                                         
                                         
                                          </tr>
                                          <%
                                          
                                            if (cnt<4){
                                                qRs.next();
                                            }else{
                                                break ;
                                            }
                                              cnt=cnt+1;
                                            
                                         } while( true);
                                      
                                      
                                      %>
                                      
                              </tbody>
                            </table>
                          </div>
                                      
                                      <%
                                          }
                               %>
                                      
                        </h4></strong></b>
            </div>
           
		
         
      --%>
      
      
      
      <%
      
      
  }


    
      application.setAttribute("examState", examS);
      application.setAttribute("timerState", timer);
      
      
    //  String qry5="select q.question, op.optionId, op.option from questions q inner join options op on q.questionId=op.questionId  where q.questionBank_ID=(select questionBank_ID from examinerappointed where examid='"+examid+"') and q.questionid='"+examS.getQuestionId()+"'";
    //  ResultSet qRs=dbobj.fetchRecord(qry5);
   
      response.sendRedirect("studentExamAppearing.jsp");
      

%>
