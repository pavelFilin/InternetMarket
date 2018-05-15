package ru.feeleen.internetMarket.entities;


import javax.persistence.*;

@Entity
@Table(name = "ordered_product")
public class OrderedProduct {

    @EmbeddedId
    private OrderedProductId orderedProductId = new OrderedProductId();

    @MapsId("orderId")
    @JoinColumn(name = "order_id", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Order order;

    @MapsId("productId")
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Product product;

    @Column(name = "amount")
    private int amount;


    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public OrderedProductId getOrderedProductId() {
        return orderedProductId;
    }

    public void setOrderedProductId(OrderedProductId orderedProductId) {
        this.orderedProductId = orderedProductId;
    }
}

