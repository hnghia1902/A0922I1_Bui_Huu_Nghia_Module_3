package model.service.impl;

import model.Product;
import model.reponsitory.IProductRepository;
import model.reponsitory.impl.ProductRepository;
import model.service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();
    List<Product> products = new ArrayList<>();


    @Override
    public List<Product> display() {
        return productRepository.display();
    }

    @Override
    public void create(Product product) {
        productRepository.create(product);
    }

    @Override
    public Product findId(int id) {
        List<Product> productList = productRepository.findAll();

        for (int i = 0; i < productList.size(); i++) {
            if(productList.get(i).getId() == id){
                return productList.get(i);
            }
        }
        return null;
    }

    @Override
    public void editProduct(Product product) {
        productRepository.editProduct(product);
    }

    @Override
    public void deleteId(Product product) {
        productRepository.deleteId(product);
    }


}

