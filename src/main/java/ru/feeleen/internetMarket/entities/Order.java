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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", insertable = false, updatable = false, nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,
            targetEntity = OrderedProduct.class, mappedBy = "order")
    private Set<OrderedProduct> orderedProducts = new HashSet<>();


    @Column(name = "products_prise", nullable = false)
    private int productsPrise;

    @Column(name = "date_created", nullable = false)
    @Temporal(TIMESTAMP)
    private Date dateCreated;

    @Column(name = "execution_tage", nullable = false)
    private String executionStage;


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

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getExecutionStage() {
        return executionStage;
    }

    public void setExecutionStage(String executionStage) {
        this.executionStage = executionStage;
    }
}
