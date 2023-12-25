package com.poly.dao;

import java.util.List;

public abstract class MyVideoDAO<E, K> {
	abstract public void insert(E entity);
	abstract public void update(E entity);
	abstract public void delete(E entity);
	abstract public List<E> findAll();
	abstract public E findById(K id);
}
