package addOrg;

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

@WebServlet("/updateOrgServlet")
public class UpdateOrgServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String name=request.getParameter("org_name");
String address=request.getParameter("org_address");
String contact = request.getParameter("org_contact");
String description=request.getParameter("org_description");
        if(name != null)
        {
        try{
                Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
        PreparedStatement ps = con.prepareStatement("Update organization set org_address=?,org_contact=?,org_description=? where org_name = '"+name+"'");
        ps.setString(1, address);
        ps.setString(2, contact);
        ps.setString(3, description);
int i = ps.executeUpdate();
                    if (i > 0) {
                        request.setAttribute("msg","Update Successful");
                        request.getRequestDispatcher("Organizations/manageOrg.jsp").forward(request, response);
                    }
                } catch (SQLException ex) {
                    String message = "ERROR: " + ex.getMessage();
                    request.setAttribute("msg",message);
                    request.getRequestDispatcher("Organizations/manageOrg.jsp").forward(request, response);
                    ex.printStackTrace();
                }   catch (ClassNotFoundException ex) {
                        Logger.getLogger(UpdateOrgServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } 
            }
}
}