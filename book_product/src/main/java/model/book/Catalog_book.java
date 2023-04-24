package model.book;

import java.sql.Date;

public class Catalog_book extends Book {
    private String catalog_name;


    public Catalog_book(int id, String name, int price, String description, Date publication_date, String catalog_name) {
        super(id, name, price, description, publication_date);
        this.catalog_name = catalog_name;
    }

    public String getCatalog_name() {
        return catalog_name;
    }

    public void setCatalog_name(String catalog_name) {
        this.catalog_name = catalog_name;
    }
}
