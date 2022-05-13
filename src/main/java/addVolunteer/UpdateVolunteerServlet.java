
package addVolunteer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateVolunteerServlet")
public class UpdateVolunteerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String volunteer_name = request.getParameter("volunteer_name");
        String volunteer_age=request.getParameter("volunteer_age");
        String volunteer_phone=request.getParameter("volunteer_phone");
        String volunteer_email=request.getParameter("volunteer_email");
        if(volunteer_email != null)
        {
        try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                String sql="Update volunteer set volunteer_name=?,volunteer_age=?,volunteer_phone=?,volunteer_email=? where volunteer_email= '"+volunteer_email+"'";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1,volunteer_name);
                ps.setString(2, volunteer_age);
                ps.setString(3, volunteer_phone);
                ps.setString(4, volunteer_email);
        int i = ps.executeUpdate();
                    if (i > 0) {
                        request.setAttribute("msg","Update Successful");
                        request.getRequestDispatcher("Volunteers/manageVolunteer.jsp").forward(request, response);
                    }
                } catch (SQLException ex) {
                    String message = "ERROR: " + ex.getMessage();
                    request.setAttribute("msg",message);
                    request.getRequestDispatcher("Volunteers/manageVolunteer.jsp").forward(request, response);
                    ex.printStackTrace();
                }   catch (ClassNotFoundException ex) {
                        Logger.getLogger(UpdateVolunteerServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } 
            }
    }
}