package model.service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> display();
    void create(Product product);
    Product findId(int id);
    void editProduct(Product product);
    void deleteId(Product product);

}
