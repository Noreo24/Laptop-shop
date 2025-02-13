package vn.noreo.laptopshop.domain;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private double totalPrice;

    // user id
    // nhiều order 1 user
    @ManyToOne
    @JoinColumn(name = "user_id")
    /*
     * @JoinColumn(name = "user_id"): Tạo thêm 1 cột có tên là user_id trong bảng
     * orders (bảng là many) trong
     * database
     */
    private User user;

    /*
     * => Quan hệ 2 chiều (bidirectional): Đinh nghĩa ở cả 2 model là Order và
     * OrderDetail
     */
    @OneToMany(mappedBy = "order")
    List<OrderDetail> orderDetails;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Order [id=" + id + ", totalPrice=" + totalPrice + "]";
    }
}
