
package addVolunteer;
import java.sql.*;


public class UserDatabase {
    
    Connection conn ;

    public UserDatabase(Connection con) {
        this.conn = con;
    }
    
    public boolean saveUser(Volunteer vol){
        boolean set = false;
        try{
            String query = "insert into volunteer values(?,?,?,?)";
            PreparedStatement pt = this.conn.prepareStatement(query);
            pt.setString(1, vol.getVolunteer_name());
            pt.setString(2, vol.getVolunteer_age());
            pt.setString(3, vol.getVolunteer_phone());
            pt.setString(4, vol.getVolunteer_email());
            
            pt.executeUpdate();
           set = true;
     
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
    
}
