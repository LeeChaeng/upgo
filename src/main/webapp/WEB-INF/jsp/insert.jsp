<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 게시글 작성</title>
</head>
<body>
<div class="container" style="border-left:1px solid grey; border-right:1px solid grey;">
	<form action="/insertProc" method="post" name="registForm">
		<div class="form-group">
			<label for="coperation">업체번호</label>
			<select name="cop_no" id="cop_no" class="form-control">
               <option value="" selected>선      택</option>
               <c:forEach var="cop" items="${copList}" varStatus="status">
                  <option value="${cop.cop_no}">${cop.cop_no}  |  ${cop.cop_name}</option>
               </c:forEach>
            </select>
		</div>
		<div class="form-group">
			<label for="product">제품번호</label>
			<select name="prod_no" id="prod_no" class="form-control">
               <option value="" selected>선      택</option>
               <c:forEach var="prod" items="${showProd}" varStatus="status">
                  <option value="${prod.prod_no}" data-cop="${prod.cop_no}">${prod.cop_no}  |  ${prod.prod_name}</option>
               </c:forEach>
            </select>
		</div>
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="title" name="b_title" placeholder="제목을 입력하세요">
		</div>
		<div class="form-group">
			<label for="writer">작성자</label>
			<input type="text" class="form-control" id="writer" name="b_writer" placeholder="작성자 명을 입력해주세요">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control" id="content" name="b_content" rows="3"></textarea>
		</div>
		<input type="button" class="btn btn-default" value="작성" onclick="fnc_check()">
	</form>
</div>
</body>
</html>
<script>
function fnc_check(){
	   var prod = $("#prod_no option:selected");
	   var cop = $("#cop_no option:selected");

	   if(cop.attr("value") != prod.attr("data-cop")){
	      alert("업체와 상품이 일치하지 않습니다.");
	      $("#cop_no").val("");
	      $("#prod_no").val("");

	   }else{
	      document.registForm.submit();
	   }
	}
</script>
</layoutTag:layout>