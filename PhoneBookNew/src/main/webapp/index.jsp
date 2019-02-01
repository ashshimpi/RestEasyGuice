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
<body><center>
	<h1>PhoneBook</h1>
	<form method="post" action="<%= request.getContextPath() %>/add">
	<table cellpadding="3pt">
            <tr>
                <td>User Name :</td>
                <td><input type="text" name="cname" size="30" /></td>
            </tr>
            
            <tr>
                <td>Contact Number:</td>
                <td><input type="text" name="cnumber" size="30" /></td>
            </tr>
           
            
        </table>
        <p />
        <input type="submit" value="Register"/>
	</form>
	<form action="post" name="form2">
		<table cellpadding="3pt" border="1">
			<tr>
				<td>User Name :</td>

				<td>Contact No. :</td>
				<td colspan="2">Action :</td>
			</tr>
		
				<%
		      
		        Injector inject = Guice.createInjector(new JpaPersistModule("Persist"));
		        PersistService ps = inject.getInstance(PersistService.class);
				ps.start();
				
			    ContactServiceImpl cs = inject.getInstance(ContactServiceImpl.class);
			  
			    List<Contact> list1 = new ArrayList<Contact>();
			   
			    Query query = cs.em.createQuery("select c from Contact c");
			   
			    list1 = query.getResultList();
			   
			    for(Contact contact:list1) {
				   
			 %>
			<tr>
				<td><%= contact.getCname() %></td>
				<td><%= contact.getCnumber() %></td>
				<td><a href="update.jsp?id=<%=contact.getId()%>">update</a></td>
				<td><a href="/PhoneBookNew/phone/delete/<%=contact.getId()%>">delete</a></td>
			</tr>
			
			<% } %>
		</table>
	</form>
	</center>
</body>
</html>