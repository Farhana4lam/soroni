<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Token</title>
    </head>
    <body>
        <%
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String token = null;
        
try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select student_token from attends where student_name='"+name+"' and student_age='"+age+"'");
        while(rs.next()){
        token =rs.getString("student_token");
            }
            if(token != null)
            {
            String messege= "Hello "+name+"! Your Token Number is "+token;
            request.setAttribute("msg",messege);
            request.getRequestDispatcher("searchToken.jsp").forward(request, response);
            
            }
            else
            {
                String messege= "Hello "+name+"! You haven't registered for any event.";
            request.setAttribute("msg",messege);
            request.getRequestDispatcher("searchToken.jsp").forward(request, response);
            
            }
 
            }catch(Exception e)
            {
            System.out.println(e.getMessage());
            }
      
        %>
    </body>
</html>
