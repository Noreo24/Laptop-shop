package vn.noreo.laptopshop.domain;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank(message = "Không được để trống tên sản phẩm")
    private String name;

    @DecimalMin(value = "0.01", inclusive = true, message = "Giá phải lớn hơn 0")
    private double price;
    private String image;

    @NotBlank(message = "Không được để trống miêu tả chi tiết")
    @Column(columnDefinition = "MEDIUMTEXT")
    private String detailDesc;

    @NotBlank(message = "Không được để trống miêu tả ngắn gọn")
    private String shortDesc;

    @Min(value = 1, message = "Số lượng phải lớn hơn 0")
    private long quantity;
    private long sold;
    private String factory;
    private String target;

    /*
     * - Không cần @OneToMany ngược lại vì không cần biết 1 sản phẩm xuất hiện trong
     * bao nhiêu OrderDetails
     * => Quan hệ 1 chiều (unidirectional): Đinh nghĩa chỉ ở 1 model là OrderDetail,
     * không cần phải định nghĩa bên Product
     */
    @OneToMany(mappedBy = "product")
    List<OrderDetail> orderDetails;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDetailDesc() {
        return detailDesc;
    }

    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }

    public String getShortDesc() {
        return shortDesc;
    }

    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public long getSold() {
        return sold;
    }

    public void setSold(long sold) {
        this.sold = sold;
    }

    public String getFactory() {
        return factory;
    }

    public void setFactory(String factory) {
        this.factory = factory;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price + ", image=" + image + ", detailDesc="
                + detailDesc + ", shortDesc=" + shortDesc + ", quantity=" + quantity + ", sold=" + sold + ", factory="
                + factory + ", target=" + target + "]";
    }
}
