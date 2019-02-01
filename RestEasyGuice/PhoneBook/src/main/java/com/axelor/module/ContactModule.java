package com.axelor.module;

import com.axelor.service.ContactController;
import com.axelor.service.ContactService;
import com.axelor.service.ContactServiceImpl;
import com.google.inject.AbstractModule;

public class ContactModule extends AbstractModule{
	@Override
	protected void configure() {
		bind(ContactController.class);
		bind(ContactService.class).to(ContactServiceImpl.class);
	}
	
}
