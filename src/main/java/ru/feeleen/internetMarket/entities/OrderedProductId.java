package ru.feeleen.internetMarket.entities;

import javax.persistence.Embeddable;
import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class OrderedProductId implements Serializable {

    private Long orderId;
    private Long productId;

    public OrderedProductId(){
    }

    public OrderedProductId(Long orderId, Long productId) {
        this.orderId = orderId;
        this.productId = productId;
    }

    public Long getCustomerOrder() {
        return orderId;
    }

    public void setCustomerOrder(Long orderId) {
        this.orderId = orderId;
    }

    public Long getProduct() {
        return productId;
    }

    public void setProduct(Long productId) {
        this.productId = productId;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        OrderedProductId that = (OrderedProductId) o;
        return Objects.equals(orderId, that.orderId) &&
                Objects.equals(productId, that.productId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(orderId, productId);
    }
}
