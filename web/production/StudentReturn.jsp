<%-- 
    Document   : StudentReturn
    Created on : 17 Apr, 2017, 5:34:08 PM
    Author     : Yash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<%
  
String decision = request.getParameter("decision");

if (decision.equals("returnback")){
   // out.println("return test") ;
    %>
    
            	 <div id="myModale" class="modal">

				  <!-- Modal content -->
				  <div class="modal-content">
					<div class="modal-header">
					  <span  class="close"></span>
					  <h2>Are You Sure You Want To Leave The Test</h2>
					</div>
					<div class="modal-body">
					  <form class="formp" action="studentexamcatalog.jsp" method="post">
					    <button type="submit" class="action-button shadow animate blue">YES</button>
					  </form>
                                          
                                        <form class="formp" action="studentExamAppearing.jsp" method="post">
					   <button type="submit" class="action-button shadow animate blue">NO</button>
			              
                                          </form>
					</div>
				
				 </div>

				</div>
    
    
    <%
}
else if (decision.equals("submittest")) {
 // out.println("submit test");
  %>    

      
		 <div id="myModal" class="modal">

				  <!-- Modal content -->
				  <div class="modal-content">
					<div class="modal-header">
					  <span  class="close"></span>
					  <h2>Are you Sure You Want to Submit ?</h2>
					</div>
			<div class="modal-body">
                                            
					  <form class="formp" action="studentExamSubmit.jsp" method="post">
					    <button type="submit" class="action-button shadow animate blue">YES</button>
					   </form>
                                          
                                        <form class="formp" action="studentExamAppearing.jsp" method="post">
					   <button type="submit" class="action-button shadow animate blue">NO</button>
			              
                                          </form>
			</div>
				 
				 </div>

				</div>
  
  <%
 }

%>

</body>
</html>
