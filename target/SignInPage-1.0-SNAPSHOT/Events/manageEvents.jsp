<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="siginin.Employee"%>
<% Employee user = (Employee) session.getAttribute("login");%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <title>Events</title>
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
                            <a href="../index.jsp" class="nav-item nav-link active"><b>Home</b></a> <!--li because it is a menu-->
                            <a href="../downloadPDF.jsp" class="nav-item nav-link"><b>Free PDF</b></a>
                            <a href="../newsandEvents.jsp" class="nav-item nav-link"><b>News and Events</b></a>
                            <a href="../Students/searchToken.jsp" class="nav-item nav-link"><b>What is my token number?</b></a>
                            <a href="../Volunteers/addVolunteer.jsp" class="nav-item nav-link"><b>Register to be a Volunteer</b></a>
                            <a href="../Exam/mcqExam.jsp" class="nav-item nav-link"><b>MCQ Exam</b></a>
                            </div>
                            <div class="navbar-nav ml-auto">
                                <a href="../login.jsp" class="nav-item nav-link"><b>Login</b></a>
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
                            <a href="../profile.jsp" class="nav-item nav-link active"><b>Profile, <%= user.getEmp_name() %></b></a>
                            <a href="../LogoutServletPage" class="nav-item nav-link"><b>LogOut</b></a>
                            </div>
                                <% } %>
                         </div>
                    </nav>
           </div>
             <div class="container">
                 
             <a href="addEvents.jsp" class="btn btn-danger"><i class="fa fa-plus"> Add New Event</i></a>
            <div class="main">
                 <div class="form-group has-search">
                     <span class="fa fa-search form-control-feedback"></span>
          <input id="gfg" type="text" placeholder="Search for Event Information"  class="form-control">
          </div>
          </div>
          <div class="table-responsive">
        <table class="table table-hover">
        <thead class="thead">
            <tr>
            <th scope="col">Serial</th>
            <th scope="col">Event ID</th>
            <th scope="col">Name</th>
            <th scope="col">Address</th>
            <th scope="col">Location</th>
            <th scope="col">Date</th>
            <th scope="col">Time</th>
            <th scope="col">Organization</th>
            <th scope="col">Description</th>
            <th scope="col">Student List</th>
            <th scope="col">Volunteer List</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>
            <th scope="col">Countdown</th>
            </tr>
        </thead>
        <tbody id="search">
        <%
                try{
                    //establish a connection with the database
                    int index = 1;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                    Statement st = con.createStatement();
                   
                 
                    String sqlStr = "select * from events";
                    ResultSet rs = st.executeQuery(sqlStr);
                    while(rs.next()) //loop will continue until it gets all the value
                    {
                    %>
                   
                    <tr>
                        <th scope="row"><%=index++%></th>
                        <td><%=rs.getString("event_id")%></td>
                        <td><%=rs.getString("event_name")%></td>
                        <td><%=rs.getString("event_address")%></td>
                        <td><%=rs.getString("event_location")%></td>
                        <td><%=rs.getString("event_date")%></td>
                        <td><%=rs.getString("event_time")%></td>
                        <td><a href="../Organizations/orgDetails.jsp?id=<%=rs.getString("organization_org_name")%>" class="btn btn-dark"><i class="fa fa-eye"> <%=rs.getString("organization_org_name")%></i></a></td>
                        <td><%=rs.getString("event_description")%></td>
                        <td><a href="../Students/studentList.jsp?id=<%=rs.getString("event_id")%>" class="btn btn-dark"><i class="fa fa-list"></i></a></td>
                        <td><a href="../Volunteers/volunteerList.jsp?id=<%=rs.getString("event_id")%>" class="btn btn-dark"><i class="fa fa-list"></i></a></td>
                        <td><a href="updateEvents.jsp?id=<%=rs.getString("event_id")%>" class="btn btn-dark"><i class="fa fa-edit"></i></a></td>
                        <td><a href="deleteEventsConfirmation.jsp?id=<%=rs.getString("event_id")%>" class="btn btn-danger"><i class="fa fa-trash"></i></a></td>
                        <%
                            if(rs.getString("countdown").equals("Yes"))
                            {%>
                            <td><a href="countdownControl.jsp?id=<%=rs.getString("event_id")%>" class="btn btn-danger"><i class="fa fa-calendar-times-o"> Deactivate</i></a></td>
                           <% 
                        }
                            else
                            {%>
                            <td><a href="countdownControl.jsp?id=<%=rs.getString("event_id")%>" class="btn btn-dark"><i class="fa fa-calendar-check-o"> Activate</i></a></td>  
                            <%
                            }
                            %>
                    </tr>
                      
                <% } 
                    con.close();
                    
                }catch(Exception e)
                {
                    System.out.println(e.getMessage());
                }
                
                %>
                </tbody>
</table>
                <script>
               $(document).ready(function() {
                $("#gfg").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#search tr").filter(function() {
                        $(this).toggle($(this).text()
                        .toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
                <div class ="row">
                       <div class="column">
                           <center>
                           <p class = "update_msg"><%= request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%> </p>
                           </center>
                       </div>
                   </div>
                
                </div>
                           <p><a href="../profile.jsp">Back</a></p>
        </div>
                       
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
