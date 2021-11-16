<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Demo 결과</title>
	<c:import url="../common/header.jsp"/>
	<style>
		table#tbl-demo{
			margin:0 auto;
			width:50%;
		}
	</style>
</head>
<body>
	<div id="container">
	<c:import url="../common/menubar.jsp"/>
	<table class="table" id="tbl-demo">
		<tr>
			<th scope="col">이름</th>
			<td>${dev.devName}</td>
			</tr>
			<tr>
			<th scope="col">이메일</th>
			<td>${dev.devEmail}</td>
			</tr>
			<tr>
			<th scope="col">성별</th>
			<td>${dev.devGender=="M"?"남":"여"}</td>
			</tr>
			<tr>
			<th scope="col">개발언어</th>
			<td>
				<c:forEach items="${dev.devLang}" var="lang" varStatus="vs">
				${vs.index!=0?",":""} ${lang}
				</c:forEach>
			</td>
		</tr>
	</table>
	<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>