<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="siginin.Employee"%>
<% Employee user = (Employee) session.getAttribute("login");%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Schools</title>
        <link href="../img/book.png" rel="shortcut icon">
        <link href="../css/footer-style.css" rel="stylesheet" type="text/css">
        <link href="../css/manageTables-style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
           
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
                            <a href="../downloadPDF.jsp" class="nav-item nav-link"><b>Free PDF</b></a>
                            <a href="../newsandEvents.jsp" class="nav-item nav-link"><b>News and Events</b></a>
                            <a href="../Students/searchToken.jsp" class="nav-item nav-link"><b>What is my token number?</b></a>
                            <a href="../Volunteers/addVolunteer.jsp" class="nav-item nav-link"><b>Register to be a Volunteer</b></a>
                            <a href="../Exam/mcqExam.jsp" class="nav-item nav-link"><b>MCQ Exam</b></a>
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
                            <a href="../profile.jsp" class="nav-item nav-link"><b>Profile, <%= user.getEmp_name() %></b></a>
                            <a href="../LogoutServletPage" class="nav-item nav-link"><b>LogOut</b></a>
                            </div>
                                <% } %>
                         </div>
                    </nav>
           </div>
       
        <%
String id = request.getParameter("id");
try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from schools where organization_org_name='"+id+"'");
        while(rs.next()){
%>                 
       <div class="container">
           <h2 class="text-center">Schools under <%=id%></h2>
              <div class="card-deck">
            <div class="card">
                <article class="card-body mx-auto" style="max-width: 400px;">
                
                <br>
                <h5 class="text-center"><b>School name:</b> <%=rs.getString("school_name")%></h5>
                <h5 class="text-center"><b>Address:</b> <%=rs.getString("school_add")%></h5>
                <h5 class="text-center"><b>Time:</b> <%=rs.getString("school_start_time")%> to <%=rs.getString("school_end_time")%></h5>
                <h5 class="text-center"><b>Class:</b> <%=rs.getString("class")%></h5>
                <br>
                <p class="text-center"><a href="../index.jsp" class="btn btn-dark btn-block">home</a></p>
            </article>
            
            </div>
            
            </div>
            
        </div>         
                <% } 
                    con.close();
                    
                }catch(Exception e)
                {
                    System.out.println(e.getMessage());
                }
                
                %>
                
          <footer class="footer-distributed">
         <div class="footer-left">
             <p class="footer-links">
 <a href="../index.jsp">Home</a>
 ·
 <a href="../downloadPDF.jsp">Free PDF</a>
 ·
 <a href="../newsandEvents.jsp">News and Events</a>
 ·
 <a href="../contact.jsp">Contact</a>
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
