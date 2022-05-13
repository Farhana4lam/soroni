
package addStudent;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerStudentServlet")
public class RegisterStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String event_id = request.getParameter("id");
        String name=request.getParameter("student_name");
        String age=request.getParameter("student_age");
        
        Random ran=new Random();
        String token=new String();
        for(int i=1;i<=5;i++)
            {
            token+=ran.nextInt(10);
            }
        
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
 
            // constructs SQL statement
            PreparedStatement ps = conn.prepareStatement("insert into attends values(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, age);
            ps.setString(3, token);
            ps.setString(4, event_id);
            
 
            // sends the statement to the database server
            int row = ps.executeUpdate();
            if (row > 0) {
                message = "Registration Successful. Your token number is "+token;
                request.setAttribute("msg",message);
                request.getRequestDispatcher("newsandEvents.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            request.setAttribute("msg",message);
            request.getRequestDispatcher("newsandEvents.jsp").forward(request, response);
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