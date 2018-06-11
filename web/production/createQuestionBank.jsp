<%-- 
    Document   : createQuestionBank
    Created on : 4 Apr, 2017, 12:47:07 PM
    Author     : Yash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="proj.operation.dbOperation"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="models.examiner"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! 
   examiner exauser=new examiner() ;
 
  String who="";
  String fromForm="" ;
  String id="";//request.getParameter("examid");
String name="";//request.getParameter("examname");
String date="";//request.getParameter("examdate");
int marks=0;

String qbid="";
String totalquestion="";
int count=1;
String totmarks="" ;
  String hide="";
  String mainhide="";
  String disable="";
%>

<% 
  who = (String)session.getAttribute("userIdentification");

  if (who.equals("") ){
      response.sendRedirect("Login2.jsp");
      return;
  }
  else{
      exauser =(examiner)session.getAttribute("userDetails");
  }


  fromForm = request.getParameter("fromForm");
  
if (fromForm.equals("createQuestionbank")){
    hide="display:normal;";
    mainhide="display:none;";
    disable="disabled";
    id=request.getParameter("examid");
    qbid=request.getParameter("qbid");
  totalquestion=request.getParameter("totalquestion");
   totmarks=request.getParameter("marks") ;

    int totm=0;
    totm=Integer.parseInt(totmarks);
    int totq = 0;
    totq=Integer.parseInt(totalquestion);
    int qmark=totm/totq ;    //CCALCULATING MARKS OF EACH QUESTION...
     String eachQmarks = String.valueOf(qmark) ;
  count = Integer.parseInt(totalquestion);
   
   out.println(fromForm+" "+qbid+" "+totalquestion+" "+totmarks) ;
  
   
   
   dbOperation db=new dbOperation(); 
   
   String qry = "insert into questionbank values('"+qbid+"' , '"+totmarks+"' ,'"+exauser.getExaminerid()+"' , '"+totalquestion+"' , '"+eachQmarks+"')";
   
   db.updateQuery(qry);
   
   db.updateQuery("update examinerappointed set questionBank_ID='"+qbid+"' where examid='"+id+"'" );
   
   
}
else if (fromForm.equals("examinerExamCatalog")){
     mainhide="display:normal;"; 
    hide="display:none;";
    disable="";
    
    
                       
   totalquestion="";
   count=1;
    
     id=request.getParameter("examid");
      name=request.getParameter("examname");
   date=request.getParameter("examdate");
    marks=Integer.parseInt(request.getParameter("exammarks"));
      qbid=id.substring(1,3)+exauser.getExaminerid().substring(1, 3) +marks;
      
    out.println(fromForm+" "+id+" "+name+" "+date+" "+marks+" "+qbid) ;
}
else{
       hide="display:hide;";
    mainhide="display:normal;";
    

}



            
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

       <!--page content   --------------------------------------------------->
	   
      <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Create Question Bank</h3>
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
                  
                  
                  
                <div class="x_panel" >
       
       <div class="x_title">
                    <h2>FillUp Question Contents </h2>
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
                    
                     <div class="x_content" >
                          <div class="clearfix"></div>
                          
                     
                          
                          
                          <form action="createQuestionBank.jsp"  class="form-horizontal form-label-left" novalidate style="<%=mainhide%>">

                    
                      <span class="section">Question Bank Information Form </span>
                      
                         <input type="hidden" name="fromForm" value="createQuestionbank"/>
                          <input type="hidden" name="marks" value="<%=marks%>"/>
                           <input type="hidden" name="qbid" value="<%=qbid%>" />

                          
                          <input type="hidden" name="examid" value="<%=id%>"/>
                            
                            
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">QuestionBank ID <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12"> <%  //generate questionbank id
                             //    String qid = id.substring(1,3)+exauser.getExaminerid().substring(1, 3) +marks;
                            %>
                            <input id="name" value="<%=qbid%>" class="form-control col-md-7 col-xs-12" data-validate-length-range="10"  placeholder="QB ID" required="required" type="text" disabled="true" >
                        </div>
                      </div>
                       

                           <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">Total Marks <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="number" id="number" value="<%=marks%>" name="totmarks" required="required" data-validate-minmax="10,100" class="form-control col-md-7 col-xs-12" disabled="true">
                        </div>
                      </div>
                      
                      
                        <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"> Total Question and Each marks <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         
                          <select name="totalquestion" id="heard" class="form-control" required <%=disable%>>
                           <% int tot=marks;
                             for(int i=1 ; tot/i>1  ; i++){
                                 if (tot%i==0) {
                                     int no=tot/i;
                             %>
                              
                             <option value="<%=no%>" > <%=tot/i%> Questions | Each Question <%=i%> Marks </option>
                            <%
                                }
                             }
                            %>
                          </select>
                        </div>
                      </div>
                      
                     
                       <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"> Question Bank for Exam <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         
                            <input id="name" name="examname" value="<%=name%>" class="form-control col-md-7 col-xs-12" data-validate-length-range="6"  placeholder="QB ID" required="required" type="text" disabled="true">
                    
                        </div>
                      </div>
                      
	        
                
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <button type="submit" class="btn btn-primary" <%=disable%> >Cancel</button>
                          <button id="send" type="submit" class="btn btn-success" <%=disable%> >Insert Questions</button>
                        </div>
                      </div>
                        
                    </form>     
                          
                          
                          
                          
                          
                          
                       

                    <!-- Smart Wizard -->
                  <!--  <p>This is a basic form wizard example that inherits the colors from the selected scheme.</p>
                -->   
                    <form action="createQuestionBankVAL.jsp" class="form-horizontal form-label-left" novalidate >
                       <input type="hidden" name="questionbankid" value="<%=qbid%>"/>
                       
                        <input type="hidden" name="totalquestion" value="<%=count%>"/>
                        
                   <div id="wizard" class="form_wizard wizard_horizontal" style="<%=hide%>">
                    
                  
                    
                      <ul class="wizard_steps">
                          <% for(int i=1;i<=count;i++) {
                               String step="#step-"+i; 
                              %>
                              <li>
                            
                             <a href='<%=step%>'>
                            <span class='step_no'><%= i %></span> 
                            <span class="step_descr">
                                              Q <%=i%> <br />
                              </span>                 
                          </a>
                              <%
                          }
                          %>
 
                      </ul>
                        
               <!--       <form action="createQuestionBank.jsp"   class="form-horizontal form-label-left" novalidate >
                   -->       
                         <% for(int i=1;i<=count;i++) {
                               String step="step-"+i; 
                               String disable="";
                              %>  
                      <div id='<%=step%>'>
                        <h2 class="StepTitle">Question <%=i%> Content              </h2>
                        
                            
                 
                                     
                         <input type="hidden" name="fromForm" value="createQuestionbank"/>
                      
                        <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea"> Questions <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <textarea id="textarea" required="required" name="<%=i%>question" class="form-control col-md-7 col-xs-12"></textarea>
                        </div>
                      </div>
                            
                        
                           <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option A <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" name="<%=i%>option_a" class="form-control col-md-7 col-xs-12"  required="required" type="text">
                        </div>
                      </div>
                         
                             <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option B <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" name="<%=i%>option_b" class="form-control col-md-7 col-xs-12"  required="required" type="text">
                        </div>
                      </div>
                         
                         
                             <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option C <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" name="<%=i%>option_c" class="form-control col-md-7 col-xs-12"  required="required" type="text">
                        </div>
                      </div>
                         
                         
                             <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Option D <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" name="<%=i%>option_d" class="form-control col-md-7 col-xs-12"  required="required" type="text">
                        </div>
                      </div>
                         
                           <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Correct Option <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select name="<%=i%>correctoption" required>
                                <option value="A"> Option A  </option>
                                <option value="B"> Option B  </option>
                                <option value="C"> Option C  </option>
                                <option value="D"> Option D  </option>
                            </select>
                            
                           </div>
                               
                      </div>  

                        
                      </div>
                        
                        <% 
                            }
                         %>
                     
                  
                          
                    <!--  </form>     
                       -->
                     

                    </div>
                         
                                 <div class="ln_solid"></div>
                       <div class="form-group">
                          <div class="col-md-6 col-md-offset-3">
                         
                            <button id="send" type="submit" class="btn btn-success">Submit</button>
                        </div>
                       </div>
                         
                     </form>
                    <!-- End SmartWizard Content -->

       
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
      <!-- jQuery Smart Wizard -->
    <script src="../vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
 
    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>

