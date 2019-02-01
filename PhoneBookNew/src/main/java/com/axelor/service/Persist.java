package com.axelor.service;
import com.google.inject.Injector;
import com.google.inject.persist.PersistService;

public class Persist {
	public Persist(Injector inject) {
		PersistService ps = inject.getInstance(PersistService.class);
		ps.start();
	}
}
