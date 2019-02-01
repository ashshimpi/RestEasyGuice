package com.axelor.service;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import java.net.URI;
import java.net.URISyntaxException;
import com.axelor.pojo.Contact;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Singleton;
import com.google.inject.persist.jpa.JpaPersistModule;
import javax.ws.rs.core.Response;

@Singleton
@Path("/")
public class ContactController {
	
	Injector inject = Guice.createInjector(new JpaPersistModule("Persist"));
	Persist ps = new Persist(inject);
	
	@POST
	@Path("/add")
	@Consumes("application/x-www-form-urlencoded")
	public Response add(@FormParam("cname") String cname,@FormParam("cnumber") int cnumber) {
		ContactServiceImpl cs = inject.getInstance(ContactServiceImpl.class);
		Contact c=new Contact();
		c.setCname(cname);
		c.setCnumber(cnumber);
		
		cs.add(c);
		
		 //return Response.status(201).contentLocation(new URI("/user-management/users/123")).build();

		URI location = null;
		try {
			location = new URI("http://localhost:8080/PhoneBookNew");
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return Response.temporaryRedirect(location).build();

	}
	
	@DELETE
	@Path("delete/{id}")
	@Consumes("application/x-www-form-urlencoded")
	 public Response removeBook(@PathParam("id") int id ){
		System.out.println(id);
		ContactServiceImpl cs = inject.getInstance(ContactServiceImpl.class);
		cs.remove(id);
		URI location = null;
		try {
			location = new URI("http://localhost:8080/PhoneBookNew/index.jsp");
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return Response.temporaryRedirect(location).build();
	}
	
}
