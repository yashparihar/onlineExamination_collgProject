<%--
    Document   : Login
    Created on : 28 Mar, 2017, 7:59:02 PM
    Author     : Yash
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

 <%@page import="proj.operation.*"%>  
 
<%--@page import="dborm.dbOperation"--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title></title>
 <link rel="stylesheet" type="text/css" href="css/style.css"></link>
 <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
 </head>
 <body>
  
     <div class="newStudent">
         
         <h2> New Student? <a href="studentRegistration.jsp">Sign Up</a> Here </h2>
         
     </div>
     
  <div class="container">
  <img src="images/User-Accounts.png">
   <form action="logincheck.jsp" method="post">
      
    <b > <% //if (request.getRequestURI().toString().equals("/projectWeb/logincheck.jsp") ){ 
             out.println(request.getRequestURI()); %>  
                <div> Wrong Username of Password </div>
            <% // } %>
            </b>    
            
  <div class="form-input">
  <input type="text" name="userid" placeholder="Enter UserName">
  </div>
  <div class="form-input">
  <input type="password" name="password" placeholder="Enter PassWord">
  
  </div>
   <div>
          <label id="lblSelect">
            <select class="login-as" name="loginas" title="Select points of interest nearby">
                <option value="student">Student</option>
                <option value="department">Department</option>
                <option value="examiner">examiner</option>
            </select>
        </label>
   </div>
      
  <input type="submit" name="submit" value="login" class="btn-login"><br/>
  <a href="#">Forgot Password?</a>
  </form>
  </div>
  </body>
  </html>
