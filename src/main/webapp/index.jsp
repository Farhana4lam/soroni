<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="siginin.Employee"%>
<% Employee user = (Employee) session.getAttribute("login");%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .ml10 {
  position: relative;
  font-weight: 600;
  font-size: 4em;
}

.ml10 .text-wrapper {
  position: relative;
  display: inline-block;
  padding-top: 0.1em;
  padding-right: 0.05em;
  padding-bottom: 0.1em;
  overflow: hidden;
}

.ml10 .letter {
  display: inline-block;
  line-height: 1em;
  transform-origin: 0 0;
}
        </style>
        
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Soroni</title>
        <link href="img/book.png" rel="shortcut icon">
        <link href="css/index-style.css" rel="stylesheet" type="text/css">
        <link href="css/footer-style.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">  
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.0.2/anime.min.js"></script>
        
        
        

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
                            <a href="#" class="nav-item nav-link active"><b>Home</b></a> <!--li because it is a menu-->
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
                                <a href="#" class="nav-item nav-link active"><b>Home</b></a> 
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
                        
            
    <center>
        
     <p class = "update_msg text-center"><%= request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%> </p>
     
     <br>
                       
                       <%
                                String date = "";
                                String time = "";
                                String dateandtime = "";
                                try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                                Statement st = con.createStatement();
                                String sqlStr = "select * from events";
                                ResultSet rs = st.executeQuery(sqlStr);
                                while(rs.next()) 
                                {
                                    if(rs.getString("countdown").equals("Yes"))
                                    {
                                        date = rs.getString("event_date");
                                        time = rs.getString("event_time");
                                        dateandtime = date+" "+time;
                                    %>
                                    <div class="container-lg border">
                                        
                                        <h3>Event <a href="Students/registerStudents.jsp?id=<%=rs.getString("event_id")%>"><%=rs.getString("event_name")%></a> starts in</h3>
                                    <div id="clockdiv">
                                    <div>
                                      <span class="days" id="day"></span>
                                      <div class="smalltext">Days</div>
                                    </div>
                                    <div>
                                      <span class="hours" id="hour"></span>
                                      <div class="smalltext">Hours</div>
                                    </div>
                                    <div>
                                      <span class="minutes" id="minute"></span>
                                      <div class="smalltext">Minutes</div>
                                    </div>
                                    <div>
                                      <span class="seconds" id="second"></span>
                                      <div class="smalltext">Seconds</div>
                                    </div>
                                  </div>
                                  
                                 <p id="demo"></p>
                                 <%
                                }
                                 
                                    }
                                }catch(Exception e)
                                    {
                                        System.out.println(e.getMessage());                                   
                                    }
                                    %>
           <script>
    var deadline = new Date("<%=dateandtime%>").getTime();
    var x = setInterval(function() {
    var now = new Date().getTime();
var t = deadline - now;
var days = Math.floor(t / (1000 * 60 * 60 * 24));
var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60));
var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
var seconds = Math.floor((t % (1000 * 60)) / 1000);
document.getElementById("day").innerHTML =days ;
document.getElementById("hour").innerHTML =hours;
document.getElementById("minute").innerHTML = minutes; 
document.getElementById("second").innerHTML =seconds; 
    if (t < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "Event Sarted";
        document.getElementById("day").innerHTML ='0';
        document.getElementById("hour").innerHTML ='0';
        document.getElementById("minute").innerHTML ='0' ; 
        document.getElementById("second").innerHTML = '0'; 
        }
    }, 1000);
 

</script>
</div>
    <br>
    
    <div class="container-sm">
        
     <h1 class="ml10">
  <span class="text-wrapper">
    <span class="letters">Search For Schools</span>
  </span>
</h1>
        
        <script>
            var textWrapper = document.querySelector('.ml10 .letters');
textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

