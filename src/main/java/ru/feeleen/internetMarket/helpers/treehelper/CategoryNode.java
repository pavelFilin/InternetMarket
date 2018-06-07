package ru.feeleen.internetMarket.helpers.treehelper;

import ru.feeleen.internetMarket.entities.Category;

import java.util.ArrayList;
import java.util.List;

public class CategoryNode {
    Category node;

    private List<CategoryNode> categories = new ArrayList<>();

    public Category getNode() {
        return node;
    }

    public void setNode(Category node) {
        this.node = node;
    }

    public void add(CategoryNode category) {
        categories.add(category);
    }

    public CategoryNode get(Integer index) {
        return categories.get(index);
    }

    public Integer size() {
        return categories.size();
    }

    public List<CategoryNode> getCategories() {
        return categories;
    }

}
