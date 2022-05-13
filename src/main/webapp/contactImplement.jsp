<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <link href="img/book.png" rel="shortcut icon">
    </head>
    <body>
        <%
            String name=request.getParameter("name");
            String phone=request.getParameter("phone");
            String email=request.getParameter("email");
            String message=request.getParameter("message");
            
            Connection conn = null; 
            
            try{
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                PreparedStatement ps = conn.prepareStatement("insert into contact values(?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setString(4, message);
                
                int row = ps.executeUpdate();
            if (row > 0){
                request.setAttribute("msg","Message sent! Our team will get to you in a moment.");
                request.getRequestDispatcher("contact.jsp").forward(request, response);
            }
            }catch (SQLException ex) {
            String msg = "ERROR: " + ex.getMessage();
            request.setAttribute("msg",msg);
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            
        }
            
            %>
    </body>
</html>
