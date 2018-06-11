<%-- 
    Document   : Login2
    Created on : 31 Mar, 2017, 2:20:17 AM
    Author     : Yash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="proj.operation.dbOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 dbOperation obj = new dbOperation() ;
                              String loginactionn= "logincheck.jsp"; 
                              String signactionn= "studentRegistrationVAL.jsp";
 
                              String statu="";
                 statu+=request.getParameter("status");
              //    out.println(statu);
               
%> 


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Login / SignUp  </title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="../vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
          <form action="<%=loginactionn%>" method="post">
              <h1>Login Form</h1>
              <%
                 
          //      
                 if (statu.equals("wrong_choice"))
                  {         
                   %>
                                  <h4 style="color:red"> Wrong UserName or Password </h4>
                   <%
                   }
                   %>			  
              <div>
                <input type="text" class="form-control" placeholder="Username" name="userid" required="required" />
              </div>
            
              <div >
                     <input id="password" placeholder="Password" class="form-control" type="password" name="password" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
             </div>
                      
		
               <div>
			 
			  <select class="form-control" name="loginas" placeholder="Department">
			   <option value="student">Student</option>
			   <option  value="department">Department</option>
                            <option  value="examiner">Examiner</option>
			 </select>
	         </div> 
			  <br/>
              
              
              
              <div>
              
				
	   <input type="submit" name="submit" value="Log in" class="btn btn-default submit" />
				
                <a class="reset_pass" href="#">Lost your password?</a>
              </div>
			  
			  
			  

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New Student?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Online Exam</h1>
                  <p>©2017 All Rights Reserved.  Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>

		
		
		
		
		
        <div id="register" class="animate form registration_form">
          <section class="login_content">
              
     
              
            <form action="<%=signactionn%>" method="post">
              <h1>Create Account</h1>
              <div>
                <input type="text" class="form-control" placeholder="Rollno" name="rollno" required="" />
              </div>
		
		     <div>
                <input type="text" class="form-control" placeholder="Student Name" name="name" required="" />
              </div>
			 
			  <div >

                      
                       <H5> Male:
                        <input  type="radio" class="flat" name="gender" id="genderM" value="Male" checked="" required />
			Female:
                        <input  type="radio" class="flat" name="gender" id="genderF" value="Female" />
                     </H5>
                        </div>
             

			   	<P align-text="left"> DOB </P>
			   <div >
                        <input class="form-control" data-format="yyyy-mm-dd" type="date" name="dob" placeholder="DOB"/>
			  </div> 
			 <br/>
			 
            <div>
			<%  
                        ResultSet rs = obj.fetchRecord("select * from department");
                                  
                      %> 
			  <select class="form-control" name="deptid" placeholder="Department">
			   <option> choose department</option>
                           <%
                            while (rs.next()){
                               out.println("<option value='"+rs.getString("DeptId")+"'>"+rs.getString("DeptName")+"</option>"); 
                            }
 %>
			 </select>
			</div> 
			  <br/>
			  
              <div>
                <input type="email" class="form-control" placeholder="Email" name="emailid" required="" />
              </div>
			  
			  <div>
                <textarea class="form-control" placeholder="Address" name="address" required="" > address </textarea>
              </div>
			  
			  <br/>
			  <div>
               
                <input type="number" id="number" value="" name="mobno" placeholder="Mob No" required="required" data-validate-minmax="9,15" class="form-control">
			   </div>
			   <br/>
			   
			
                   <div>
                <input type="text" class="form-control" placeholder="User Id" name="username" required="" />
              </div>           
                           
			  
              <div>
                <input type="password" name="password" class="form-control" placeholder="Password" required="" />
              </div>
			  
			  <div>
                <input type="password" name="repassword" class="form-control" placeholder="ReEnter Password" required="" />
              </div>
		
                        
                                <%
                 
                
                 if (statu.equals("passnotmatch"))
                  {         
                   %>
                                  <h5 style="color:red"> Passwords not matching </h5>
                   <%
                   }
                   %>  
                           
                           
                           
              <div>
               
	     <input class="btn btn-default submit" type="submit" value="Register" />
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">Already a Student member ?
                  <a href="#signin" class="to_register"> Log in </a>
				
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Online Exam</h1>
                  <p>©2017 All Rights Reserved. Privacy and Terms</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
	
	
	    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- validator -->
    <script src="../vendors/validator/validator.js"></script>
	
	
  </body>
</html>

