package by.topolev.twitter.service;

import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import by.topolev.twitter.domain.User;

//@Service(value="userDao")
@Transactional
public class UserDaoImpl extends GenericDaoImpl<User, Long> implements UserDao{

	UserDaoImpl(){
		this(User.class);
	}
	UserDaoImpl(Class<User> type) {
		super(type);
	}
	@Override
	public User findByUsername(String username) {
		TypedQuery<User> query = em.createNamedQuery("User.findByUsername", User.class).setParameter("username", username);
		User user = query.getSingleResult();
		return user;
	}
	

}
