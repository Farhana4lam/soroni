
package addschool;

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

@WebServlet("/updateSchoolServlet")
public class UpdateSchoolServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String id = request.getParameter("ID");
        String name=request.getParameter("name");
        String start_time=request.getParameter("school_start_time");
        String end_time=request.getParameter("school_end_time");
        String address=request.getParameter("address");
        String area=request.getParameter("area");
        String class_no=request.getParameter("class");
        String org=request.getParameter("school_org");
        if(id != null)
        {
        try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                String sql="Update schools set schools_id=?,school_name=?,school_start_time=?,school_end_time=?,school_add=?,school_area=?,class=?,organization_org_name=? where schools_id="+id;
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1,id);
                ps.setString(2, name);
                ps.setString(3, start_time);
                ps.setString(4, end_time);
                ps.setString(5, address);
                ps.setString(6, area);
                ps.setString(7, class_no);
                ps.setString(8, org);
        int i = ps.executeUpdate();
                    if (i > 0) {
                        request.setAttribute("msg","Update Successful");
                        request.getRequestDispatcher("Schools/manageSchool.jsp").forward(request, response);
                    }
                } catch (SQLException ex) {
                    String message = "ERROR: " + ex.getMessage();
                    request.setAttribute("msg",message);
                    request.getRequestDispatcher("Schools/manageSchool.jsp").forward(request, response);
                    ex.printStackTrace();
                }   catch (ClassNotFoundException ex) {
                        Logger.getLogger(UpdateSchoolServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } 
            }
}
}