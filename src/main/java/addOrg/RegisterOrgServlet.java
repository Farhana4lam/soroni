
package addOrg;

import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;


@WebServlet("/insertOrgServlet")
@MultipartConfig(maxFileSize = 16177215)
public class RegisterOrgServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

            String org_name = request.getParameter("org_name");
            String org_address = request.getParameter("org_address");
            String org_contact = request.getParameter("org_contact");
            String org_description = request.getParameter("org_description");
            
            Part filePart = request.getPart("photo");
            InputStream inputStream = null;
            if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
            Connection conn = null; // connection to the database
        String message = null;
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
            String query = "insert into organization values(?,?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1,org_name);
            pt.setString(2, org_address);
            pt.setString(3, org_contact);
            pt.setString(4, org_description);
           
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                pt.setBlob(5, inputStream);
            }
            int row = pt.executeUpdate();
            if (row > 0) {
                request.setAttribute("msg","Insert Successful");
                request.getRequestDispatcher("Organizations/manageOrg.jsp").forward(request, response);
            }
            
        }catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            request.setAttribute("msg",message);
            request.getRequestDispatcher("Organizations/manageOrg.jsp").forward(request, response);
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
            
        
    

 
