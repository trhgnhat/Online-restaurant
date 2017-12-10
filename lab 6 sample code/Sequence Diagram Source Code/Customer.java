
public class Customer {
    
    private Integer customerId;
    private Integer customerName;
    private Integer yearOfBirth;

    public Customer() {
    }

    public Customer(Integer customerId, Integer customerName, Integer yearOfBirth) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.yearOfBirth = yearOfBirth;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getCustomerName() {
        return customerName;
    }

    public void setCustomerName(Integer customerName) {
        this.customerName = customerName;
    }

    public Integer getYearOfBirth() {
        return yearOfBirth;
    }

    public void setYearOfBirth(Integer yearOfBirth) {
        this.yearOfBirth = yearOfBirth;
    }
    
    
    
}
