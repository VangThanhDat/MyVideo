package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.bean.Share;
import com.poly.until.JpaUntils;

public class ShareDAO extends MyVideoDAO<Share, Integer> {
	
	private EntityManager em = JpaUntils.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	@Override
	public void insert(Share entity) {
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
	public void update(Share entity) {
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
	public void delete(Share entity) {
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
	public List<Share> findAll() {
		String jpql = "SELECT o FROM Share o";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		List<Share> list = query.getResultList();
		return list;
	}

	@Override
	public Share findById(Integer id) {
		Share entity = em.find(Share.class, id);
		return entity;
	}
	public List<Share> findShareByUserID(String userID) {
		String jpql = "SELECT s FROM Share s WHERE s.user.id = :userId";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		query.setParameter("userId", userID);
		List<Share> list = query.getResultList();
		return list;
	}
	public List<Share> findShareByVideoID(String videoID) {
		String jpql = "SELECT s FROM Share s WHERE s.video.id = :videoId";
		TypedQuery<Share> query = em.createQuery(jpql, Share.class);
		query.setParameter("videoId", videoID);
		List<Share> list = query.getResultList();
		return list;
	}

	
}
