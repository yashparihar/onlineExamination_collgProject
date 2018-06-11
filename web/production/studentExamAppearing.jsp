<%-- 
    Document   : studentExamAppearing
    Created on : 16 Apr, 2017, 1:34:09 PM
    Author     : Yash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="proj.operation.examState"%>
<%@page import="proj.operation.timerState"%>
<%@page import="proj.operation.dbOperation"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="models.student"%>
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
timerState timer= (timerState)application.getAttribute("timerState");
examState examS= (examState)application.getAttribute("examState") ;

/*
   application.setAttribute("examState", examS);
      application.setAttribute("timerState", timer);
      
      
   
*/  
 String tabname='s'+examS.getExamId()+studuser.getStudentrollno();
   
    out.println(examS.getQuestionId()+" e date:"+timer.getExamdate());
    String qry5="select q.question, op.optionId, op.option,tn.markedOptionId from questions q inner join options op on q.questionId=op.questionId inner join "+tabname+" tn on q.questionId=tn.questionId where q.questionBank_ID=(select questionBank_ID from examinerappointed where examid='"+examS.getExamId()+"') and q.questionid='"+examS.getQuestionId()+"'";
    ResultSet qRs=dbobj.fetchRecord(qry5) ;

%>  

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Examination </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
	
    

    
	<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
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
    width: 25%;
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
.modal-butt {margin: 5% 10%;}
.modal-footer {
    padding: 2px 16px;
    background-color: #2A3F54;
    color: white;
}
</style>
<script type="text/javascript">
 window.onload = function(){
 
 

 var starttime = document.getElementById("estarttime").value;
 var endtime = document.getElementById("eendtime").value;
 var duration = document.getElementById("eduration").value;
 var edate = document.getElementById("vdate").value;
 
 //var dd=""
 var cur = new Date().getTime();
 
 var st = new Date(edate+" "+starttime).getTime();
 
  var et =  new Date(edate+" "+endtime).getTime();
  
   var lefttime = et ;

    //var countDownDate = lefttime ; 



 
 // document.getElementById("demo").innerHTML = "dfdf";

var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now an the count down date
    var distance = lefttime - now;
	
 //   document.getElementById("demo2").innerHTML =  distance;
    // Time calculations for days, hours, minutes and seconds
    //var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	
	
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
  document.getElementById("demo").innerHTML = "Time Left "+ hours + " : "
    + minutes + " : " + seconds  ;
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "times up:"+lefttime;
    }
        
}, 1000);

 };
	</script>
	
  </head>

  <body class="nav-md">
    <div class="container body">
       
        <form action="studentExamAppearingNAV.jsp" method="post" name="question_nav" onsubmit="validatingBtn()">
          <input type="hidden" id="estarttime" value="<%=timer.getExamStartTime()%>"/>
          
          <input type="hidden" id="eendtime" value="<%=timer.getExamEndTime()%>"/>
         
          <input type="hidden" id="eduration" value="<%=timer.getDuration()%>"/>
          
          <input type="hidden" id="vdate" value="<%=timer.getExamdate()%>"/>
          
          
           
            
           <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a class="site_title"><i class="fa fa-paw"></i> <span>online exam</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="" alt="" class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span></span>
                <h2>student</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
               
                <ul class="nav side-menu">
      		  
				
		         <li>
                              <button class="btn btn-app" id="myBtne" type="submit" value="returnback" name="submit"><i class="fa fa-home"></i> Return Back 
                              </button>
                         
                  </li>
            
                	  <div class="clearfix"></div>
		         <li>  <button class="btn btn-app" id="myBtn" type="submit" value="submittest" name="submit"><i class="fa fa-flag"></i> Submit Test</button>                    
                  </li>
		  </ul>
		 </div>
                
                
	<!--	   <form action="studentExamAppearingNAV.jsp" method="post" name="question_nav">
    -->
		 <div class="menu_section">
               <h3>questions</h3>
                <ul class="nav side-menu">
		     <li>
		<div class="col-md-8 col-sm-8 col-xs-12">
		     <div class="btn-toolbar">
                                      
                        <div class="btn-group">
                            
                      <!--      <form name="question_nav">  -->
                            <%
                                int totq=examS.getQuestionIdList().size();
                                for(int i=0;i<totq;i++)
                                {
                                    if (i==examS.getQuestionNo()){
                                 %>
                                      <button class="btn btn-info active" type="button" disabled><%=(i+1)%></button>
                                 <%
                                 } else {                              
                                %>   
                              <!--    <input type="text" name="optionselected" value="" />  -->
                                  <button type="submit" name="submit" value="<%=i%>" class="btn btn-info" type="button"><%=(i+1)%></button>
                          <%
                                 }
                              }
                           %>
                         <!--   </form>   -->
                        </div>
		  </div>
				  
		</div>
				  
				  </li>
		  
		  </ul>
				  
				  
				 
            
              </div>
             

            </div>
                         
            <!-- /sidebar menu -->
        <!-- /menu footer buttons -->

            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>

               </nav>
          </div>
        </div>
        <!-- /top navigation -->

		
		<!--- POP UP -->
		
		 <div id="myModal" class="modal">

				  <!-- Modal content -->
				  <div class="modal-content">
					<div class="modal-header">
					  <span  class="close">&times;</span>
					  <h2>Are you Sure You Want to Submit ?</h2>
					</div>
					<div class="modal-body">
					  <form>
					  
					  <button class="modal-butt"> Yes </button>
					  <button class="modal-butt"> No </button>
					</div>
				   <!-- <div class="modal-footer">
					  <h3>Modal Footer</h3>
					</div>
				 -->
				 </div>

				</div>
				
				
				
				
				
				 <div id="myModale" class="modal">

				  <!-- Modal content -->
				  <div class="modal-content">
					<div class="modal-header">
					  <span  class="close">&times;</span>
					  <h2>Are You Sure You Want To Leave The Test</h2>
					</div>
					<div class="modal-body">
					  <form>
					  
					  <button class="modal-butt"> Yes </button>
					  <button class="modal-butt"> No </button>
					</div>
				   <!-- <div class="modal-footer">
					  <h3>Modal Footer</h3>
					</div>
				 -->
				 </div>

				</div>
						
		
		<!----/ POP UP ------->
		
		
        <!-- page content ---------------------------------------------->
        <div class="right_col" role="main">
          <div class="">
		   
            <div class="page-title">
              <div class="title_left">
                <h3>Examination </h3>
              </div>
	  
                
              <!-----TIMER SPOT ------------------->  
              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 ">              
                  <!--  <p id="demo" style="color:#2A3F54; font-size: 20px;"></p>  -->            
                </div>
              </div>
               <!---------/timer spot------------>
              
            </div>
          
           
            <div class="clearfix"></div>

            <div class="row">
			
			 <div class="col-md-12">			  
                <div class="x_panel">
              
			  
    			  <div class="x_title">
                    <h2><%=examS.getExamName()%> exam <small> appearing </small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                     
                    </ul>
                    <div class="clearfix"></div>
                  </div>
				  
				  <!----QUESTION ------>
	           <div class="col-md-12">
		
                         <div class="x_panel">
                                       <%
                  int quescnt=1 ;
                while (qRs.next()){   
                     out.println("<h2><strong>"+(examS.getQuestionNo()+1)+" Question: "+qRs.getString("question")+"</strong></h2> ") ;
                        
                           quescnt++;
                        %>
					
                         </div>
		   </div>	
				 
				 <!---- OPTIONS ------>
	     <div class="col-md-12">
				 
                  <%
                                      int cnt=1;
                                      //{
                                          do {
                                          %>
                                         
                             <div class="col-md-10">
			                <div class="x_panel">
                                           <%
                                              if (qRs.getString("optionId").equals(qRs.getString("markedOptionId"))){
                                               %>
                                               <h4><input type="radio" name="option" id="op" checked="true" value="<%=qRs.getString("optionid") %>" onclick="optionselect()"><%=qRs.getString("option") %> </input> </h4>
                                          
                                               <%} else {%>  
                                            <h4><input type="radio" name="option" id="op" value="<%=qRs.getString("optionid")%>" onclick="optionselect()"><%=qRs.getString("option") %> </input> </h4>
                                              <% } %>
			        	 </div>
                             </div>
                                          
                                    
                                         
                                         
                                          <%
                                          
                                            if (cnt<4){
                                                qRs.next();
                                            }else{
                                                break ;
                                            }
                                              cnt=cnt+1;
                                            
                                         } while( true);
                                      
                                      
                                      %>
          <!--    <button type="submit" name="unselect"  class="btn btn-primary" onclick="unchecke()">Deselect All options</button>
		-->	
             <a id="myLink" title="uncheck"
                      href="studentExamAppearing.jsp" onclick="unchecke();return false;">DESELECT ALL</a>	
					
				<!------ Submit ---------->	
			   <div class="col-md-3 right-col">
			           <div class="x_panel">
                              <!--       <form action=""> -->
                                                
					         <button type="submit" id="prev" name="submit" value="prev" class="btn btn-primary">Prev</button>
			
					        <button type="submit" id="next" name="submit" value="next" class="btn btn-primary">Next</button>
                            <!--           </form>   -->
				 </div>
                          </div>
				
				
					
	    </div>
                   <%
                    }
                         %>
                                      
				 <!----/OPTIONS-------->
				
			
             
			  
			   </div>
			  </div>
	
			  
			  
			
			  
			  
	  
			  
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
           
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    
        </form>
      </div>

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
		<script type="text/javascript">



 document.getElementById("demo").innerHTML="helloc";
function validatingBtn(){
 /*   var sub = document.getElementById('submit').value;
    document.getElementById("demo2").innerHTML = sub;
   */ 

    return false;
}
    

// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//var span = document.getElementsById("close-a")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";

}


// Get the modal
var modale = document.getElementById('myModale');

// Get the button that opens the modal
var btne = document.getElementById("myBtne");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[1];


btne.onclick = function() {
    modale.style.display = "block";
}


span.onclick = function() {
    modale.style.display = "none";

}


/*
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
	
	else if (event.target == modale) {
        modale.style.display = "none";
    }
	
}

*/		  

// document.getElementById("demo2").innerHTML = countDownDate;

// Update the count down every 1 second

function unchecke(){
    document.getElementById("op").checked = false; 
}

function optionselect(){
    
  boolean opa = document.getElementById("op1").checked ;
     boolean opb = document.getElementById("op2").checked ;
    boolean opc = document.getElementById("op3").checked ;
    boolean opd = document.getElementById("op4").checked ;
    
     document.forms["question_nav"]["optionselected"].value=document.getElementById("op").value;        
}





</script>
		


  </body>
</html>
