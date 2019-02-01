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
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

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
	public void add(@FormParam("cname") String cname,@FormParam("cnumber") int cnumber,@Context HttpResponse response, 
	                    @Context HttpRequest request) 
	{ 
		//System.out.println("data");
		Contact c=new Contact();
		c.setCname(cname);
		c.setCnumber(cnumber);
		//System.out.println(c.getCname());
		//System.out.println(c.getCnumber());
		ContactService.addcontact(c);
		 try {
			Response.status(200).contentLocation(new URI("http://localhost:8080/PhoneBook/index.jsp")).build();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@GET
	public View viewdata(@Context HttpResponse response, 
	                    @Context HttpRequest request) 
	{ 
		 List<Contact> list1 = new ArrayList<Contact>();
		   
		   list1= ContactService.viewcontact();
		   
		    System.out.println(list1);	
		    for(Contact c:list1)
		    {
		    	System.out.println(c.getCname());
		    }
		    request.setAttribute("mylist",list1);
		return new View("/index.jsp", list1, "contact");
		
	}
	
	@DELETE
	@Path("delete/{id}")
	public void delete(@PathParam("id") int id,@Context HttpResponse response, 
	                    @Context HttpRequest request) 
	{ 
		ContactService.deletecontact(id);
		try {
			Response.status(200).contentLocation(new URI("http://localhost:8080/PhoneBook/index.jsp")).build();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
