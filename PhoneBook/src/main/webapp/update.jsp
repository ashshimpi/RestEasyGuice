<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->

<title>Insert title here</title>
</head>


<body>
	<center>
		<h1>UpdateData</h1>
		<form method="post"
			action="<%=request.getContextPath()%>/update/<%=request.getParameter("id")%>">
			<div class="table100">
			<table cellpadding="3pt">
			
				<input type="hidden" name="id"
					value="<%=request.getParameter("id")%>">
				<tr>
					<td class="column1">User Name :</td>
					<td class="column2"><input type="text" name="cname" size="30"
						value="<%=request.getParameter("cname")%>" /></td>
				</tr>
				<tr>
					<td class="column1">Contact Number:</td>
					<td class="column2"><input type="text" name="cnumber" size="30"
						value="<%=request.getParameter("cnumber")%>" /></td>
				</tr>
			</table>
			</div>
			<input type="submit" value="Update"/>
		</form>
	</center>
</body>
</html>



