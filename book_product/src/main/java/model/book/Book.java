package model.book;

import java.sql.Date;

public class Book {
    private int id;
    private String name;
    private int price;
    private String description;
    private Date publication_date;
    private int catalog_id;

    public Book() {
    }

    public Book(String name, int price, String description, Date publication_date, int catalog_id) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.publication_date = publication_date;
        this.catalog_id = catalog_id;
    }

    public Book(int id, String name, int price, String description, Date publication_date, int catalog_id) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.publication_date = publication_date;
        this.catalog_id = catalog_id;
    }

    public Book(int id, String name, int price, String description, Date publication_date) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.publication_date = publication_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getPublication_date() {
        return publication_date;
    }

    public void setPublication_date(Date publication_date) {
        this.publication_date = publication_date;
    }

    public int getCatalog_id() {
        return catalog_id;
    }

    public void setCatalog_id(int catalog_id) {
        this.catalog_id = catalog_id;
    }
}
