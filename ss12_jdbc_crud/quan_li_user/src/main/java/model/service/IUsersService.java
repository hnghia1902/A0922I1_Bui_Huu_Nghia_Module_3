package model.service;

import model.User;

import java.util.List;

public interface IUsersService {
    List<User> showList();
    void createUsers(User user);
    void delete(int id);
    User edit(int id);
    void  update(User user);
    User search(String country1);
    List<User> sort_by_name();
}
