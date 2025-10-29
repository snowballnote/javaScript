<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- Latest compiled and minified CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<select name="country" id="country">
		<option value="">나라 선택</option>
		<c:forEach var="c" items="${list}">
			<option value="${c}">${c}</option>
		</c:forEach>
	</select>
	
	<select name="city" id="city">
	</select>
</body>
<script>
	$('#country').change(function(){
		if($('#country').val() == '') {
			$('#city').empty();
		} else {
			$.ajax({
				url: '/ajax/restapi/cityList' 
				, type: 'post'
				, data: {'country' : $('#country').val()}
				, success: function(response) {
					console.log(response);
					$('#city').empty();
					response.forEach(function(e) {
						$('#city').append('<option>'+e+'</option>');
					});
				}	
			});
		}
	});
</script>
</html>