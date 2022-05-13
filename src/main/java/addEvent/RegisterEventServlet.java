
package addEvent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.InternetAddress;


@WebServlet("/insertEventServlet")
@MultipartConfig(maxFileSize = 16177215)
public class RegisterEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String org_name=request.getParameter("org_name");
        String event_id=request.getParameter("event_id");
        String event_name = request.getParameter("event_name");
        String event_address = request.getParameter("event_address");
        String event_location = request.getParameter("event_location");
        String event_date = request.getParameter("event_date");
        String event_time = request.getParameter("event_time");
        String event_description=request.getParameter("event_description");
        String countdown=request.getParameter("countdown");
            
       
         
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
 
            // constructs SQL statement
            PreparedStatement ps = conn.prepareStatement("insert into events values(?,?,?,?,?,?,?,?,?)");
            ps.setString(1, event_id);
            ps.setString(2, event_name);
            ps.setString(3, event_address);
            ps.setString(4, event_location);
            ps.setString(5, event_date);
            ps.setString(6, event_time);
            ps.setString(7, event_description);
            ps.setString(8, org_name);
            ps.setString(9, countdown);
            
 
            // sends the statement to the database server
            int row = ps.executeUpdate();
            if (row > 0) {
                Statement st=conn.createStatement();
                ResultSet rs=st.executeQuery("select volunteer_email from volunteer");
                //String[] id = rs.getArray("volunteer_email");
                String[] email_id = new String[10000];
                int i =0;
                
                while(rs.next())
                {
                    email_id[i] = rs.getString("volunteer_email");
                    i++;
                }
                final String username="projectsoroni@gmail.com";
                final String password="soroni1234";
                
                Properties props=new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host","smtp.gmail.com");
                props.put("mail.smtp.port", 587);
                
                Session session1 =Session.getInstance(props,
                new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(username,password);
                }}); 
                
                try{
                Message msg=new MimeMessage(session1);
                msg.setFrom(new InternetAddress("projectsoroni@gmail.com"));
                
                    for (String email_id1 : email_id) {
                        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("" + email_id1 + ""));
                        msg.setSubject("Invitation for "+event_name+" event");
                        msg.setContent("A new Event organized by "+org_name+", "+event_name+", will be held at "+event_location+", "+event_date+", "+event_time+".<br>"
                                + "If you want to register, <a href='http://localhost:8082/Volunteers/registerForEvent.jsp'>Click Here</a>","text/html; charset=UTF-8");
                        Transport.send(msg);
                    }
                
                
             }
                catch (AddressException ex) {
                    Logger.getLogger(RegisterEventServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (MessagingException ex) {
                    Logger.getLogger(RegisterEventServlet.class.getName()).log(Level.SEVERE, null, ex);
                }

                request.setAttribute("msg","Insert Successful");
                request.getRequestDispatcher("Events/manageEvents.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            request.setAttribute("msg",message);
            request.getRequestDispatcher("Events/manageEvents.jsp").forward(request, response);
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
    }
}