
package addExam;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class addExamServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addExamServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String class_no=request.getParameter("class");
            String subject=request.getParameter("subject");
            String ques_no=request.getParameter("ques_no");
            String ques_name=request.getParameter("ques_name");
            String op1=request.getParameter("op1");
            String op2=request.getParameter("op2");
            String op3=request.getParameter("op3");
            String op4=request.getParameter("op4");
            String correct_ans=request.getParameter("correct_ans");
            String exam_id = "class"+class_no+subject+ques_no;
            
            Connection conn = null; 
            String message = null;
            
            try{
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectsoroni","root","");
                PreparedStatement ps = conn.prepareStatement("insert into exam values(?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, exam_id);
                ps.setString(2, class_no);
                ps.setString(3, subject);
                ps.setString(4, ques_no);
                ps.setString(5, ques_name);
                ps.setString(6, op1);
                ps.setString(7, op2);
                ps.setString(8, op3);
                ps.setString(9, op4);
                ps.setString(10, correct_ans);
                
                 int row = ps.executeUpdate();
            if (row > 0){
                request.setAttribute("msg","Question Added!");
                request.getRequestDispatcher("Exam/addExam.jsp").forward(request, response);
            }
            }catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            request.setAttribute("msg",message);
            request.getRequestDispatcher("Exam/addExam.jsp").forward(request, response);
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
