<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form1" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Form</title>

<style>
body{
	background-image: url('http://bgfons.com/uploads/paper/paper_texture6030.jpg'); background-size:cover;
}
h3{
	color: #b186ea;
	font-size: 45px;
	font-family: serif;
}
</style>

<form1:url value="/js/jquery-3.3.1.min.js" var="path"/>
<form1:url value="/js/jquery.validate.min.js" var="path1"/>

<script type="text/javascript" src="${path}"></script>
<script type="text/javascript" src="${path1}"></script>
</head>
<body>
<center>

<c:url var="url" value="/form"/>
<c:url var="url1" value="/show"/>
	<form:form action="${url}" method="post" modelAttribute="clientForm" id="form">
	<h3>Inserimento dati</h3>
		<table>
			<tr>
				<td>Nome</td>
				<td><form:input path="name" /></td>
				<form:hidden path="id"/>
			</tr>

			<tr>
				<td>Cognome</td>
				<td><form:input path="surname" /></td>
			</tr>

			<tr>
				<td>Città</td>
				<td><form:input path="city" /></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="Salva" /></td>
			</tr>
			<tr>
				<td><a href="${url1}">Visualizza</a></td>
			
			</tr>
		</table>

	</form:form>
	
	<script type="text/javascript">
		$(function() {
			
			$('#form').validate({
			  rules:{	
				name:{
					required:true
				},
				surname:{
					required:true
				},
				city:{
					required:true
				}
			  },
			  
			  messages:{
			  	name:{
			  		required:"Digita il nome"
			  	},
			  	surname:{
			  		required:"Digita il cognome"
			  	},
			  	city:{
			  		required:"Digita la città"
			  	}
			  }
			})
			
		})
		
	</script>
</center>
</body>
</html>