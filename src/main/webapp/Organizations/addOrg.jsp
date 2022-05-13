<%@page import="siginin.Employee"%>
<% Employee user = (Employee) session.getAttribute("login");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Organization</title>
        <link href="../img/book.png" rel="shortcut icon">
        <link href="../css/form-style.css" rel="stylesheet" type="text/css">
        <link href="../css/footer-style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
           
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="bs-example">
            
                    <nav class="navbar navbar-expand-md navbar-light" style="background-color: white;">
                        <a href="../index.jsp" class="navbar-brand">
                            <img src="../img/logo.png" height="130" alt="Soroni">
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                         <div class="collapse navbar-collapse" id="collapsibleNavbar">                    
                            <%if(user==null)
                            { %>
                            <div class ="navbar-nav">
                            <a href="../index.jsp" class="nav-item nav-link"><b>Home</b></a> <!--li because it is a menu-->
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
                                <a href="../index.jsp" class="nav-item nav-link"><b>Home</b></a> 
                           <a href="../downloadPDF.jsp" class="nav-item nav-link"><b>Free PDF</b></a>
                            <a href="../newsandEvents.jsp" class="nav-item nav-link"><b>News and Events</b></a>
                            <a href="../Students/searchToken.jsp" class="nav-item nav-link"><b>What is my token number?</b></a>
                            <a href="../Volunteers/addVolunteer.jsp" class="nav-item nav-link"><b>Register to be a Volunteer</b></a>
                            <a href="../Exam/mcqExam.jsp" class="nav-item nav-link"><b>MCQ Exam</b></a> 
                            <a href="../profile.jsp" class="nav-item nav-link  active"><b>Profile, <%= user.getEmp_name() %></b></a>
                            <a href="../LogoutServletPage" class="nav-item nav-link"><b>LogOut</b></a>
                            </div>
                                <% } %>
                         </div>
                    </nav>
           </div>
        
        <div class="container-sm">
            
                <div class="card" style="background-color: #fff1b3;">
            <article class="card-body mx-auto" style="max-width: 400px;">
                <h4 class="card-title mt-3 text-center" style="color: #35394c;">Add a New Organization</h4>
                    <form action="../RegisterOrgServlet" method="post" enctype="multipart/form-data">
                    <div class="form-group input-group" >
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
                        <input type="text" placeholder="Organization Name" name="org_name" class="form-control" required> 
                    </div>
                   <div class="form-group input-group" >
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-address-card"></i> </span>
		 </div>
                        <input type="text" placeholder="Address" name="org_address" class="form-control" required>
                   </div>
                    <div class="form-group input-group" >
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		 </div>
                        <input type="text" placeholder="Contact" name="org_contact" class="form-control" required>
                    </div>
                   <div class="form-group input-group" >
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-align-justify"></i> </span>
		 </div>
                        <input type="text" placeholder="Description" name="org_description" class="form-control" required>
                   </div>
                        <div class="form-group input-group">
                        <div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-image"></i> </span>
		 </div>
                           <div class="custom-file">
                        <input type="file" name="photo" class="form-control custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose Image</label>
                           </div>
                    </div>
                        <div class="form-group">
                            <button type="submit" class="btnn btn-block"><i class="fa fa-plus"> Insert</i></button>
    </div>
                        <div class="form-group">
                            <button type="reset" class="btnn btn-block"><i class="fa fa-undo"> Reset</i></button>
    </div>
                        <div class="form-group">
            <p class="text-center"><a href="manageOrg.jsp" class="btnn btn-block">Back</a></p>
                   </div>
                                
                </form>
            </article>
                </div>
            </div>
<script>
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>                         
                         
      <footer class="footer-distributed">
  <div class="footer-left">
     <p class="footer-links">
 <a href="../index.jsp">Home</a>
 ·
 <a href="../downloadPDF.jsp">Free PDF</a>
 ·
 <a href="../newsandEvents.jsp">News and Events</a>
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