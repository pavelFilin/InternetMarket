package ru.feeleen.internetMarket.json;

public class CartJson {
    private Integer totalPrice;
    private Integer totalItems;

    public CartJson(Integer totalItems, Integer totalPrice) {
        this.totalPrice = totalPrice;
        this.totalItems = totalItems;
    }

    public Integer getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Integer totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getTotalItems() {
        return totalItems;
    }

    public void setTotalItems(Integer totalItems) {
        this.totalItems = totalItems;
    }
}
