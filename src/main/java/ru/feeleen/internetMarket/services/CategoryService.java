package ru.feeleen.internetMarket.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.feeleen.internetMarket.entities.Category;
import ru.feeleen.internetMarket.repositories.CategoryRepository;
import ru.feeleen.internetMarket.helpers.treehelper.CategoryNode;

import java.util.LinkedList;
import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    public void saveCategory(String title, String parent) {
        if (parent != null && parent != "NONE" && !parent.isEmpty()) {
            Category parentCategory = categoryRepository.findByTitle(parent);
            Category category = new Category(title, parentCategory);
            categoryRepository.save(category);

        } else {
            Category category = new Category();
            category.setTitle(title);
            categoryRepository.save(category);
        }
    }

    public List<CategoryNode> getTreeCategories() {
        List<Category> categoriesDB = (List<Category>) categoryRepository.findAll();
        List<CategoryNode> resultTreeOfCategories = new LinkedList();
        for (int i = 0; i < categoriesDB.size(); i++) {
            if (categoriesDB.get(i).getParent() == null) {
                CategoryNode categoryNode = new CategoryNode();
                categoryNode.setNode(categoriesDB.get(i));
                resultTreeOfCategories.add(categoryNode);
                categoriesDB.remove(i);
                i--;
            }
        }

        while (!categoriesDB.isEmpty()) {
            int index = 0;
            for (int i = 0; i < resultTreeOfCategories.size(); i++) {
                if (categoriesDB.size()>index && goToTree(resultTreeOfCategories.get(i), categoriesDB.get(index))) {
                    categoriesDB.remove(index);
                }
            }

            index = (categoriesDB.size() - 1 == index) ? 0 : index++;
        }
        return resultTreeOfCategories;
    }

    private boolean goToTree(CategoryNode node, Category category) {
        if (node == null) return false;
        if (node.getNode().getTitle() == category.getParent().getTitle()) {
            CategoryNode childNode = new CategoryNode();
            childNode.setNode(category);
            node.add(childNode);
            return true;
        }

        for (int i = 0; i < node.size(); i++) {
            if (goToTree(node.get(i), category)) {
                return true;
            }
        }

        return false;
    }

    public List<Category> findAll(){
        return (List<Category>) categoryRepository.findAll();
    }

    public List<Category> getSubCategories(Category category) {
        return categoryRepository.findByParent(category);
    }

    private boolean findCategoryInList(List<Category> list, Category category) {
        for (Category cate : list) {
            if (list.contains(cate)) {
                return true;
            }
        }

        return false;
    }



}