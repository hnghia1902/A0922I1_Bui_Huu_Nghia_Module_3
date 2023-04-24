package model.repository;

import model.book.Book;
import model.book.Catalog_book;

import java.util.List;

public interface IBookRepository {
    List<Catalog_book> showList();
    void createBook(Book book);
    Book edit(int id_edit);
    void update(Book book);
    void delete_by_id(int id);

}
