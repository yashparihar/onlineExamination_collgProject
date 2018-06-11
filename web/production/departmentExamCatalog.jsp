<%-- 
    Document   : departmentExamCatalog
    Created on : 10 Apr, 2017, 2:17:11 PM
    Author     : Yash
--%>



<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="proj.operation.dbOperation"%>
<%@page import="models.department"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! 
   department deptuser=new department();
   
  String who="";
%>

<% 
  who = (String)session.getAttribute("userIdentification");
  
  if (who.equals("") ){
      response.sendRedirect("Login2.jsp");
  }
  else{
      deptuser =(department)session.getAttribute("userDetails");
  }


  
  
 dbOperation dbobj=new dbOperation();
  ResultSet examrequestRS=dbobj.fetchRecord("select * from exam where IsItApproved=0");
  
  //approved exam with no question bank
  String qry1 = "select e.examid, e.examname,dp.DeptName,e.examDate,e.TotalMarks ,ex.ExaminerName , es.StartTime, (select count(*) from studentexamenrollment where examid=e.ExamId) Enrolled, ep.questionBank_ID   from exam e inner join examinerappointed ep on e.examid=ep.examid inner join examschedule es on e.ScheduleId=es.ScheduleId inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join department dp on e.DeptId=dp.DeptId where (ep.questionBank_ID is null or ep.questionBank_ID='null' ) and  e.examdate>curdate() or ( e.examDate=curdate() and es.starttime>curtime() )  and e.IsItApproved=1";
//"select e.examid, e.examname,dp.DeptName,e.examDate,e.TotalMarks ,ex.ExaminerName , es.StartTime, (select count(*) from studentexamenrollment where examid=e.ExamId) Enrolled   from exam e inner join examinerappointed ep on e.examid=ep.examid inner join examschedule es on e.ScheduleId=es.ScheduleId inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join department dp on e.DeptId=dp.DeptId where e.examdate>curdate() or ( e.examDate=curdate() and es.starttime>curtime() ) and p.questionBank_ID is NULL and e.IsItApproved=1";
  
  ResultSet examListRS = dbobj.fetchRecord(qry1);//"select * from exam e inner join examinerappointed ep on e.examid=ep.examid");
  
 String qry2= "select e.examid,e.examname,dp.DeptName,e.examDate,e.TotalMarks ,ex.ExaminerName ,es.endtime ,(select count(*) from studentexamenrollment where examid=e.ExamId) Enrolled ,ep.questionBank_ID  from exam e inner join examinerappointed ep on e.examid=ep.examid inner join examschedule es on e.ScheduleId=es.ScheduleId inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join department dp on e.DeptId=dp.DeptId where e.examdate=curdate() and es.starttime<=curtime() and es.endtime>curtime()  and e.IsItApproved=1";
 
 ResultSet ongoingRS =dbobj.fetchRecord(qry2);

 
 //approved exam with question bank ready
String qry3 = "select e.examid, e.examname,dp.DeptName,e.examDate,e.TotalMarks ,ex.ExaminerName , es.StartTime, (select count(*) from studentexamenrollment where examid=e.ExamId) Enrolled, ep.questionBank_ID   from exam e inner join examinerappointed ep on e.examid=ep.examid inner join examschedule es on e.ScheduleId=es.ScheduleId inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join department dp on e.DeptId=dp.DeptId where (ep.questionBank_ID is not null and ep.questionBank_ID!='null' ) and  e.examdate>curdate() or ( e.examDate=curdate() and es.starttime>curtime() )  and e.IsItApproved=1";
//"select e.examid, e.examname,dp.DeptName,e.examDate,e.TotalMarks ,ex.ExaminerName , es.StartTime, (select count(*) from studentexamenrollment where examid=e.ExamId) Enrolled   from exam e inner join examinerappointed ep on e.examid=ep.examid inner join examschedule es on e.ScheduleId=es.ScheduleId inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join department dp on e.DeptId=dp.DeptId where e.examdate>curdate() or ( e.examDate=curdate() and es.starttime>curtime() ) and p.questionBank_ID is NULL and e.IsItApproved=1";
  
 ResultSet readyexamRS =dbobj.fetchRecord(qry3);

   
%>   



