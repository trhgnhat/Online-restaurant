
public class Product {
    
    private Integer productId;
    private String productName;
    private String productDescription;
    private Double cost;
    private Double discount;
    

    public Product() {
    }

    public Product(Integer productId, String productName, String productDescription, Double cost) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.cost = cost;
    }
    
    

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

     
}
