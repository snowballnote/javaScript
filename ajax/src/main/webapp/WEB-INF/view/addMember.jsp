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
<div class="container">
   <h1>회원가입</h1>
   
   <div>
      <label for="id" class="form-label">ID 검색:</label>
      <input type="text" class="form-control" id="searchId"  name="searchId">
      <button type="button" class="btn btn-success" id="searchBtn">ID 검색</button>
   </div>
   
   <form action="${pageContext.request.contextPath}/addMember" id="addForm">
      <div class="mb-3 mt-3">
         <label for="id" class="form-label">ID:</label>
         <input type="text" class="form-control" id="id"  name="id" readonly>
      </div>
      
      <div class="mb-3 mt-3">
         <label for="pw" class="form-label">PW:</label>
         <input type="password" class="form-control" id="pw"  name="pw">
      </div>
      
      <div class="mb-3 mt-3">
         <label for="pw2" class="form-label">PW확인:</label>
         <input type="password" class="form-control" id="pw2"  name="pw2">
      </div>
      
      <div class="mb-3 mt-3">
         <label for="grade" class="form-label">GRADE:</label>
         <input type="number" class="form-control" id="grade"  name="grade">
      </div>
      
      <button type="button" class="btn btn-primary" id="addBtn">회원가입</button>
   </form>
</div>   
</body>
<script>
   $('#addBtn').click(function() {
      if($('#id').val() == '') {
         alert('id를 확인하세요');
         return;
      }
      if($('#pw').val().length < 4 
            || $('#pw').val() != $('#pw2').val()) {
         alert('pw를 확인하세요');
         return;
      }
      if(!($('#grade').val()=='1' || $('#grade').val()=='2')) {
         alert('grade(1 or 2)를 확인하세요');
         return;
      }
      $('#addForm').submit();
   });

   $('#searchBtn').click(function(){
      if($('#searchId').val() == '') {
         alert('searchId 입력하세요');
      } else {
         console.log($('#searchId').val());
         // 비동기통신
         $.ajax({
            url:'/ajax/restapi/searchId'
            , type:'post'
            , data:{'searchId' : $('#searchId').val()}
            , success: function(response) {            
               // console.log(response == '사용가능');
               if(response == '사용가능') {
                  alert($('#searchId').val()+' ID는 사용가능합니다');
                  $('#id').val($('#searchId').val());
               } else {
				alert($('#searchId').val()+' ID는 사용중입니다');
                  $('#id').val('');
               }
            }
         });
      }
   });
</script>
</html>