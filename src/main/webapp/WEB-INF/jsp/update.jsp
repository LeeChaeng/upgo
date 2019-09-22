<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<script>
$(document).ready(function(){
	   if("${detail.cop_no}" != ""){
	      $("#cop_no").val("${detail.cop_no}").prop("selected",true);
	   }
	   if("${detail.prod_no}"!=""){
	      $("#prod_no").val("${detail.prod_no}").prop("selected",true);
	   }
});
</script>
<body>
<div class="container" style="border-left:1px solid grey; border-right:1px solid grey;">
	<div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:20px;"><span class="glyphicon glyphicon-edit"></span>게시글 수정</label>
    </div>

	<form action="/updateProc" method="post">
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
			<input type="text" class="form-control" id="title" name="b_title" value="${detail.b_title}">
		</div>
		<div class="form-group">
			<label for="content">내용</label>
			<input type="text" class="form-control" id="title" name="b_content" value="${detail.b_content}">
		</div>
		<input type="hidden" name="b_no" value="${b_no}"/>
		<button type="submit" class="btn btn-default">수정</button>
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