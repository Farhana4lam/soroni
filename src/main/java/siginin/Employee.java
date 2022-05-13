
package siginin;


public class Employee {

    
    private String emp_id;
    private String emp_name;
    private String emp_phone;
    private String emp_email;
    private String emp_pass;

    public Employee() {
    }
    
     
    public Employee(String emp_id, String emp_name, String emp_phone, String emp_email, String emp_pass) {
        this.emp_id = emp_id;
        this.emp_name = emp_name;
        this.emp_phone = emp_phone;
        this.emp_email = emp_email;
        this.emp_pass = emp_pass;
    }

    public Employee(String emp_name, String emp_phone, String emp_email, String emp_pass) {
        this.emp_name = emp_name;
        this.emp_phone = emp_phone;
        this.emp_email = emp_email;
        this.emp_pass = emp_pass;
    }

    public Employee(String emp_phone, String emp_email, String emp_pass) {
        this.emp_phone = emp_phone;
        this.emp_email = emp_email;
        this.emp_pass = emp_pass;
    }

    public Employee(String emp_email, String emp_pass) {
        this.emp_email = emp_email;
        this.emp_pass = emp_pass;
    }
    
    
    
    public String getEmp_id() {
        return emp_id;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public String getEmp_phone() {
        return emp_phone;
    }

    public String getEmp_email() {
        return emp_email;
    }

    public String getEmp_pass() {
        return emp_pass;
    }

    public void setEmp_id(String emp_id) {
        this.emp_id = emp_id;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public void setEmp_phone(String emp_phone) {
        this.emp_phone = emp_phone;
    }

    public void setEmp_email(String emp_email) {
        this.emp_email = emp_email;
    }

    public void setEmp_pass(String emp_pass) {
        this.emp_pass = emp_pass;
    }
    
    
    
    
}
