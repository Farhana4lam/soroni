/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package addschool;

import java.sql.*;
/**
 *
 * @author User
 */
public class UserDatabase {
   Connection conn ;

    public UserDatabase(Connection con) {
        this.conn = con;
    }
    

    public boolean saveUser(School scl){
        boolean set = false;
        try{
            String query = "insert into schools(schools_id,school_name,school_start_time,school_end_time,school_add,school_area,class,organization_org_name) values(?,?,?,?,?,?,?,?)";
           
           PreparedStatement pt = this.conn.prepareStatement(query);
           pt.setString(1, scl.getSchool_id());
           pt.setString(2, scl.getSchool_name());
           pt.setString(3, scl.getSchool_start_time());
           pt.setString(4, scl.getSchool_end_time());
           pt.setString(5, scl.getSchool_add());
           pt.setString(6, scl.getSchool_area());
           pt.setString(7, scl.getSchool_class());
           pt.setString(8, scl.getSchool_org());
                   
           pt.executeUpdate();
           set = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return set;
    }
}
