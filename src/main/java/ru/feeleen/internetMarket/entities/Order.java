package ru.feeleen.internetMarket.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import static javax.persistence.TemporalType.TIMESTAMP;

@Entity
@Table(name = "order_table")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    private User user;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,
            targetEntity = OrderedProduct.class, mappedBy = "order")
    private Set<OrderedProduct> orderedProducts = new HashSet<>();


    @Column(name = "products_prise", nullable = false)
    private int productsPrise;

//    @Column(name = "date_created", nullable = false)
//    @Temporal(TIMESTAMP)
//    private Date dateCreated;

    @Column(name="address")
    private String address;

    @Column(name="phone")
    private String phone;

    @Enumerated(EnumType.STRING)
    private ExecutionStage executionStage;

    public Order() {
    }

    public Order(User user, Set<OrderedProduct> orderedProducts, int productsPrise, String address, String phone, ExecutionStage executionStage) {
        this.user = user;
        this.orderedProducts = orderedProducts;
        this.productsPrise = productsPrise;
        this.address = address;
        this.phone = phone;
        this.executionStage = executionStage;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUserAccount() {
        return user;
    }

    public void setUserAccount(User userAccount) {
        this.user = userAccount;
    }

    public Set<OrderedProduct> getOrderedProducts() {
        return orderedProducts;
    }

    public void setOrderedProducts(Set<OrderedProduct> orderedProducts) {
        this.orderedProducts = orderedProducts;
    }

    public int getProductsPrise() {
        return productsPrise;
    }

    public void setProductsPrise(int productsPrise) {
        this.productsPrise = productsPrise;
    }

//    public Date getDateCreated() {
//        return dateCreated;
//    }
//
//    public void setDateCreated(Date dateCreated) {
//        this.dateCreated = dateCreated;
//    }


    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ExecutionStage getExecutionStage() {
        return executionStage;
    }

    public void setExecutionStage(ExecutionStage executionStage) {
        this.executionStage = executionStage;
    }
}
