<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
body{
	background-image: url('http://bgfons.com/uploads/paper/paper_texture6030.jpg'); background-size:cover;
}
h1{
	color: #b186ea;
	font-size: 70px;
	font-family: serif;
}
</style>
</head>
<body>

	<c:url var="url" value="/form"></c:url>
	<c:url var="url1" value="/show"></c:url>

	<center>
	<h1>WELCOME</h1>
	<br/>
	<a href="${url}">Inserimento</a>
	<a href="${url1}">Visualizza</a>
	</center>
	
</body>
</html>