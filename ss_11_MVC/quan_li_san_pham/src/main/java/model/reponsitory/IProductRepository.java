package model.reponsitory;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> display();
    void create(Product product);
    List<Product> findAll();
    void editProduct(Product product);
    void deleteId(Product product);
}
