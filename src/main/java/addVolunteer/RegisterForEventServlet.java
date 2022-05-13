
package addVolunteer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/regforEventServlet")
public class RegisterForEventServlet extends HttpServlet {

    
   @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String event_id=request.getParameter("event");      
        String volunteer_email = request.getParameter("volunteer_email");
        
     
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
 
            // constructs SQL statement
            PreparedStatement ps = conn.prepareStatement("insert into volunteers values(?,?)");
            ps.setString(1, volunteer_email);
            ps.setString(2, event_id);
            
            
            
 
            // sends the statement to the database server
            int row = ps.executeUpdate();
            if (row > 0) {
                request.setAttribute("msg","Thank you for registering for the event. We will look forward to see you.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
           // message = "Please Register before";
            request.setAttribute("msg",message);
            request.getRequestDispatcher("Volunteers/addVolunteer.jsp").forward(request, response);
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