package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.poly.bean.Video;
import com.poly.until.JpaUntils;

public class VideoDAO extends MyVideoDAO<Video, String> {
	
	private EntityManager em = JpaUntils.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
		em.close();
		super.finalize();
	}
	@Override
	public void insert(Video entity) {
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
	public void update(Video entity) {
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
	public void delete(Video entity) {
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
	public List<Video> findAll() {
		String jpql = "SELECT o FROM Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		List<Video> list = query.getResultList();
		return list;
	}

	@Override
	public Video findById(String id) {
		Video entity = em.find(Video.class, id);
		return entity;
	}
	public List<Video> findByPage(int page) {
		String jpql = "SELECT o FROM Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setFirstResult((page - 1) * 6);
        query.setMaxResults(6);
		List<Video> list = query.getResultList();
		return list;
	}

	public List<Video> findVideoFavoriteByUser(String id) {
		String jpql = "SELECT f.video FROM Favorite f WHERE f.user.id = :userId";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("userId", id);
		List<Video> list = query.getResultList();
		return list;
	}
	public List<Video> findVideoFavoriteByUserPage(String id, int page) {
		String jpql = "SELECT f.video FROM Favorite f WHERE f.user.id = :userId";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("userId", id);
		query.setFirstResult((page - 1) * 6);
        query.setMaxResults(6);
		List<Video> list = query.getResultList();
		return list;
	}
	public List<Video> find3VideoRandom(){
		Query query = em.createNamedQuery("Report.random3");
		List<Video> list = query.getResultList();
		return list;
	}
}
