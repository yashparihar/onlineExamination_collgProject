<%-- 
    Document   : examinerExamCatalog
    Created on : 4 Apr, 2017, 12:14:38 PM
    Author     : Yash
--%>



<%@page import="models.examiner"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="proj.operation.dbOperation"%>
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
  }
  else{
      exauser =(examiner)session.getAttribute("userDetails");
  }
 dbOperation dbobj=new dbOperation();
 
 
 String examWithoutQB="select ep.ExamerAppointedId, ep.Examid,e.ExamName,d.DeptName,e.examDate,es.StartTime ,es.EndTime ,e.TotalMarks,e.Duration from examinerappointed ep inner join (exam e inner join examschedule es on e.ScheduleId=es.ScheduleId inner join department d on e.DeptId=d.DeptId) on ep.Examid=e.ExamId inner join examiner exa on ep.examinerid=exa.ExaminerId  where ep.ExaminerId='"+exauser.getExaminerid()+"' and ep.questionBank_ID is null and e.examdate>=CURDATE() ";
 
 String examWithQB="select ep.Examid,e.ExamName,d.DeptName,e.examDate,es.StartTime ,es.EndTime ,e.TotalMarks,e.Duration , ep.questionBank_ID from examinerappointed ep inner join (exam e inner join examschedule es on e.ScheduleId=es.ScheduleId inner join department d on e.DeptId=d.DeptId) on ep.Examid=e.ExamId inner join examiner exa on ep.examinerid=exa.ExaminerId  where ep.ExaminerId='"+exauser.getExaminerid()+"' and ep.questionBank_ID is NOT null and e.examdate>=CURDATE()";
 
  ResultSet RSwithoutQB=dbobj.fetchRecord(examWithoutQB); 
  ResultSet RSwithQB = dbobj.fetchRecord(examWithQB);
  
 String qry2= "select e.examid,e.examname,dp.DeptName,e.examDate,e.TotalMarks ,ex.ExaminerName ,es.endtime ,(select count(*) from studentexamenrollment where examid=e.ExamId) Enrolled ,ep.questionBank_ID  from exam e inner join examinerappointed ep on e.examid=ep.examid inner join examschedule es on e.ScheduleId=es.ScheduleId inner join examiner ex on e.ExaminerId=ex.ExaminerId inner join department dp on e.DeptId=dp.DeptId where ep.ExaminerId='"+exauser.getExaminerid()+"' and  e.examdate=curdate() and es.starttime<=curtime() and es.endtime>curtime()  and e.IsItApproved=1";
 
 ResultSet ongoingRS =dbobj.fetchRecord(qry2);

 


%>   




