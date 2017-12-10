
import vn.edu.hcmiu.design.sampledesign.Customer;



public class ProductController {
    
    public Double calculateProductPrice(Product product, Customer customer){
        
        product.setDiscount(30.0);
        Double cost = product.getCost();
        Double discount = product.getDiscount();
        
        Double price = cost * 3;
        
        Integer yearOfBirth = customer.getYearOfBirth();
        
        if (yearOfBirth>2000) {
            price *= discount/100;
        }
       
        return price; 
    }
    
}
