
package addOrg;


public class Organization {
    private String org_name;
    private String org_address;
    private String org_contact;
    private String org_description;

    public Organization() {
    }
    

    public Organization(String org_name, String org_address, String org_contact, String org_description) {
        this.org_name = org_name;
        this.org_address = org_address;
        this.org_contact = org_contact;
        this.org_description = org_description;
    }

    public String getOrg_name() {
        return org_name;
    }

    public String getOrg_address() {
        return org_address;
    }

    public String getOrg_contact() {
        return org_contact;
    }

    public String getOrg_description() {
        return org_description;
    }

    public void setOrg_name(String org_name) {
        this.org_name = org_name;
    }

    public void setOrg_address(String org_address) {
        this.org_address = org_address;
    }

    public void setOrg_contact(String org_contact) {
        this.org_contact = org_contact;
    }

    public void setOrg_description(String org_description) {
        this.org_description = org_description;
    }
    
    
    
}
