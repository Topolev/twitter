package by.topolev.twitter.service;

import java.io.Serializable;
import java.util.List;

public interface GenericDao<T, PK extends Serializable> {
	public T create(T persistance);
	public T update(T persistance);
	public Boolean delete(T pesistance);
	public T findById(Long id);
	public List<T> findAll();
}
