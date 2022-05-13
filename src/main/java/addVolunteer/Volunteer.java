
package addVolunteer;


public class Volunteer {
    private String volunteer_name;
    private String volunteer_age;
    private String volunteer_phone;
    private String volunteer_email;

    public Volunteer() {
    }

    public Volunteer(String volunteer_name, String volunteer_age, String volunteer_phone, String volunteer_email) {
        this.volunteer_name = volunteer_name;
        this.volunteer_age = volunteer_age;
        this.volunteer_phone = volunteer_phone;
        this.volunteer_email = volunteer_email;
    }

    public String getVolunteer_name() {
        return volunteer_name;
    }

    public String getVolunteer_age() {
        return volunteer_age;
    }

    public String getVolunteer_phone() {
        return volunteer_phone;
    }

    public String getVolunteer_email() {
        return volunteer_email;
    }

    public void setVolunteer_name(String volunteer_name) {
        this.volunteer_name = volunteer_name;
    }

    public void setVolunteer_age(String volunteer_age) {
        this.volunteer_age = volunteer_age;
    }

    public void setVolunteer_phone(String volunteer_phone) {
        this.volunteer_phone = volunteer_phone;
    }

    public void setVolunteer_email(String volunteer_email) {
        this.volunteer_email = volunteer_email;
    }
    
    
    
}
