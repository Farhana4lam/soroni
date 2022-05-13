package siginin;

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
 
@WebServlet("/editPictureServlet")
@MultipartConfig(maxFileSize = 16177215)    
public class EditPictureServlet extends HttpServlet {
     
    // database connection settings
     
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
         
        InputStream inputStream = null; // input stream of the upload file
        String id = request.getParameter("ID");
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
 
            // constructs SQL statement
            String sql = "Update employee set image=? where employee_id="+id;
            PreparedStatement statement = conn.prepareStatement(sql);
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                request.setAttribute("msg","Your Profile Picture has been Updated Successfully");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            request.setAttribute("msg",message);
            request.getRequestDispatcher("profile.jsp").forward(request, response);
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