package model.service.impl;

import model.User;
import model.repository.IUsersRepository;
import model.repository.impl.UsersRepository;
import model.service.IUsersService;

import java.util.List;

public class UsersService implements IUsersService {
    IUsersRepository iUsersRepository = new UsersRepository();
    @Override
    public List<User> showList() {
        return iUsersRepository.showList();
    }

    @Override
    public void createUsers(User user) {
        iUsersRepository.createUsers(user);
    }

    @Override
    public void delete(int id) {
        iUsersRepository.delete(id);
    }

    @Override
    public User edit(int id) {
        return iUsersRepository.edit(id);
    }

    @Override
    public void update(User user) {
        iUsersRepository.update(user);
    }

    @Override
    public User search(String country1) {
        return iUsersRepository.search(country1);
    }

}
