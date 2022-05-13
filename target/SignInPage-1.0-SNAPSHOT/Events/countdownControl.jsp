<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Countdown Control</title>
    </head>
    <body>
        <%
            String event_id=request.getParameter("id");
            
            Connection conn = null; 
            String message = null;
            
            try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
            Statement st = conn.createStatement();
            String sqlStr = "select countdown from events where event_id ='"+event_id+"'";
            ResultSet rs = st.executeQuery(sqlStr);
            while(rs.next())
            {
                if(rs.getString("countdown").equals("Yes"))
                {
                    PreparedStatement ps = conn.prepareStatement("Update events set countdown = 'No' where event_id ='"+event_id+"'");
                    int row = ps.executeUpdate();
                    if (row > 0) {
                    request.setAttribute("msg","Countdown Deactivated");
                    request.getRequestDispatcher("manageEvents.jsp").forward(request, response);
                        }
                }
                else
                {
                    PreparedStatement ps = conn.prepareStatement("Update events set countdown = 'Yes'where event_id ='"+event_id+"'");
                    int row = ps.executeUpdate();
                    if (row > 0) {
                    request.setAttribute("msg","Countdown Activated");
                    request.getRequestDispatcher("manageEvents.jsp").forward(request, response);
                        }
                }
            }
            
            
        }catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            request.setAttribute("msg",message);
            request.getRequestDispatcher("Events/manageEvents.jsp").forward(request, response);
            ex.printStackTrace();
        }
            %>
    </body>
</html>
