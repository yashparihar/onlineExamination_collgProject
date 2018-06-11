<%-- 
    Document   : studentExamSubmit
    Created on : 2 May, 2017, 5:10:22 PM
    Author     : Yash
--%>


<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.student"%>
<%@page import="proj.operation.dbOperation"%>
<%@page import="proj.operation.examState"%>
<%@page import="proj.operation.timerState"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! student studuser=new student();   //FOR STUDENT
 
  String who="";
  
  float correctAttempt=0;
  float totalQuestions=0;
  float totalMarks=0;
  float eachQuestionMarks=0 ;
  float obtainedMarks=0;
  float percentage=0;
  String per="";
  	
  String getCurTime(){
     java.util.Date date = new java.util.Date();
       SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
      return sdf.format(date);

  }

%>
<!DOCTYPE html>
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

    //  timerState timer= (timerState)application.getAttribute("timerState");
      examState examS= (examState)application.getAttribute("examState") ;
      
      String tabname='s'+examS.getExamId()+studuser.getStudentrollno();
       String enrollid = studuser.getStudentrollno() + examS.getExamId()  ;
     
       String qry="update studentexamappearance set studentfinishTime=curtime() where studentenrollid='"+enrollid+"'"; 
      
       dbobj.updateQuery(qry);
        
       qry="update studentexamappearance set examsubmission=1 where studentenrollid='"+enrollid+"'"; 
      
       dbobj.updateQuery(qry);
      
       
       
        qry=" select count(*) c from "+tabname+" z inner join questions q on z.questionid=q.questionid where z.markedoptionid=q.correctoptionid"; 
      
       ResultSet rs = dbobj.fetchRecord(qry);
       if (rs.next()){
          correctAttempt=Float.parseFloat(rs.getString("c"));       
      }
       
       
         qry="select TotalQuestions, TotalMarks ,EachQuestionMarks from examinerappointed ep inner join studentexamenrollment se on ep.Examid=se.ExamId inner join questionbank qb on ep.questionBank_ID=qb.questionBank_ID where se.StudentEnrollId='"+enrollid+"'"; 
	
        rs = dbobj.fetchRecord(qry);
       if (rs.next()){
          totalQuestions= Float.parseFloat( rs.getString("totalquestions") );
          totalMarks = Float.parseFloat( rs.getString("totalmarks") );
          eachQuestionMarks = Float.parseFloat( rs.getString("EachQuestionMarks") );
      }
       
     
      if (correctAttempt<=0){
         obtainedMarks=0;
        percentage = 0 ;
      }
      else{
        
           obtainedMarks = correctAttempt * eachQuestionMarks; 
              
	percentage = (obtainedMarks * 100) / totalMarks;
       
        String per= Float.toString(percentage) ;
        if (per.length()>4){
         per=per.substring(0,3);
        }

      }
        /*
          -StudentEnrollId	  
	-TotalQuestions
	-TotalCorrectAttempt
	-ObtainedMarks
	-TotalMarks
	-Percentage
        */
        
        
      qry="insert into studentmarksheet values ( '"+enrollid+"' , '"+totalQuestions+"' , '"+correctAttempt+"' , '"+obtainedMarks+"' , '"+totalMarks+"' , '"+per+"' )";
      
       dbobj.updateQuery(qry);
       
         qry="delete from "+tabname;
       dbobj.updateQuery(qry);
       
         qry="drop table "+tabname;
       dbobj.updateQuery(qry);
       
       
      // qry="
      // dbobj.updateQuery(qry);
      
       
       
     /*   
    out.println("totalQuestion:-"+totalQuestions) ;
     out.println("Correct Attempt:"+correctAttempt) ;
     out.println("obtainedMarks:-"+obtainedMarks) ;
     out.println("Total marks:-"+totalMarks) ;
     out.println("Percent:- "+percentage); 
*/
%>

<!DOCTYPE html>
<html lang="en">
  <head>

	<style>
/* The Modal (background) */
.modal {
    display: block; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 15%; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 30%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #2A3F54;
    color: white;
}

.modal-body {padding: 2px 16px;}
.modal-butt {margin: 5% 10%;
   


}
.modal-footer {
    padding: 2px 16px;
    background-color: #2A3F54;
    color: white;
}



.animate
{
     padding: 40px;
	transition: all 0.1s;
	-webkit-transition: all 0.1s;
}

.action-button
{
	position: relative;
	padding: 10px 40px;
  margin: 0px 10px 10px 0px;
  float: left;
	border-radius: 10px;
	font-family: 'Pacifico', cursive;
	font-size: 25px;
	color: #FFF;
	text-decoration: none;	
}

.blue
{
	background-color: #3498DB;
	border-bottom: 5px solid #2980B9;
	text-shadow: 0px -2px #2980B9;
}

.red
{
	background-color: #E74C3C;
	border-bottom: 5px solid #BD3E31;
	text-shadow: 0px -2px #BD3E31;
}

.green
{
	background-color: #82BF56;
	border-bottom: 5px solid #669644;
	text-shadow: 0px -2px #669644;
}

.yellow
{
	background-color: #F2CF66;
	border-bottom: 5px solid #D1B358;
	text-shadow: 0px -2px #D1B358;
}

.action-button:active
{
	transform: translate(0px,5px);
  -webkit-transform: translate(0px,5px);
	border-bottom: 1px solid;
}



</style>

	
  </head>

  <body>

            	 <div id="myModale" class="modal">

				  <!-- Modal content -->
				  <div class="modal-content">
					<div class="modal-header">
					  <span  class="close"></span>
					  <h2>Exam Marksheet</h2>
					</div>
                                      
                                 
                                      
                                      <div class="modal-body">
                                          Total Attempt Questions : <%=correctAttempt%>
                                          Marks Obtained Out of <%=totalMarks%> is <%=obtainedMarks%>
                                          <b>    Percentage : <%=percentage%>     </b>
                                       </div>
                                        
                                      
                                      
					<div class="modal-body">
					  <form class="formp" action="studentexamcatalog.jsp" method="post">
					    <button type="submit" class="action-button shadow animate blue">Back to ExamCatalog</button>
					  </form>
                                          
                                        <form class="formp" action="studentviewexam.jsp" method="post">
					   <button type="submit" class="action-button shadow animate blue">Home</button>
			              
                                          </form>
					</div>
				
				 </div>

				</div>
    
    


</body>
</html>
