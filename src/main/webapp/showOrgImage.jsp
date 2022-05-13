<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Blob"%>
<%@ page import="java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Image</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            Blob image = null;
            Connection con = null;
            byte[ ] imgData = null ;
            Statement stmt = null;
            ResultSet rs = null;
            OutputStream o;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                stmt = con.createStatement();
                rs = stmt.executeQuery("select image from organization where org_name = '"+id+"'");
                if (rs.next()) {
                    image = rs.getBlob(1);
                    imgData = image.getBytes(1,(int)image.length());
                }
                else {
                    out.println("Display Blob Example");
                    out.println("image not found for given id>");
                return;
                }
                response.setContentType("image/jpg");
                o = response.getOutputStream();
                o.write(imgData);
                o.flush();
                o.close();
                
                } catch (Exception e) {
                out.println("Unable To Display image");
                out.println("Image Display Error=" + e.getMessage());
                return;
                } 
            %>
    </body>
</html>
