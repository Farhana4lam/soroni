<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="java.util.*" %>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session" %>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="siginin.*"%>

<%@ page language="java" import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Reply</title>
        <link href="../img/book.png" rel="shortcut icon">
    </head>
    <body>
        <%
        String email = request.getParameter("email");
        String msg = request.getParameter("message");
        
        final String username="projectsoroni@gmail.com";
        final String password="soroni1234";
        
        Properties props=new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host","smtp.gmail.com");
        props.put("mail.smtp.port", 587);
        
        Session session1 =Session.getInstance(props,
        new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication(username,password);
        }}); 

        try{
            Message message=new MimeMessage(session1);
            message.setFrom(new InternetAddress("projectsoroni@gmail.com"));
            message.setRecipients( Message.RecipientType.TO,InternetAddress.parse(""+email+""));
            message.setSubject("Reply from Soroni");
            message.setContent(msg,"text/html; charset=UTF-8");
            Transport.send(message);
            request.setAttribute("msg","Reply sent!");
            request.getRequestDispatcher("messageList.jsp").forward(request, response);
            }catch(MessagingException e)
                {
                  String err = "ERROR: " + e.getMessage();
            request.setAttribute("msg",err);
            request.getRequestDispatcher("messageList.jsp").forward(request, response);
                    out.println(e);
                }
        
        %>
    </body>
</html>
