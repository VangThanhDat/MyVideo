package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.bean.Favorite;
import com.poly.until.JpaUntils;

public class FavoriteDAO extends MyVideoDAO<Favorite, Integer> {
	
	private EntityManager em = JpaUntils.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	@Override
	public void insert(Favorite entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
		
	}

	@Override
	public void update(Favorite entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
		
	}

	@Override
	public void delete(Favorite entity) {
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
		
	}

	@Override
	public List<Favorite> findAll() {
		String jpql = "SELECT o FROM Favorite o";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		List<Favorite> list = query.getResultList();
		return list;
	}

	@Override
	public Favorite findById(Integer id) {
		Favorite entity = em.find(Favorite.class, id);
		return entity;
	}
	public List<Favorite> findFavoriteByUserID(String userID) {
		String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :userId";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("userId", userID);
		List<Favorite> list = query.getResultList();
		return list;
	}
	public List<Favorite> findFavoriteByVideoID(String videoID) {
		String jpql = "SELECT f FROM Favorite f WHERE f.video.id = :videoId";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("videoId", videoID);
		List<Favorite> list = query.getResultList();
		return list;
	}
	
}
