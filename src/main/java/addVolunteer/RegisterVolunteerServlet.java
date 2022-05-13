
package addVolunteer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class RegisterVolunteerServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterVolunteerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String volunteer_name = request.getParameter("volunteer_name");
            String volunteer_age = request.getParameter("volunteer_age");
            String volunteer_phone = request.getParameter("volunteer_phone");
            String volunteer_email = request.getParameter("volunteer_email");
            
            Volunteer userModel = new Volunteer(volunteer_name,volunteer_age,volunteer_phone,volunteer_email);
            UserDatabase regUser = new UserDatabase(ConnectionVolunteer.getConnection());
            if (regUser.saveUser(userModel)) {
   request.setAttribute("msg","Registration Successful, You will be notified when a new event arrives.");
                request.getRequestDispatcher("index.jsp").forward(request, response);
} else {
    String errorMessage = "User Available";
    request.setAttribute("msg",errorMessage);
    request.getRequestDispatcher("index.jsp").forward(request, response);
    }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
