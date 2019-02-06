package com.axelor.service;

import java.util.List;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.event.spi.SaveOrUpdateEvent;

import com.axelor.pojo.Contact;
import com.google.inject.Provider;
import com.google.inject.persist.Transactional;

public class ContactServiceImpl implements ContactService {

	@Inject
	public Provider<EntityManager> provider;
	public EntityManager em;

	@Inject
	public ContactServiceImpl(EntityManager em) {
		this.em = em;
	}

	@Transactional
	@Override
	public void addContact(Contact c) {
		em = provider.get();
		em.persist(c);
		List<Contact> contacts = viewContact();
		System.out.println(contacts.size());
		System.err.println(contacts.toString());
	}
	
	@Transactional
	@Override
	public List<Contact> viewContact() {
		em = provider.get();
		return em.createQuery("select c from Contact c").getResultList();
		// return null;
	}

	@Transactional
	@Override
	public void deleteContact(int id) {

		em = provider.get();
		Contact c = em.find(Contact.class, id);
		em.remove(c);
	}

	@Transactional
	@Override
	public void updateContact(int id,String cname,long cnumber) {
		em = provider.get();
		Contact c=em.find(Contact.class, id);
		em.remove(c);
		c.setId(id);
		c.setCname(cname);
		c.setCnumber(cnumber);
		em.persist(c);
	
	}
}
