<%@page import="com.axelor.pojo.Contact"%>
<%@page import="com.axelor.service.ContactService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="text/html; charset=UTF-8">

<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>PhoneBook</h1>
		<form method="post" action="<%=request.getContextPath()%>/add"
			name="form1">
			
				
						<div class="table100">

							<table cellpadding="3pt" align="center">
								<tr>
									<td class="column1">User Name :</td>
									<td class="column2"><input type="text" name="cname" size="30" /></td>
								</tr>
								<tr>
									<td class="column1">Contact Number:</td>
									<td class="column2"><input type="text" name="cnumber" size="30" /></td>
								</tr>
							</table>
						</div>
					
			
			<input type="submit" value="Register" />

		</form>
		<br> <br>
		<form method="get" name="form2">
			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<div class="table100">
							<table cellpadding="3pt" border="1">
								<thead>
									<tr class="table100-head">
										<th class="column1">User Name
										</td>
										<th class="column2">Contact No
										</td>
										<th class="column3" colspan="2">Action
										</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${contact}" var="contact">
										<tr>
											<td class="column1">${contact.cname}</td>
											<td class="column2">${contact.cnumber}</td>
											<td class="column3"><a
												href="update.jsp?id=${contact.id}&cname=${contact.cname}&cnumber=${contact.cnumber}">update</a></td>
											<td class="column3"><a
												href="<%= request.getContextPath() %>/delete/${contact.id}">delete</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</center>
</body>
</html>