package com.axelor.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.axelor.pojo.Contact;
import com.google.inject.persist.Transactional;

public class ContactServiceImpl implements ContactService{
	
	
	public EntityManager em;

	@Inject
	public ContactServiceImpl(EntityManager em) {
		this.em = em;
	}
	@Transactional
	@Override
	public void addcontact(Contact c) {
		
		em.persist(c);
	}
	@Transactional
	@Override
	public List<Contact> viewcontact() {
		
	return em.createQuery("select c from Contact c").getResultList();
		
	}
	
}
