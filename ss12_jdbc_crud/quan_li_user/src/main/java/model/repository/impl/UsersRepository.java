package model.repository.impl;

import model.User;
import model.repository.IUsersRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsersRepository implements IUsersRepository {
    private static final String ALL_USERS = "SELECT * FROM demo.users;";
    private static final String CREATE_USER = "INSERT INTO `demo`.`users` (`name`, `email`, `country`) VALUES (?, ?, ?);";
    private static final String DELETE_BY_ID = "delete from demo.users where id = ?;";
    private static final String FIND_BY_ID = "select * from demo.users where id = ?;";
    private static final String UPDATE_BY_ID = "UPDATE `demo`.`users` SET `name` = ?, `email` = ?, `country` = ? WHERE (`id` = ?);";
    private static final String SEARCH_COUNTRY = "select * from demo.users where country like (?'%');";
    private static final String RESET_ID = "SET  @num := 0;\n" +
            "\n" +
            "UPDATE `demo`.users SET id = @num := (@num+1);\n" +
            "\n" +
            "ALTER TABLE `demo`.users AUTO_INCREMENT =1;";
    @Override
    public List<User> showList() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<User> userList = new ArrayList<>();

        if (connection != null){
            try {
                statement = connection.prepareStatement(ALL_USERS);
                resultSet = statement.executeQuery();
                User user = null;
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id,name,email,country);
                    userList.add(user);
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
        return userList;
    }

    @Override
    public void createUsers(User user) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection != null){
            try {
                statement = connection.prepareStatement(CREATE_USER);
                statement.setString(1,user.getName());
                statement.setString(2,user.getEmail());
                statement.setString(3,user.getCountry());
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
    public void delete(int id) {
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

    @Override
    public User edit(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        User user = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(FIND_BY_ID);
                statement.setInt(1,id);
                resultSet = statement.executeQuery();

                while (resultSet.next()){
                    int id_User = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id_User,name,email,country);
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
        return user;
    }

    @Override
    public void update(User user) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(UPDATE_BY_ID);
                statement.setString(1, user.getName());
                statement.setString(2, user.getEmail());
                statement.setString(3, user.getCountry());
                statement.setInt(4, user.getId());
                statement.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public User search(String country1) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        User user = null;
        if (connection != null){
            try {
                statement = connection.prepareStatement(SEARCH_COUNTRY);
                statement.setString(1,country1);
                resultSet = statement.executeQuery();

                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String country = resultSet.getString("country");
                    user = new User(id,name,email,country);
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
        return user;
    }
}