<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Department Home</title>

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
    <!-- Datatables -->
    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">


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
                <span>Department,</span>
                <h2>sff</h2>
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
                      <li><a href="departmentHome.jsp">Home</a></li>
                     
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Exam <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><b><a href="departmentCreateExam.jsp"> Create Exam</a></b></li>
                      <li><a href="departmentExamCatalog.jsp">Exam Catalog</a></li>
                     
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Examiner <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="departmentExaminerCatalog.jsp">Examiner Catalog</a></li>
                      <li><a href="departmentCreateExaminer.jsp">Register Examiner</a></li>
                    
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Student <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="departmentStudentCatalog.jsp">Student Catalog</a></li>
                     
                    </ul>
                  </li>
                 

                </ul>
              </div>
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                 
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="#">403 Error</a></li>
                   
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
                    <img src="" alt="">Department name
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

    <!--page content   ---------------------------------------------------->
       
       
           
        <div class="right_col" role="main">
          <div class="">
		  
		  
		  
            <div class="page-title">
              <div class="title_left">
                <h3>Exam Catalog</h3>
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
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                

				<div class="x_title">
             
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
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div class="" role="tabpanel" data-example-id="togglable-tabs">
                      <ul id="myTab1" class="nav nav-tabs bar_tabs right" role="tablist">
                        <li role="presentation" class="active"><a href="#tab_content11" id="home-tabb" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">Exam Request</a>
                        </li>
                       
                        <li role="presentation" class=""><a href="#tab_content22" role="tab" id="profile-tabb3" data-toggle="tab" aria-controls="profile" aria-expanded="false">Listed Exam</a>
                        </li>
						 <li role="presentation" class=""><a href="#tab_content33" role="tab" id="profile-tabb3" data-toggle="tab" aria-controls="profile" aria-expanded="false">Listed Exam with Question Bank</a>
                        </li>
						<li role="presentation" class=""><a href="#tab_content44" role="tab" id="profile-tabb3" data-toggle="tab" aria-controls="profile" aria-expanded="false">OnGoing Exam</a>
                        </li>
                      </ul>
                      <div id="myTabContent2" class="tab-content">
                     
             <div role="tabpanel" class="tab-pane fade active in" id="tab_content11" aria-labelledby="home-table">
                         
						      
	   <p class="text-muted font-13 m-b-30">
                            Exam Request from Department
                 </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                               <% 
                                ResultSetMetaData metaData = examrequestRS.getMetaData();
                                int count = metaData.getColumnCount(); //number of column
                                String columnName[] = new String[count];

                                for (int i = 1; i <= count; i++)
                                  {
                                     columnName[i-1] = metaData.getColumnLabel(i);
                                     out.println("<th>"+columnName[i-1]+"</th>");
  
                                   }
                           %>
                      
                   
                        </tr>
                      </thead>


                      <tbody>  
                         <%
                         
                          while(examrequestRS.next()) {
                                out.println("<form action='examinerappointedVAL.jsp' method='post'>");
                                   out.println("<tr>");
                                 
                             int colno=1 ;
                             
                           while(colno <= count){   
                               
   //  if (colno==1) out.println("<input type='hidden' name='examid' value='"+examrequestRS.getString(colno)+"'/>");
    
   //  else if (colno==5) out.println("<input type='hidden' name='examinerid' value='"+examrequestRS.getString(colno)+"'/>");
                   
                               out.println("<td>");                          
                                 out.println(examrequestRS.getString(colno));                          
                            out.println("</td>");
                            
                            colno=colno+1;                         
                           }   
                           
        //   out.println("<td> <button id='send' type='submit' class='btn btn-success'>Accept </button> </td>");
                     
                   out.println("</tr>  </form>");                         
                        }
                     %> 
                     
                    
	              </tbody>
                    </table>
							  		 
                       </div>
                     
                     
              <div role="tabpanel" class="tab-pane fade" id="tab_content22" aria-labelledby="profile-tab">
                         
						 
			   <p class="text-muted font-13 m-b-30">
                             Approved Exam which are Listed Without Question bank
                                 </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                            
                               <%
                                ResultSetMetaData metaData2 = examListRS.getMetaData() ;
                                count = metaData2.getColumnCount() ; //number of column
                               String columnName2[] = new String[count];
                                 
                                
                                   
                               int colno=1;
                                for (int i = 1; i <= count; i++)
                                  {
                                   
                                     columnName2[colno-1] = metaData2.getColumnLabel(i);
                                     out.println("<th>"+columnName2[colno-1]+"</th>");
                                      colno+=1;
                                   }
                          %>
                        </tr>
                      </thead>


                          <tbody>
                      <%
                        
                          while(examListRS.next()){
                                   out.println("<tr>");
                             colno=1;
                           while(colno<=count){  
                            
                               
                               out.println("<td>");                          
                                 out.println(examListRS.getString(colno));                          
                            out.println("</td>");
                            
                            colno=colno+1;                         
                           }                     
                          out.println("</tr>");                         
                        }
                     %>  
                    </tbody>
                    </table>
					 
                        </div>
                     
              <div role="tabpanel" class="tab-pane fade" id="tab_content33" aria-labelledby="profile-tab2">
               			 
			   <p class="text-muted font-13 m-b-30">
                               Approved Exam which are Listed With Question bank
                            
                                 </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                            
                               <%
                                ResultSetMetaData metaData4 = readyexamRS.getMetaData() ;
                                count = metaData4.getColumnCount() ; //number of column
                               String columnName4[] = new String[count];
                                 
                                
                                   
                                colno=1;
                                for (int i = 1; i <= count; i++)
                                  {
                                
                                     columnName4[colno-1] = metaData4.getColumnLabel(i);
                                     out.println("<th>"+columnName4[colno-1]+"</th>");
                                      colno+=1;
                                   }
                          %>
                        </tr>
                      </thead>


                          <tbody>
                      <%
                        
                           while(readyexamRS.next()){
                                   out.println("<tr>");
                             colno=1;
                           while(colno<count){  
                            
                               
                               out.println("<td>");                          
                                 out.println(readyexamRS.getString(colno));                          
                            out.println("</td>");
                            
                            colno=colno+1;                         
                           }                     
                        
                     %>  
                     
                         <td>  <form action='departmentquestionbankPro.jsp' method='post'>
                                  <input type="hidden" name="qbid" value="<%=readyexamRS.getString(colno)%>" />
                                     <button id='send' type='submit'  class='btn btn-success'> <%=readyexamRS.getString(colno)%> </button> 
                              </form>
                          </td>
                    </tr>
                     <% } %>
                    </tbody>
                    </table>
					 
                   
                        </div>
						
				

             <div role="tabpanel" class="tab-pane fade" id="tab_content44" aria-labelledby="profile-tab">
                          
	           	   <p class="text-muted font-13 m-b-30">
                              Ongoing Exam List
                                 </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                            
                               <%
                                ResultSetMetaData metaData3 = ongoingRS.getMetaData() ;
                                count = metaData3.getColumnCount() ; //number of column
                               String columnName3[] = new String[count];
                                 
                                
                                   
                                colno=1;
                                for (int i = 1; i <= count; i++)
                                  {
                                
                                     columnName3[colno-1] = metaData3.getColumnLabel(i);
                                     out.println("<th>"+columnName3[colno-1]+"</th>");
                                      colno+=1;
                                   }
                          %>
                        </tr>
                      </thead>


                          <tbody>
                      <%
                        
                           while(ongoingRS.next()){
                                   out.println("<tr>");
                             colno=1;
                           while(colno<count){  
                            
                               
                               out.println("<td>");                          
                                 out.println(ongoingRS.getString(colno));                          
                            out.println("</td>");
                            
                            colno=colno+1;                         
                           }                     
                        
                     %>  
                     
                         <td>  <form action='departmentquestionbankPro.jsp' method='post'>
                                  <input type="hidden" name="qbid" value="<%=ongoingRS.getString(colno)%>" />
                                     <button id='send' type='submit'  class='btn btn-success'> <%=ongoingRS.getString(colno)%> </button> 
                              </form>
                          </td>
                    </tr>
                     <% } %>
                    </tbody>
                    </table>
					 
                   
                      
                       </div>



				
						
						
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
             
                  
        </div>
	
      
       
       
                    
             
    <!-- /page content   -------------------------------------------------->            
                    
      </div>
       
       
	
	 
	 
      

		
		
		
		
		
		
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
     <!-- Datatables -->
    <script src="../vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="../vendors/jszip/dist/jszip.min.js"></script>
    <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>
