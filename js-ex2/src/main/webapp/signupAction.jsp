<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th, td{
		padding: 5px;
	}
</style>
</head>
<body>
	<h3>계정 정보</h3>
	<table border="1">
		<tr>
			<th>이름</th>
			<td>${param.fullName}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${param.username}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${param.email}</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${param.password}</td>
		</tr>
	</table>
	
	<h3>프로필</h3>
	<table border="1">
		<tr>
			<th>휴대전화</th>
			<td>${param.fullName}</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${param.birthdate}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
		        <c:choose>
		            <c:when test="${param.gender == 'male'}">남자</c:when>
		            <c:when test="${param.gender == 'female'}">여자</c:when>
		            <c:otherwise>기타</c:otherwise>
		        </c:choose>
    </td>
		</tr>
		<tr>
			<th>직업</th>
			<td>
				<c:choose>
		            <c:when test="${param.occupation == 'student'}">학생</c:when>
		            <c:when test="${param.occupation == 'developer'}">개발자</c:when>
		            <c:when test="${param.occupation == 'designer'}">디자이너</c:when>
		            <c:when test="${param.occupation == 'pm'}">PM/기획자</c:when>
		            <c:otherwise>기타</c:otherwise>
		        </c:choose>
			</td>
		</tr>
	</table>
	
	<h3>주소</h2>
	<table border="1">
		<tr>
			<th>주소</th>
			<td>${param.country} ${param.state} ${param.city} ${param.addressLine1} ${param.addressLine2} (${param.postalCode})</td>
		</tr>
	</table>
	
	<h3>선호 설정</h3>
	<table border="1">
		<tr>
			<th>관심 기술 스택</th>
			<td>
				<c:forEach var="s" items="${paramValues.skills}">
					<c:if test="${s == 'html'}">HTML </c:if>
					<c:if test="${s == 'css'}">CSS </c:if>
					<c:if test="${s == 'js'}">JavaScript </c:if>
					<c:if test="${s == 'java'}">Java </c:if>
					<c:if test="${s == 'python'}">Python </c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>선호 연락 방법</th>
			<td>
				<c:choose>
		            <c:when test="${param.contactMethod == 'email'}">이메일</c:when>
				    <c:when test="${param.contactMethod == 'sms'}">문자</c:when>
				    <c:when test="${param.contactMethod == 'call'}">전화</c:when>
		        </c:choose>
			</td>
		</tr>
		<tr>
			<th>시간대</th>
			<td>
				<c:choose>
		            <c:when test="${param.timezone == 'Asia/Seoul'}">Asia/Seoul</c:when>
		            <c:when test="${param.timezone == 'Asia/Tokyo'}">Asia/Tokyo</c:when>
		            <c:when test="${param.timezone == 'America/New_York'}">America/New_York</c:when>
		            <c:when test="${param.timezone == 'America/Los_Angeles'}">America/Los_Angeles</c:when>
		            <c:when test="${param.timezone == 'UTC'}">UTC</c:when>
		        </c:choose>
			</td>
		</tr>
		<tr>
			<th>뉴스레터 수신 동의</th>
			<td>${param.newsletter == 'yes' ? '수신함' : '수신안함'}</td>
		</tr>
		<tr>
			<th>자기소개</th>
			<td>${param.bio}</td>
		</tr>
	</table>
</body>
</html>