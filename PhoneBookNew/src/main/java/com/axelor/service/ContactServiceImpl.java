package com.axelor.service;
import javax.persistence.EntityManager;
import com.axelor.pojo.*;
import com.google.inject.Inject;
import com.google.inject.persist.Transactional;

public class ContactServiceImpl {

	@Inject
	public EntityManager em;

	@Transactional
	public void add(Object user) {
		
		em.persist(user);
		
	}

	@Transactional
	public void remove(int id) {
		
		Contact contact = em.find(Contact.class,id);
		
		em.remove(contact);
	
	}

}