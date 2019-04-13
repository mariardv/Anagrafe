<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show</title>
<style>
body{
	background-image: url('http://bgfons.com/uploads/paper/paper_texture6030.jpg'); background-size:cover;
}
h3{
	color: #b186ea;
	font-size: 45px;
	font-family: serif;
}
th{
	color:#4e477a;
	font-family: serif;
}
</style>
</head>
<body>
<center>
<h3>Archivio dati</h3>
<c:if test="${!empty clientList}">
	<table>
		<tr>
		<th>ID</th>
		<th>NOME</th>
		<th>COGNOME</th>
		<th>CITTA'</th>
		<th>CANCELLA</th>
		<th>MODIFICA</th>
		</tr>
			
		<c:forEach items="${clientList}" var="item">
		
		<tr>
		<td>${item.id}</td>
		<td>${item.name}</td>
		<td>${item.surname}</td>
		<td>${item.city}</td>
		<td><a href="delete/${item.id}">Cancella</a></td>
		<td><a href="edit/${item.id}">Modifica</a></td>
		</tr>
		</c:forEach>
</table>
</c:if>
</center>
</body>
</html>