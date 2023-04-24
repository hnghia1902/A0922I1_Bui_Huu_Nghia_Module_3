package model.service.impl;

import model.book.Book;
import model.book.Catalog_book;
import model.repository.IBookRepository;
import model.repository.impl.BookRepository;
import model.service.IBookService;

import java.util.List;

public class BookService implements IBookService {
    IBookRepository bookRepository = new BookRepository();

    @Override
    public List<Catalog_book> showList() {
        return bookRepository.showList();
    }

    @Override
    public void createBook(Book book) {
        bookRepository.createBook(book);
    }

    @Override
    public Book edit(int id_edit) {
        return bookRepository.edit(id_edit);
    }

    @Override
    public void update(Book book) {
        bookRepository.update(book);
    }

    @Override
    public void delete_by_id(int id) {
        bookRepository.delete_by_id(id);
    }
}
