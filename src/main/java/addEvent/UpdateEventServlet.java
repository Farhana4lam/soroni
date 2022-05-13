package addEvent;

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



@WebServlet("/updateEventServlet")
@MultipartConfig(maxFileSize = 16177215)
public class UpdateEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String org_name=request.getParameter("event_org");
        String event_id=request.getParameter("ID");
        String event_name = request.getParameter("name");
        String event_address = request.getParameter("address");
        String event_location = request.getParameter("location");
        String event_date = request.getParameter("date");
        String event_time = request.getParameter("time");
        String event_description=request.getParameter("description");
        String countdown=request.getParameter("countdown");    
       
         
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
 
            // constructs SQL statement
            PreparedStatement ps = conn.prepareStatement("Update events set event_id=?,event_name=?,event_address=?,event_location=?,event_date=?,event_time=?,event_description=?,organization_org_name=?,countdown=? where event_id= '"+event_id+"'");
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
                request.setAttribute("msg","Update Successful");
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