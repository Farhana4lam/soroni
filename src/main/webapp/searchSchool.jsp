<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="siginin.Employee"%>
<% Employee user = (Employee) session.getAttribute("login");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Schools</title>
        <link href="img/book.png" rel="shortcut icon">
        <link href="css/form-style.css" rel="stylesheet" type="text/css">
        <link href="css/footer-style.css" rel="stylesheet" type="text/css">
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
                        <a href="index.jsp" class="navbar-brand">
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
                                <a href="index.jsp" class="nav-item nav-link active"><b>Home</b></a> 
                           <a href="downloadPDF.jsp" class="nav-item nav-link"><b>Free PDF</b></a>
                            <a href="newsandEvents.jsp" class="nav-item nav-link"><b>News and Events</b></a>
                            <a href="Students/searchToken.jsp" class="nav-item nav-link"><b>What is my token number?</b></a>
                            <a href="Volunteers/addVolunteer.jsp" class="nav-item nav-link"><b>Register to be a Volunteer</b></a>
                            <a href="Exam/mcqExam.jsp" class="nav-item nav-link"><b>MCQ Exam</b></a> 
                            <a href="profile.jsp" class="nav-item nav-link"><b>Profile, <%= user.getEmp_name() %></b></a>
                            <a href="LogoutServletPage" class="nav-item nav-link"><b>LogOut</b></a>
                            </div>
                                <% } %>
                         </div>
                    </nav>
           </div>
        
        

        <div class="container-sm">
            
        
  
            <%
                try{
                    //establish a connection with the database
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                    Statement st = con.createStatement();
                   
                    //get input from the index
                    String location = request.getParameter("area");
                    String start_time = request.getParameter("time");
                    String sqlStr = "select * from schools where school_area = '"+location+"' and school_start_time = '"+start_time+"'";
                    ResultSet rs = st.executeQuery(sqlStr);
                    int index = 1;
                    %>
                    <h1 style="color: red;">Available Schools at <%=location%>, <%=start_time%></h1>
                    <div class="card-columns">
                    <%
                    while(rs.next()) //loop will continue until it gets all the value
                    {
                    %>                
                    <div class="card" style="background-color: #ffe6eb;">
                          <div class="card-body">
                              <img class="card-img-top img-thumbnail mx-auto d-block img-responsive" src="showOrgImage.jsp?id=<%=rs.getString("organization_org_name")%>" alt="Card image" style="width:100%">
                              <p class="card-text"><b style="color: red;">School Name: </b><%=rs.getString("school_name")%></p>
                              <p class="card-text"><b style="color: red;">Class: </b><%=rs.getString("class")%></p>
                              <p class="card-text"><b style="color: red;">Time: </b><%=rs.getString("school_start_time")%> to <%=rs.getString("school_end_time")%></p>
                              <p class="card-text"><b style="color: red;">Address: </b><%=rs.getString("school_add")%></p>
                              <p class="card-text"><b style="color: red;">Organized By: </b><%=rs.getString("organization_org_name")%></p>
                        
                        </div>
                    </div>
                                          
                <% } 
                    
                }catch(Exception e)
                {
                    System.out.println(e.getMessage());
                }
                
                %>
               
                </div>
                </div>
                
        <div class="container-sm">
                    <%
                try{
                    //establish a connection with the database
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                    Statement st = con.createStatement();
                   
                    //get input from the index
                    String location = request.getParameter("area");
                    String sqlStr = "select * from events where event_location = '"+location+"'";
                    ResultSet rs = st.executeQuery(sqlStr);
                    int index = 1;
                    %>
                    <h1 style="color: red;">Available Events at <%=location%></h1>
                    <div class="card-columns">
                    <%
                    while(rs.next()) //loop will continue until it gets all the value
                    {
                    %>                
                    <div class="card" style="background-color: #c1ffb3;">
                          <div class="card-body">
                        
                              <p class="card-text"><b style="color: red;">Event name:</b> <%=rs.getString("event_name")%></p>
                              <p class="card-text"><b style="color: red;">Address:</b> <%=rs.getString("event_address")%></p>
                              <p class="card-text"><b style="color: red;">Location:</b> <%=rs.getString("event_location")%></p>
                              <p class="card-text"><b style="color: red;">Date:</b> <%=rs.getString("event_date")%></p>
                              <p class="card-text"><b style="color: red;">Time:</b> <%=rs.getString("event_time")%></p>
                              <p class="card-text"><b style="color: red;">Organized By:</b> <%=rs.getString("organization_org_name")%></p>
                              <p class="card-text"><b style="color: red;">Description:</b> <%=rs.getString("event_description")%></p>
                              <a href="Students/registerStudents.jsp?id=<%=rs.getString("event_id")%>" class="btn btn-block btn-success"><i class="fa fa-plus"> Register</i></a>
                        
                        </div>
                    </div>
                                          
                <% } 
                    
                }catch(Exception e)
                {
                    System.out.println(e.getMessage());
                }
                
                %>
                    
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