package com.axelor.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.persistence.Query;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;
import org.jboss.resteasy.plugins.providers.html.View;
import org.jboss.resteasy.spi.HttpRequest;
import org.jboss.resteasy.spi.HttpResponse;
import com.axelor.pojo.Contact;
import com.google.inject.Singleton;

@Singleton
@Path("/")
public class ContactController {

	@Inject
	ContactService ContactService;

	@POST
	@Path("add")
	public Response addData(@FormParam("cname") String cname, @FormParam("cnumber") long cnumber,
			@Context HttpResponse response, @Context HttpRequest request) throws URISyntaxException {
		// System.out.println("data");
		Contact c = new Contact();
		c.setCname(cname);
		c.setCnumber(cnumber);
		// System.out.println(c.getCname());
		// System.out.println(c.getCnumber());
		ContactService.addContact(c);
		URI uri = new URI("http://localhost:8080/PhoneBook/");
		return Response.status(Status.MOVED_PERMANENTLY).location(uri).build();
	}

	
	@GET
	public View viewData(@Context HttpResponse response, @Context HttpRequest request) {
		
		List<Contact> list1 = new ArrayList<Contact>();
		list1 = ContactService.viewContact();
		System.out.println(list1);
		for (Contact c : list1) {
			System.out.println(c.getCname());
		}
		request.setAttribute("mylist", list1);
		return new View("", list1, "contact");
	}

	@GET
	@Path("/delete/{id}")
	public Response deleteData(@PathParam("id") int id, @Context HttpResponse response, @Context HttpRequest request)
			throws URISyntaxException {

		ContactService.deleteContact(id);
		System.out.println(id);
		URI uri = new URI("http://localhost:8080/PhoneBook/");
		return Response.status(Status.MOVED_PERMANENTLY).location(uri).build();
	}

	@POST
	@Path("update/{id}")
	public Response updateData(@PathParam("id") int id, @FormParam("cname") String cname,
			@FormParam("cnumber") long cnumber, @Context HttpResponse response, @Context HttpRequest request) throws URISyntaxException {

		updateData2(cname, cnumber, id);
		
		URI uri = new URI("http://localhost:8080/PhoneBook/");
		return Response.status(Status.MOVED_PERMANENTLY).location(uri).build();
	}
	@PUT
	public void updateData2(String cname, long cnumber, int id) {
		ContactService.updateContact(id, cname, cnumber);
	}
}
