<%-- 
    Document   : studentexamcatalog
    Created on : 10 Apr, 2017, 12:17:14 AM
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

 // out.println("it is "+who); 
  out.println("name: "+studuser.getStudentrollno()+" and "+studuser.getStudentname() );
 
dbOperation dbobj=new dbOperation();


  //Current ongoing exam
  String qry1 ="select e.examid , e.ExamName , e.TotalMarks , ex.ExaminerName , d.DeptName , ins.InstituteName , e.examDate , es.StartTime , es.EndTime , e.Duration , (select count(StudentRollno) from studentexamenrollMENT where examid=e.examid) as tot from exam e inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join examschedule es on e.ScheduleId=es.ScheduleId inner join (department d inner join institute ins on d.InstituteId=ins.InstituteId ) on e.DeptId=d.DeptId where e.examdate=CURDATE() and es.StartTime<curtime() and es.EndTime>curtime()  and e.examid in (select examid from studentexamenrollMENT where studentrollno='"+studuser.getStudentrollno()+"') order by e.examDate,es.StartTime" ;  

  //  String qry1 ="select e.examid , e.ExamName , e.TotalMarks , ex.ExaminerName , d.DeptName , ins.InstituteName , e.examDate , es.StartTime , es.EndTime , e.Duration , (select count(StudentRollno) from studentexamenrollMENT where examid=e.examid) as tot from exam e inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join examschedule es on e.ScheduleId=es.ScheduleId inner join (department d inner join institute ins on d.InstituteId=ins.InstituteId ) on e.DeptId=d.DeptId where e.examdate=CURDATE() and es.StartTime<curtime() and es.EndTime>curtime()  and e.examid in (select examid from studentexamenrollMENT where studentrollno='"+studuser.getStudentrollno()+"') order by e.examDate,es.StartTime" ;  

  //todays exam
  String qry2 ="select e.examid , e.ExamName , e.TotalMarks , ex.ExaminerName , d.DeptName , ins.InstituteName , e.examDate , es.StartTime , es.EndTime , e.Duration , (select count(StudentRollno) from studentexamenrollMENT where examid=e.examid) as tot from exam e inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join examschedule es on e.ScheduleId=es.ScheduleId inner join (department d inner join institute ins on d.InstituteId=ins.InstituteId ) on e.DeptId=d.DeptId where e.examdate=CURDATE() and es.StartTime>curtime()  and e.examid  in (select examid from studentexamenrollMENT where studentrollno='"+studuser.getStudentrollno()+"') order by e.examDate,es.StartTime" ;  
  
  
  //upcoming exam after todays
   String qry3 = "select e.examid , e.ExamName , e.TotalMarks , ex.ExaminerName , d.DeptName , ins.InstituteName , e.examDate , es.StartTime , es.EndTime , e.Duration , (select count(StudentRollno) from studentexamenrollMENT where examid=e.examid) as tot from exam e inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join examschedule es on e.ScheduleId=es.ScheduleId inner join (department d inner join institute ins on d.InstituteId=ins.InstituteId ) on e.DeptId=d.DeptId where e.examdate>CURDATE() and e.examid  in (select examid from studentexamenrollMENT where studentrollno='"+studuser.getStudentrollno()+"') order by e.examDate,es.StartTime" ;         
          
   LocalDate localDate = LocalDate.now();
            String todaydate = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate) ;
 
            
            
            
  
  //ResultSet examRS=dbobj.fetchRecord(qry);
  ResultSet ongoingexamRS=dbobj.fetchRecord(qry1);
  ResultSet todaysexamRS=dbobj.fetchRecord(qry2);
  ResultSet examRS=dbobj.fetchRecord(qry3);

   
%>   



