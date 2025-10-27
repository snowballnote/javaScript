<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>이름</th>
			<td>${param.name}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${param.birth}</td>
		</tr>
		<tr>
			<th>성별(남/여)</th>
			<td>${param.gender == 'm' ? '남' : '여'}</td>
		</tr>
		<tr>
			<th>관심사(정치/경제/문화/스포츠/엔터)</th>
			<td>
				<c:forEach var="item" items="${paramValues.interest}" varStatus="s">
	      			<c:choose>
				        <c:when test="${item == 'p'}">정치</c:when>
				        <c:when test="${item == 'ec'}">경제</c:when>
				        <c:when test="${item == 'c'}">문화</c:when>
				        <c:when test="${item == 's'}">스포츠</c:when>
				        <c:when test="${item == 'en'}">엔터</c:when>
	     			</c:choose>
	    		</c:forEach>
			</td>
		</tr>
	</table>
</body>
</html>