package by.topolev.twitter.dao;

import by.topolev.twitter.domain.User;

public interface UserDao extends GenericDao <User, Long>{
	public User findByUsername(String username);
}
