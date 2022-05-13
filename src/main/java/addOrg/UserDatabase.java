
package addOrg;

import java.sql.*;


public class UserDatabase {
    
    Connection conn ;

    public UserDatabase(Connection con) {
        this.conn = con;
    }
    

    public boolean saveUser(Organization org){
        boolean set = false;
        try{
            String query = "insert into organization values(?,?,?,?)";
           
           PreparedStatement pt = this.conn.prepareStatement(query);
           pt.setString(1, org.getOrg_name());
           pt.setString(2, org.getOrg_address());
           pt.setString(3, org.getOrg_contact());
           pt.setString(4, org.getOrg_description());
                  
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
}
