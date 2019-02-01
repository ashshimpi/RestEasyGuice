<%@page import="com.axelor.service.ContactServiceImpl"%>
<%@page import="javax.persistence.Query"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.axelor.pojo.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.axelor.service.*"%>
<%@page import="com.google.inject.persist.PersistService"%>
<%@page import="com.google.inject.persist.jpa.JpaPersistModule"%>
<%@page import="com.google.inject.Guice"%>
<%@page import="com.google.inject.Injector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="app/phone/update">
	<center>
	<h1>Update PhoneBook</h1>
	 <%
        Injector inject = Guice.createInjector(new JpaPersistModule("Persist"));
        PersistService ps = inject.getInstance(PersistService.class);
		ps.start();
		
	    ContactServiceImpl gs = inject.getInstance(ContactServiceImpl.class);
	  
	    List<Contact> list1 = new ArrayList<Contact>();
	   
	    Query query = gs.em.createQuery("FROM Contact c WHERE id="+request.getParameter("id"));
	   
	    list1 = query.getResultList();
		   
	    for(Contact contact:list1) {
	 %>
	 	<table cellpadding="3pt">
            <tr>
                <td>User Name :</td>
                <td><input type="text" name="cname" size="30" value="<%= contact.getCname() %>"/></td>
            </tr>
            
            <tr>
                <td>Contact Number:</td>
                <td><input type="text" name="cnumber" size="30" value="<%= contact.getCnumber() %>"/></td>
            </tr>
           
            
        </table>
	 
	 <input type="submit" value="update">
	 <%} %>
	 </center>
	 </form>
</body>
</html>