package model.repository;

import model.User;

import java.util.List;

public interface IUsersRepository {
    List<User> showList();
    void createUsers(User user);
    void delete(int id);
    User edit(int id);
    void  update(User user);
    User search(String country);
}
