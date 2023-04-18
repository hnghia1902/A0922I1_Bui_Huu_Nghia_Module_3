package model.reponsitory.impl;

import model.Product;
import model.reponsitory.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList;
    static {
        productList = new ArrayList<>();
        productList.add(new Product(1,"abc",900,"kkk","lsd"));
        productList.add(new Product(2,"qwe",9030,"aaa","lla"));
        productList.add(new Product(3,"asd",9200,"sss","w2l"));
        productList.add(new Product(4,"zxc",2900,"ccc","hll"));
    }

    @Override
    public List<Product> display() {
        return productList;
    }

    @Override
    public void create(Product product) {
        productList.add(product);
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void editProduct(Product product) {
        productList.set(product.getId()-1, product);
    }

    @Override
    public void deleteId(Product product) {
        productList.remove(product.getId()-1);
    }

}
