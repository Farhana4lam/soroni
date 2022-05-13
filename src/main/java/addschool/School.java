/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package addschool;

/**
 *
 * @author User
 */
public class School {
    private String School_id;
    private String School_name;
    private String School_org;
    private String School_area;
    private String School_add;
    private String School_start_time;
    private String School_end_time;
    private String School_class;

    public School() {
    }

    public School(String School_id, String School_name, String School_org, String School_area, String School_add, String School_start_time, String School_end_time, String School_class) {
        this.School_id = School_id;
        this.School_name = School_name;
        this.School_org = School_org;
        this.School_area = School_area;
        this.School_add = School_add;
        this.School_start_time = School_start_time;
        this.School_end_time = School_end_time;
        this.School_class = School_class;
    }

    public String getSchool_id() {
        return School_id;
    }

    public void setSchool_id(String School_id) {
        this.School_id = School_id;
    }

    public String getSchool_name() {
        return School_name;
    }

    public void setSchool_name(String School_name) {
        this.School_name = School_name;
    }

    public String getSchool_org() {
        return School_org;
    }

    public void setSchool_org(String School_org) {
        this.School_org = School_org;
    }

    public String getSchool_area() {
        return School_area;
    }

    public void setSchool_area(String School_area) {
        this.School_area = School_area;
    }

    public String getSchool_add() {
        return School_add;
    }

    public void setSchool_add(String School_add) {
        this.School_add = School_add;
    }

    public String getSchool_start_time() {
        return School_start_time;
    }

    public void setSchool_start_time(String School_start_time) {
        this.School_start_time = School_start_time;
    }

    public String getSchool_end_time() {
        return School_end_time;
    }

    public void setSchool_end_time(String School_end_time) {
        this.School_end_time = School_end_time;
    }

    public String getSchool_class() {
        return School_class;
    }

    public void setSchool_class(String School_class) {
        this.School_class = School_class;
    }

    
    
    
}
