package com.axelor.service;

import java.util.List;

import javax.persistence.Query;

import com.axelor.pojo.Contact;

public interface ContactService {
	public void addContact(Contact c);
	public List<Contact> viewContact();
	public void deleteContact(int id);
	public void updateContact(int id,String cname,long cnumber);
	
}