<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Student Home</title>

    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-wysiwyg -->
    <link href="../vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
    <!-- Select2 -->
    <link href="../vendors/select2/dist/css/select2.min.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="../vendors/switchery/dist/switchery.min.css" rel="stylesheet">
    <!-- starrr -->
    <link href="../vendors/starrr/dist/starrr.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Online Examiner</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Student ,</span>
                <h2><%= studuser.getStudentname() %> </h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

           <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="studentHome.jsp">Home</a></li>
                     
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Exam <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    
                      <li><a href="studentviewexam.jsp">Views Exams</a></li>
                    
                        <li><a href="studentexamcatalog.jsp">Exam Catalog</a></li>
                     
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Profile <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="studentProfile.jsp">Profile</a></li>
                    
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Scorecard <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="studentScorecard.jsp">Scorecard</a></li>
                     
                    </ul>
                  </li>
                 

                </ul>
              </div>
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                 
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">403 Error</a></li>
                   
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Support <span class="fa fa-chevron-down"></span></a>
                   
                        <li><a href="#level1_1">Help</a>	
                  </li>                  
				  
                  <li><a href="#"><i class="fa fa-laptop"></i> Contact Us </a></li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->
				

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="../logout">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
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

              <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown">
                    <img src="" alt=""><%= studuser.getStudentname() %>
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
                    <li><a href="javascript:;"> Profile</a></li>
                    <li>
                      <a href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                    </li>
                    <li><a href="javascript:;">Help</a></li>
                    <li><a href="../logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                  </ul>
                </li>

                <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">0</span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                <!--    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li>
                      <a>
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>department</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>  -->
                    <li>
                      <div class="text-center">
                        <a>
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>  
                </li>
              </ul>
            </nav>
          </div>
        </div>
				
        <!-- /top navigation -->

       <!--page content   -->
	   
       
           <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Exams</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
                
                
              
                
                
                
            </div>
              
              
              
              

            <div class="clearfix"></div>
            
            <div class="row">
             
              <div class="col-md-12">
                <div class="x_panel">
                       <h2 style="color:red">
                Ongoing Exam / Just Attempted Exam
            </h2>
            
                  <div class="x_content">
                    <div class="row">
                     
                    
                      
                      <%
                          while(ongoingexamRS.next())
                          {
                      %>
                      
                      
                      
                     <div class="col-md-4 col-sm-4 col-xs-12 profile_details" style="background-color:lightyellow">
                        <div class="well profile_view" style="background-color:lavender">
                            
                          <div class="col-sm-12">
                              <h4 class="brief"><i>Offered By <%=ongoingexamRS.getString("deptname")%> - <%=ongoingexamRS.getString("institutename") %></i></h4>
                            <div class="left col-xs-7">
                                <h2> <%=ongoingexamRS.getString("examname") %> </h2>
                              
                                <p><strong><i class="fa fa-building"></i> Hosted By </strong> <%= ongoingexamRS.getString("examinername") %> </p>
                                <p><strong><i class="fa fa-building"></i> Marks </strong> <%=ongoingexamRS.getString("totalmarks") %> </p>

                                <p><strong><i class="fa fa-building"></i> Exam Date </strong> <% if ( ongoingexamRS.getString("examdate").equals(todaydate) ) 
                                                                                                       out.println("Todays date") ;
                                                                                                 else
                                                                                                          out.println(ongoingexamRS.getString("examdate")) ;
                                                                                                    %> </p>
							<p><strong><i class="fa fa-building"></i> Time Between </strong> <%=ongoingexamRS.getString("starttime") %>   To  <%=ongoingexamRS.getString("endtime") %>   </p>
							<p><strong><i class="fa fa-building"></i> Exam duration </strong> <%=ongoingexamRS.getString("duration") %> Min </p>
							
                            </div>
                            <div class="right col-xs-5 text-center">
                          <!--  <img src="images/img.jpg" alt="" class="">  -->  
                            </div>
                          </div>
                          <div class="col-xs-12 bottom text-center">
                            <div class="col-xs-12 col-sm-6 emphasis">
                              
                               <strong> <%=ongoingexamRS.getString("tot") %> Total Enrolled
                                </strong>
                            </div>
                                
                             <div class="col-xs-12 col-sm-6 emphasis">
                                <form action="studentExamAppearingBEF.jsp" method="post">
                                    <input type="hidden" name="examid" value="<%=ongoingexamRS.getString("examid")%>"/>
                                     <input type="hidden" name="examname" value="<%=ongoingexamRS.getString("examname")%>"/>
                                     <input type="hidden" name="examdate" value="<%=ongoingexamRS.getString("examdate")%>"/>
                                
                                    <%
                                        String tabname='s'+ongoingexamRS.getString("examid")+studuser.getStudentrollno();
                                      String enrollid = studuser.getStudentrollno() + ongoingexamRS.getString("examid")  ;
      
                                        
                                       String checkTabQry="SELECT table_name FROM information_schema.tables WHERE table_schema = 'onlineexaminationsystem' AND table_name = '"+tabname+"'";
	
                                       ResultSet checkRS=dbobj.fetchRecord(checkTabQry);
                                       
                                       String qry="select * from studentmarksheet where StudentEnrollId='"+enrollid+"'";
                                       ResultSet RS=dbobj.fetchRecord(qry);
                                       
                                       
                                   
                                     if (RS.next()){ //allready done 
                                       %>
                                       <b>
                                       <p> Exam Done</p>
                                       <p> Marks: <%=RS.getString("obtainedmarks")%> / <%=RS.getString("totalmarks")%> </p>
                                      </b>
                                        <%
                                      }     
                                       
                                  else if (checkRS.next()){ //STUDENT CONTINUING EXAM 
                                       %>
                                          <input type="hidden" name="status" value="continue"/>
                                        
                                          <button type="submit" class="btn btn-primary btn-xs">
                                         <i class="fa fa-user"> </i> Continue Exam 
                                          </button>
                                       <%
                                   }
                                   else{   //STUDENT FRESH EXAM STARTING
                                        
                                     %>
                                       
                                    
                                         

                                          <input type="hidden" name="status" value="start"/>
                                   
                                          <button type="submit" class="btn btn-primary btn-xs">
                                         <i class="fa fa-user"> </i> Start Exam 
                                      </button>
                                          
                                       <%
                                        
                                   }

                                        %>
                                    
                                   
                                </form>
                               
                            </div>    
                           
                          </div>
                        </div>
                      </div>
     

                 <%
                     
                       }
                      %>
                      
                      
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
                      
           
            <div class="clearfix"></div>
  
            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                        <h2 style="color:orchid">
                Todays Exam
            </h2>
                  <div class="x_content">
                    <div class="row">
                     
                    
                      
                      <%
                          while(todaysexamRS.next())
                          {
                      %>
                      
                      
                      
                    <div class="col-md-4 col-sm-4 col-xs-12 profile_details" style="background-color:lightyellow">
                        <div class="well profile_view" style="background-color:lavender">
                              
                          <div class="col-sm-12">
                              <h4 class="brief"><i>Offered By <%=todaysexamRS.getString("deptname")%> - <%=todaysexamRS.getString("institutename") %></i></h4>
                            <div class="left col-xs-7">
                                <h2> <%=todaysexamRS.getString("examname") %> </h2>
                              
                                <p><strong><i class="fa fa-building"></i> Hosted By </strong> <%= todaysexamRS.getString("examinername") %> </p>
                                <p><strong><i class="fa fa-building"></i> Marks </strong> <%=todaysexamRS.getString("totalmarks") %> </p>

                                <p><strong><i class="fa fa-building"></i> Exam Date </strong> <% if ( todaysexamRS.getString("examdate").equals(todaydate) ) 
                                                                                                       out.println("Todays date") ;
                                                                                                 else
                                                                                                          out.println(todaysexamRS.getString("examdate")) ;
                                                                                                    %> </p>
							<p><strong><i class="fa fa-building"></i> Time Between </strong> <%=todaysexamRS.getString("starttime") %>   To  <%=todaysexamRS.getString("endtime") %>   </p>
							<p><strong><i class="fa fa-building"></i> Exam duration </strong> <%=todaysexamRS.getString("duration") %> Min </p>
							
                            </div>
                            <div class="right col-xs-5 text-center">
                          <!--  <img src="images/img.jpg" alt="" class="">  -->  
                            </div>
                          </div>
                          <div class="col-xs-12 bottom text-center">
                            <div class="col-xs-12 col-sm-6 emphasis">
                              
                               <strong> <%=todaysexamRS.getString("tot") %> Total Enrolled
                                </strong>
                            </div>
                           
                          </div>
                        </div>
                      </div>
     

                 <%
                     
                       }
                      %>
                      
                      
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>          
                      
             <div class="clearfix"></div>
  
            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                           <h2 style="color:yellowgreen">
                Upcoming Exams
            </h2>
                  <div class="x_content">
                    <div class="row">
                     
                    
                      
                      <%
                          while(examRS.next())
                          {
                      %>
                      
                      
                      
                     <div class="col-md-4 col-sm-4 col-xs-12 profile_details" style="background-color:lightyellow">
                        <div class="well profile_view" style="background-color:lavender">
                            
                          <div class="col-sm-12">
                              <h4 class="brief"><i>Offered By <%=examRS.getString("deptname")%> - <%=examRS.getString("institutename") %></i></h4>
                            <div class="left col-xs-7">
                                <h2> <%=examRS.getString("examname") %> </h2>
                              
                                <p><strong><i class="fa fa-building"></i> Hosted By </strong> <%= examRS.getString("examinername") %> </p>
                                <p><strong><i class="fa fa-building"></i> Marks </strong> <%=examRS.getString("totalmarks") %> </p>

                                <p><strong><i class="fa fa-building"></i> Exam Date </strong> <% if ( examRS.getString("examdate").equals(todaydate) ) 
                                                                                                       out.println("Todays date") ;
                                                                                                 else
                                                                                                          out.println(examRS.getString("examdate")) ;
                                                                                                    %> </p>
							<p><strong><i class="fa fa-building"></i> Time Between </strong> <%=examRS.getString("starttime") %>   To  <%=examRS.getString("endtime") %>   </p>
							<p><strong><i class="fa fa-building"></i> Exam duration </strong> <%=examRS.getString("duration") %> Min </p>
							
                            </div>
                            <div class="right col-xs-5 text-center">
                          <!--  <img src="images/img.jpg" alt="" class="">  -->  
                            </div>
                          </div>
                          <div class="col-xs-12 bottom text-center">
                            <div class="col-xs-12 col-sm-6 emphasis">
                              
                               <strong> <%=examRS.getString("tot") %> Total Enrolled
                                </strong>
                            </div>
                          
                          </div>
                        </div>
                      </div>
     

                 <%
                     
                       }
                      %>
                      
                      
                      
                    </div>
                  </div>
                </div>
              </div>
            </div> 
             
                      
                      
                      
                      
          </div>
        </div>
     
	
	 
	 
        <!-- /page content   -->

		
		
		
		
		
		
        <!-- footer content -->
        <footer>
          <div class="pull-right">
            ---
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
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
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap-wysiwyg -->
    <script src="../vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
    <script src="../vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
    <script src="../vendors/google-code-prettify/src/prettify.js"></script>
    <!-- jQuery Tags Input -->
    <script src="../vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
    <!-- Switchery -->
    <script src="../vendors/switchery/dist/switchery.min.js"></script>
    <!-- Select2 -->
    <script src="../vendors/select2/dist/js/select2.full.min.js"></script>
    <!-- Parsley -->
    <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
    <!-- Autosize -->
    <script src="../vendors/autosize/dist/autosize.min.js"></script>
    <!-- jQuery autocomplete -->
    <script src="../vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
    <!-- starrr -->
    <script src="../vendors/starrr/dist/starrr.js"></script>
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
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>