anime.timeline()
  .add({
    targets: '.ml10 .letter',
    rotateY: [-90, 0],
    duration: 1300,
    delay: (el, i) => 45 * i
  });
        </script>       
            
        <h5>Enter your Location and Suitable time<br>Find the perfect School for You!</h5>
        
        
         <div class="box">
                    <form action="searchSchool.jsp" method="post">
                        <br>
                            <select name="area" required>
                                <option>Location</option>
                            
                            <%
                                try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                                Statement st = con.createStatement();
                                String sqlStr = "select distinct school_area from schools";
                                ResultSet rs = st.executeQuery(sqlStr);
                                while(rs.next()) 
                                {
                                %>
                                <option value="<%=rs.getString("school_area")%>"><%=rs.getString("school_area")%></option>
                                
                            <%}
                                
                                }catch(Exception e)
                                    {
                                        System.out.println(e.getMessage());                                   
                                    }
                                %>
                                                      
                            </select>
                                <select name="time" required>
                                <option>Time</option>
                            
                            <%
                                try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                                Statement st = con.createStatement();
                                String sqlStr = "select distinct school_start_time from schools";
                                ResultSet rs = st.executeQuery(sqlStr);
                                while(rs.next()) 
                                {
                                %>
                                <option value="<%=rs.getString("school_start_time")%>"><%=rs.getString("school_start_time")%></option>
                                
                            <%}
                                
                                }catch(Exception e)
                                    {
                                        System.out.println(e.getMessage());                                   
                                    }
                                %>
                                                      
                            </select>
                                <br><br>
                                <input type="submit" value="Search">  
                         
                    </form>
                </div>                   
              </div>
        </center>
  
    <br>
    <div class="container">
        <h1 style="color: #35394c;">Organizations</h1>
        <div class="card-columns">
            <%
                try{
                Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                    Statement st = con.createStatement();
                    String sqlStr = "select org_name from organization";
                    ResultSet rs = st.executeQuery(sqlStr);
                    while(rs.next())
                    {
                    %>
                    <div class="card" style="background-color: #c1ffb3;">
                          <div class="card-body">
                              <img class="card-img-top img-thumbnail mx-auto d-block img-responsive" src="showOrgImage.jsp?id=<%=rs.getString("org_name")%>" alt="Card image" style="width:100%">
                              <p class="card-text"><%=rs.getString("org_name")%></p>
                              <a href="organizationDetails.jsp?id=<%=rs.getString("org_name")%>" class="btn btn-block btn-success stretched-link">Details</a>
                          </div>
                    </div>
                    <%
                }
                
                }catch(Exception e)
                {
                 System.out.println(e.getMessage());   
                }
                %>
            
        </div>
    </div>
    
    
    <div class="container-md">
    <h1 style="color: #35394c;">About This Project</h1>
    <p>
            “Soroni” is a platform focusing on Children Education.As we know, there are a lots of NGO is working for the children who are not able to study in a normal school at a normal time period.  
            “Soroni” is a platform providing all the data of those NGOs who are working to develop child education. 
            Firstly, there are many NGO but still many children can’t join them. 
            Because, separate platform has separate time periods. 
            “Soroni” is here to make them all together. 
            A willing student just have to enter their location, and available time; and “Soroni” will show them the nearest NGO.
            Secondly, some students drop out because of less study materials. 
            “Soroni” is the platform where the students not only can get the opportunity of learning, but also the study material providing events will show up. 
            </p>
            <br>
            <p>
              One of the main purposes of this website is to encourage and facilitate learning so that all the children can get educated.
              Many students give up their study because they have to work for their livings in the school time, and they don’t get opportunity to know the timings of NGO schools as well. 
              They are the future of Bangladesh. 
              And for the lack of opportunity and proper guidelines they remain illiterate. 
              Soroni is the place to give them a chance to learn on their free time from any nearest NGO schools.
            </p>
            <br>
            <p>
               Here they can sign in so easily and get details of their nearer NGO. 
               Again they can get any PDF books by only entering their desired class name. 
               We are building this web application for them so that their time will not be wasted and also they can learn and gain knowledge.
            </p>
            <br>
            <p>
                These students can also be able to get to know about the upcoming events. 
                By joining this events they can get necessary study materials likewise pen, pencil, writing book. 
                This way they can get motivated towards study.
            </p>
            <br>
            <p>
                It is an open platform, anybody can enter. 
                No sign in password would be needed. 
                And this platform will help the NGO to engage many students as well.
            </p>
    </div>
    
    
                               
     <footer class="footer-distributed">
         <div class="footer-left">
             <p class="footer-links">
 <a href="#">Home</a>
 ·
 <a href="downloadPDF.jsp">Free PDF</a>
 ·
 <a href="newsandEvents.jsp">News and Events</a>
 ·
 <a href="contact.jsp">Contact</a>
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