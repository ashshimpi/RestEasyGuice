<%@page import="com.axelor.pojo.Contact"%>
<%@page import="com.axelor.service.ContactService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
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
    <input type="submit" value="Register"/>
	</form><br><br>
	<form method="get" name="form2" >
	<table cellpadding="3pt" border="1">
			<tr>
				<td>User Name</td>
				<td>Contact No</td>
				<td colspan="2">Action</td>
			</tr>
			<tr>
			<<c:forEach items="${contacts}" var="contact">
				<td></td>
			</c:forEach>
			
			</tr>
		</table>
	</form>
</center>
</body>
</html>