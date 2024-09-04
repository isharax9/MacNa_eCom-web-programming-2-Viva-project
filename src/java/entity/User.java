
package entity;


import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author isharaLakshitha
 */

@Entity
@Table(name = "user")
public class User implements Serializable {

    @Id
    @Column(name = "NIC",length = 12,nullable = false)
    private String NIC;

    @Column(name = "first_name",length = 10,nullable = false)
    private String first_name;

    @Column(name = "last_name",length = 45,nullable = false)
    private String last_name;
    
    @Column(name = "mobile",length = 10,nullable = false)
    private String mobile;
    
    @Column(name = "email",length = 50,nullable = false)
    private String email;
    
    @Column(name = "password",length = 45,nullable = false)
    private String password;
    
    @Column(name = "verification_code",length = 20,nullable = false)
    private String verification_code;

    public User(){
    }

    public String getNIC() {
        return NIC;
    }

    public void setNIC(String NIC) {
        this.NIC = NIC;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getVerification_code() {
        return verification_code;
    }

    public void setVerification_code(String verification_code) {
        this.verification_code = verification_code;
    }
}
