
package siginin;
import java.sql.*;

public class UserDatabase {
   Connection conn ;

    public UserDatabase(Connection con) {
        this.conn = con;
    }
    
    //for register user 
    public boolean saveUser(Employee emp){
        boolean set = false;
        try{
            //Insert register data to database
            String query = "insert into employee values(?,?,?,?,?)";
           
           PreparedStatement pt = this.conn.prepareStatement(query);
           pt.setString(1, emp.getEmp_id());
           pt.setString(2, emp.getEmp_name());
           pt.setString(3, emp.getEmp_phone());
           pt.setString(4, emp.getEmp_email());
           pt.setString(5, emp.getEmp_pass());
           
           
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
    //user login
    public Employee login(String ID, String pass){
        Employee usr=null;
        try{
            String query ="select * from employee where employee_id=? and employee_pass=?";
            PreparedStatement pst = this.conn.prepareStatement(query);
            pst.setString(1, ID);
            pst.setString(2, pass);
            
            ResultSet rs = pst.executeQuery();
            
            if(rs.next()){
                usr = new Employee();
                usr.setEmp_id(rs.getString("employee_id"));
                usr.setEmp_name(rs.getString("employee_name"));
                usr.setEmp_phone(rs.getString("employee_phone"));
                usr.setEmp_email(rs.getString("employee_email"));
                 usr.setEmp_pass(rs.getString("employee_pass"));
                
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return usr;
    }
    
    public  Employee FindUserPassword(String emp_id) {
    
    //Connection con;
    Employee user = null;
    try {
            
      PreparedStatement stmt = this.conn.prepareStatement("Select employee_password from employee where employee_email=?");
      stmt.setString(1, emp_id);
      ResultSet rs = stmt.executeQuery();
      if (rs.next()) {
        user = new Employee();
        
        user.setEmp_pass(rs.getString("employee_password"));
      }
    } catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
    return user;
    
  }

}

