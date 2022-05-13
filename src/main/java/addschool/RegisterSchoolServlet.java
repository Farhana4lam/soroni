
package addschool;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterSchoolServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterSchoolServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String school_id = request.getParameter("school_id");
            String school_name = request.getParameter("school_name");
            String school_org = request.getParameter("school_org");
            String school_area = request.getParameter("school_area");
            String school_add = request.getParameter("school_add");
            String school_start_time = request.getParameter("school_start_time");
            String school_end_time = request.getParameter("school_end_time");
            String school_class = request.getParameter("school_class");
            
            
            
            
            School userModel = new School(school_id,school_name,school_org,school_area,school_add,school_start_time,school_end_time,school_class);
            
            //create a database model
UserDatabase regUser = new UserDatabase(ConnectionSchool.getConnection());
if (regUser.saveUser(userModel)) {
   request.setAttribute("msg","Insert Successful");
                request.getRequestDispatcher("Schools/manageSchool.jsp").forward(request, response);
} else {
    String errorMessage = "School Already Available";
    request.setAttribute("msg",errorMessage);
    request.getRequestDispatcher("Schools/manageSchool.jsp").forward(request, response);
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