<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	  
    <title>Examiner Home</title>

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
                <span>Examiner ,</span>
                <h2><%= exauser.getExaminername() %> </h2>
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
                      <li><a href="examinerHome.jsp">Home</a></li>
                     
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Exam <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                    
                      <li><a href="examinerExamCatalog.jsp">Exam Catalog</a></li>
                     
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> Question Bank <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="CreateQuestionBank.jsp">create new Question Bank</a></li>
                      <li><a href="QuestionBankCatalog.jsp">Question Bank Catalog</a></li>
                    
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Student <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="examinerStudentCatalog.jsp">Student Catalog</a></li>
                     
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
                    <img src="" alt=""><%= exauser.getExaminername() %>
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

       <!--page content   -------------------------------------------------->
	   
       
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
                        <li role="presentation" class="active"><a href="#tab_content11" id="home-tabb" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">New Exam Appointed</a>
                        </li>
                       
                        <li role="presentation" class=""><a href="#tab_content22" role="tab" id="profile-tabb3" data-toggle="tab" aria-controls="profile" aria-expanded="false">Exam Finalized</a>
                        </li>
						 <li role="presentation" class=""><a href="#tab_content33" role="tab" id="profile-tabb3" data-toggle="tab" aria-controls="profile" aria-expanded="false">OnGoing Exam</a>
                        </li>
						<li role="presentation" class=""><a href="#tab_content44" role="tab" id="profile-tabb3" data-toggle="tab" aria-controls="profile" aria-expanded="false">Finished Exam</a>
                        </li>
                      </ul>
                      <div id="myTabContent2" class="tab-content">
                        <div role="tabpanel" class="tab-pane fade active in" id="tab_content11" aria-labelledby="home-table">
                         
						      
	   <p class="text-muted font-13 m-b-30">
                            New Exam Appointed and QuestionBank is Yet to Be Post
                 </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                               <% 
                                ResultSetMetaData metaData = RSwithoutQB.getMetaData();
                                int count = metaData.getColumnCount(); //number of column
                                String columnName[] = new String[count];

                                for (int i = 2; i <= count; i++)
                                  {
                                     columnName[i-1] = metaData.getColumnLabel(i);
                                     out.println("<th>"+columnName[i-1]+"</th>");
  
                                   }
                           %>
                           <th> POST Questions </th>
                   
                        </tr>
                      </thead>


                      <tbody>  
                         <%
                         
                          while(RSwithoutQB.next()) {
                                out.println("<form action='createQuestionBank.jsp' method='post'>");
                                %>
                                 <input type="hidden" name="fromForm" value="examinerExamCatalog"/>
                                <%
                                   out.println("<tr>");
                                 
                             int colno=2 ;
                             
                           while(colno <= count){   
                               
     if (colno==2) out.println("<input type='hidden' name='examid' value='"+RSwithoutQB.getString(colno)+"'/>");
    
     else if (colno==3) out.println("<input type='hidden' name='examname' value='"+RSwithoutQB.getString(colno)+"'/>");
      
      else if (colno==5) out.println("<input type='hidden' name='examdate' value='"+RSwithoutQB.getString(colno)+"'/>");
     
      else if (colno==8) out.println("<input type='hidden' name='exammarks' value='"+RSwithoutQB.getString(colno)+"'/>");                                            
                          
                            out.println("<td>");    
                                 out.println(RSwithoutQB.getString(colno));                          
                            out.println("</td>");
                            
                            colno=colno+1;                         
                           }   
                           
           out.println("<td> <button id='send' type='submit' class='btn btn-success'>Post </button> </td>");
                     
                   out.println("</tr>  </form>");                         
                        }
                     %> 
                     
                    
	              </tbody>
                    </table>
							  		 
                       </div>
                     
                     
                        <div role="tabpanel" class="tab-pane fade" id="tab_content22" aria-labelledby="profile-tab">
                         
						 
			   <p class="text-muted font-13 m-b-30">
                             Finalized Exam where Question bank has been Succesfully Posted 
                                 </p>
                    <table id="datatable" class="table table-striped table-bordered">
                      <thead>
                        <tr>
                            
                               <%
                                ResultSetMetaData metaData2 = RSwithQB.getMetaData() ;
                                count = metaData2.getColumnCount() ; //number of column
                               String columnName2[] = new String[count];
                                 
                                
                                   
                               int colno=1;
                                for (int i = 1; i <=count; i++)
                                  {
                                   
                                     columnName2[i-1] = metaData2.getColumnLabel(i);
                                     out.println("<th>"+columnName2[colno-1]+"</th>");
                                      colno+=1;
                                   }
                                
                          %>
                       
                        </tr>
                      </thead>


                          <tbody>
                      <%
                        
                          while(RSwithQB.next()){
                                   out.println("<tr>");
                             colno=1;
                             int i=0;
                          for ( i = 1; i < count; i++)
                                  { 
                               out.println("<td>");                          
                                 out.println(RSwithQB.getString(i) );                          
                            out.println("</td>");
                            
                                                
                           }   
                               String qbide=RSwithQB.getString(i);
                           %>
                           
                          <td>  <form action='questionbankProfile.jsp' method='post'>
                                  <input type="hidden" name="qbid" value="<%=qbide%>" />
                                     <button id='send' type='submit'  class='btn btn-success'> <%=qbide%> </button> 
                              </form>
                          </td>
                        
                          <%
                          out.println("</tr>");                         
                        }
                     %>  
                    </tbody>
                    </table>
					 
                        </div>
                     
                        <div role="tabpanel" class="tab-pane fade" id="tab_content33" aria-labelledby="profile-tab2">
                          
			   <p class="text-muted font-13 m-b-30">
                           Ongoing Exam Status Report 
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
                     
                         <td>  <form action='questionbankProfile.jsp' method='post'>
                                  <input type="hidden" name="qbid" value="<%=ongoingRS.getString(colno)%>" />
                                     <button id='send' type='submit'  class='btn btn-success'> <%=ongoingRS.getString(colno)%> </button> 
                              </form>
                          </td>
                    </tr>
                     <% } %>
                    </tbody>
                    </table>
					 
                       
                                 
                                 
                                 
                  			  	
                        </div>
						
				

             <div role="tabpanel" class="tab-pane fade" id="tab_content44" aria-labelledby="profile-tab">
                          
	               <p class="text-muted font-13 m-b-30">
                           Completed Exam Final Report 
                                 </p>
                       </div>



				
						
						
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
             
                  
        </div>
	
      
	 
        <!-- /page content   ---------------------------------------------------->

		
		
		
		
		
		
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
