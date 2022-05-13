<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Blob"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="siginin.*"%>
<%@page import="siginin.Employee"%>
<%
    Employee user = (Employee) session.getAttribute("login");
    if(user==null){
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Profile</title>
        <link href="img/book.png" rel="shortcut icon">
        <link rel="stylesheet" href="style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
           
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
          <link href="css/profile-style.css" rel="stylesheet" type="text/css">
          <link href="css/footer-style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="bs-example">
            
                    <nav class="navbar navbar-expand-md navbar-light" style="background-color: white;">
                        <a href="#" class="navbar-brand">
                            <img src="img/logo.png" height="130" alt="Soroni">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                         <div class="collapse navbar-collapse" id="collapsibleNavbar">                    
                            <%if(user==null)
                            { %>
                            <div class ="navbar-nav">
                            <a href="index.jsp" class="nav-item nav-link active"><b>Home</b></a> <!--li because it is a menu-->
                            <a href="downloadPDF.jsp" class="nav-item nav-link"><b>Free PDF</b></a>
                            <a href="newsandEvents.jsp" class="nav-item nav-link"><b>News and Events</b></a>
                            <a href="Students/searchToken.jsp" class="nav-item nav-link"><b>What is my token number?</b></a>
                            <a href="Volunteers/addVolunteer.jsp" class="nav-item nav-link"><b>Register to be a Volunteer</b></a>
                            <a href="Exam/mcqExam.jsp" class="nav-item nav-link"><b>MCQ Exam</b></a>
                            </div>
                            <div class="navbar-nav ml-auto">
                                <a href="login.jsp" class="nav-item nav-link"><b>Login</b></a>
                            </div>
                                
                            <%}
                            else
                                { %>
                                <div class ="navbar-nav">
                                <a href="index.jsp" class="nav-item nav-link"><b>Home</b></a> 
                           <a href="downloadPDF.jsp" class="nav-item nav-link"><b>Free PDF</b></a>
                            <a href="newsandEvents.jsp" class="nav-item nav-link"><b>News and Events</b></a>
                            <a href="Students/searchToken.jsp" class="nav-item nav-link"><b>What is my token number?</b></a>
                            <a href="Volunteers/addVolunteer.jsp" class="nav-item nav-link"><b>Register to be a Volunteer</b></a>
                            <a href="Exam/mcqExam.jsp" class="nav-item nav-link"><b>MCQ Exam</b></a> 
                            <a href="#" class="nav-item nav-link active"><b>Profile, <%= user.getEmp_name() %></b></a>
                            <a href="LogoutServletPage" class="nav-item nav-link"><b>LogOut</b></a>
                            </div>
                                <% } %>
                         </div>
                    </nav>
           </div>
        
             <div class="container-lg">
                 <div class="card-deck">
                 <div class="card" style="width: 400px">
                     <div class="card-header text-center"><h2>Actions</h2></div>
                     
                     <br>
                     <a href="Events/manageEvents.jsp" class="btn"><i class="fa fa-edit"> Manage Events</i></a>
                        <br>
                        <a href="Schools/manageSchool.jsp" class="btn"><i class="fa fa-edit"> Manage Schools</i></a>
                        <br>
                        <a href="Organizations/manageOrg.jsp" class="btn"><i class="fa fa-edit"> Manage Organizations</i></a>
                        <br>
                        <a href="Students/manageStudent.jsp" class="btn"><i class="fa fa-edit"> Manage Students</i></a>
                        <br>
                        <a href="Volunteers/manageVolunteer.jsp" class="btn"><i class="fa fa-edit"> Manage Volunteers</i></a>
                        <br>
                        <% 
                                String user_id = user.getEmp_id();
                                if (user_id.equals("100"))
                                    { %>
                            <a href="Employees/manageEmployee.jsp" class="btn"><i class="fa fa-edit"> Manage Employees</i></a>
                            <br>
                                   <% }%>
                                   
                            <a href="Exam/manageExam.jsp" class="btn"><i class="fa fa-edit"> Manage Exams</i></a>
                            <br>
                             <a href="uploadPDF.jsp" class="btn"><i class="fa fa-upload"> Upload PDF</i></a>
                             <br>
                             <a href="Contact/messageList.jsp" class="btn"><i class="fa fa-paper-plane"> Messages</i></a>
                                        
                                </div>
                            
             
           
        <div class="card" style="width:400px">
            <div class="card-header text-center"><h2>Profile, <%= user.getEmp_name()%></h2></div>
         <img class="card-img-top img-thumbnail mx-auto d-block img-responsive" src="showImage.jsp?id=<%= user.getEmp_id() %>" alt="Card image" style="width:50%"> 
         <center>
             <br><p><a href="Employees/editPicture.jsp?id=<%=user.getEmp_id()%>" class="btn btn-sm"><i class="fa fa-edit"> Edit Picture</i></a></p>
         </center>
         <div class="card-body text-center">
             <h4 class="card-title text-center"><b><%= user.getEmp_name()%></b></h4>
            <h6 class="card-text">ID: <%= user.getEmp_id() %></h6>
            <h6 class="card-text">Email: <%= user.getEmp_email()%></h6>
            <h6 class="card-text">Phone Number: <%= user.getEmp_phone()%></h6>
            </div>
            <center>
        <p><a href="Employees/editProfile.jsp?id=<%=user.getEmp_id()%>" class="btn"><i class="fa fa-edit"> Edit Profile</i></a></p>
        <p><a href="changePassword.jsp" class="btn"><i class="fa fa-key"> Change Password</i></a></p>
        <p class = "update_msg"><%= request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%> </p>
            
            </center>
      </div>
   </div>
</div>
    
    
     <footer class="footer-distributed">
         <div class="footer-left">
             <p class="footer-links">
 <a href="index.jsp">Home</a>
 ·
 <a href="downloadPDF.jsp">Free PDF</a>
 ·
 <a href="newsandEvents.jsp">News and Events</a>
 ·
 <a href="#">Contact</a>
 </p>
 
 </div>
         <div class="footer-center">
             <div>
 <i class="fa fa-map-marker"></i>
 <p><span>East West University</span>Aftabnagar, Dhaka</p>
 </div>
             <div>
 <i class="fa fa-phone"></i>
 <p>9999999</p>
 </div>
 
 <div>
 <i class="fa fa-envelope"></i>
 <p><a href="mailto:support@company.com">projectsoroni@gmail.com</a></p>
 </div>
 
 </div>
         <div class="footer-right">
 
 <p class="footer-company-about">
 <span>About the project</span>
 Soroni is a platform focusing on Children Education.
 </p>
 
 <div class="footer-icons">
 
 <a href="#"><i class="fa fa-facebook"></i></a>
 <a href="#"><i class="fa fa-twitter"></i></a>
 <a href="#"><i class="fa fa-linkedin"></i></a>
 <a href="#"><i class="fa fa-github"></i></a>
 
 </div>
 
 </div>
 
 </footer>
    </body>
</html>




