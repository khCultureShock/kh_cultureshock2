<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dev 목록</title>
	<c:import url="../common/header.jsp"/>
</head>
<body>
	<div id="container">
	<c:import url="../common/menubar.jsp"/>
		<table class="table">
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">이름</th>
		      <th scope="col">나이</th>
		      <th scope="col">이메일</th>
		      <th scope="col">성별</th>
		      <th scope="col">개발가능언어</th>
		      <th scope="col">수정 | 삭제</th>      
		    </tr>
		    <c:forEach items="${list}" var="dev" varStatus="vs">
			    <tr>
			      <td>${vs.count}</td>
			      <td>${dev.devName}</td>
			      <td>${dev.devAge}</td>
			      <td>${dev.devEmail}</td>
			      <td>${dev.devGender=="M"?"남":"여"}</td>
			      <td>
			      	<!-- 한줄로 쓰지 않으면, 줄바꿈/공백 => 공백하나로 처리됨. -->
			      	<c:forEach items="${dev.devLang}" var="lang" varStatus="vs">${vs.index!=0?",":""} ${lang}</c:forEach>
			      </td>
			      <td>
			      	<button type="button" class="btn btn-outline-info" onclick="updateDev(${dev.devNo});">수정</button>
			      	<button type="button" class="btn btn-outline-info" onclick="deleteDev(${dev.devNo});">삭제</button>
			      </td>
			    </tr>
		    </c:forEach>
		</table>
		<script>
		function updateDev(no){
			location.href="${pageContext.request.contextPath}/demo/updateDev.do?no="+no;
		}
		function deleteDev(no){
			location.href="${pageContext.request.contextPath}/demo/deleteDev.do?no="+no;
		}
		</script>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>