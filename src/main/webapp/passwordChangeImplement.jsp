<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>

<%@page import="siginin.*"%>
<%@page import="siginin.Employee"%>
<% Employee user = (Employee) session.getAttribute("login");

String currentPassword=request.getParameter("current_password");
String Newpass=request.getParameter("new_password");
String conpass=request.getParameter("confirm_password");
String user_id = user.getEmp_id();

String pass="";
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select employee_pass from employee where employee_id='"+user_id+"'");
    while(rs.next()){
            pass=rs.getString("employee_pass");
} 
pass = CryptoUtil.decode(pass);
if(pass.equals(currentPassword)){
    if(Newpass.equals(conpass))
    {
        Newpass = CryptoUtil.encode(Newpass);
        Statement st1=con.createStatement();
        int i = st1.executeUpdate("update employee set employee_pass='"+Newpass+"' where employee_id='"+user_id+"'");
        if (i > 0) {
                    request.setAttribute("msg","Password changed successfully");
                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                    st1.close();
                    con.close();
                        }
        
        
        
    } 
    else
    {
    request.setAttribute("msg","Password Does not Match, Try again.");
                    request.getRequestDispatcher("changePassword.jsp").forward(request, response);

    }
    
 }
    else{
         request.setAttribute("msg","Invalid Password");
                    request.getRequestDispatcher("changePassword.jsp").forward(request, response);
}

    }
    catch(Exception e){
out.println(e);
}
%>
