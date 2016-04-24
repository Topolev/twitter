package by.topolev.twitter.service;

import by.topolev.twitter.domain.User;

/**
 * Created by Eugene on 24.04.2016.
 */
public interface UserService {

    public User findByUsername(String username);

    User create(User user);
}
