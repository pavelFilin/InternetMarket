package ru.feeleen.internetMarket.entities;

import javax.persistence.*;
import java.util.Objects;


@Entity
@Table(name = "cartItem")
public class CartItem {

    @EmbeddedId
    private CartItemId cartItemId = new CartItemId();

    @MapsId("cartId")
    @JoinColumn(name = "cart_id", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Cart cart;

    @MapsId("productId")
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Product product;

    @Column(name = "amount")
    private int amount;


    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
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

    public CartItemId getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(CartItemId cartItemId) {
        this.cartItemId = cartItemId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CartItem cartItem = (CartItem) o;
        return amount == cartItem.amount &&
                Objects.equals(cartItemId, cartItem.cartItemId) &&
                Objects.equals(cart, cartItem.cart) &&
                Objects.equals(product, cartItem.product);
    }

    @Override
    public int hashCode() {

        return Objects.hash(cartItemId, cart, product, amount);
    }
}
