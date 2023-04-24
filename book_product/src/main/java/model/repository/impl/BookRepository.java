package model.repository.impl;

import model.book.Book;
import model.book.Catalog_book;
import model.repository.IBookRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static final String  SHOW_BOOKS = "select `id`, `name`, `price`, `description`, `publication_date`, `catalog_name` from book inner join catalog_book_ on book.catalog_id = catalog_book_.catalog_id;";
    private static final String CREATE_BOOK = "INSERT INTO `book_product`.`book` (`name`, `price`, `description`, `publication_date`, `catalog_id`) VALUES (?,?,?,?,?)";
    private static final String EDIT_BOOK_FIND_BY_ID = "select * from book_product.book where id = ?;";
    private static final String UPDATE_BOOK = "UPDATE `book_product`.`book` SET `name` = ?, `price` = ?, `description` = ?, `publication_date` = ?, `catalog_id` = ? WHERE (`id` = ?);";
    private static final String DELETE_BY_ID = "delete from book_product.book where id = ?;";
    @Override
    public List<Catalog_book> showList() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<Catalog_book> catalogBookList = new ArrayList<>();
        Catalog_book catalog_book = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(SHOW_BOOKS);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int price = resultSet.getInt("price");
                    String description = resultSet.getString("description");
                    Date publication_date = resultSet.getDate("publication_date");
                    String catalog_name = resultSet.getString("catalog_name");
                    catalog_book = new Catalog_book(id,name,price,description,publication_date,catalog_name);
                    catalogBookList.add(catalog_book);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }

        return catalogBookList;
    }

    @Override
    public void createBook(Book book) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(CREATE_BOOK);
                statement.setString(1,book.getName());
                statement.setInt(2,book.getPrice());
                statement.setString(3,book.getDescription());
                statement.setDate(4,book.getPublication_date());
                statement.setInt(5,book.getCatalog_id());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {

                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public Book edit(int id_edit) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Book book = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(EDIT_BOOK_FIND_BY_ID);
                statement.setInt(1,id_edit);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int price = resultSet.getInt("price");
                    String description = resultSet.getString("description");
                    Date publication_date = resultSet.getDate("publication_date");
                    int catalog_id = resultSet.getInt("catalog_id");
                    book = new Book(id_edit,name,price,description,publication_date,catalog_id);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return book;
    }

    @Override
    public void update(Book book) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(UPDATE_BOOK);
                statement.setString(1,book.getName());
                statement.setInt(2,book.getPrice());
                statement.setString(3,book.getDescription());
                statement.setDate(4,book.getPublication_date());
                statement.setInt(5,book.getCatalog_id());
                statement.setInt(6,book.getId());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {

                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public void delete_by_id(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(DELETE_BY_ID);
                statement.setInt(1,id);
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally {
                try {

                    statement.close();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                DBConnection.close();
            }
        }
    }
}
