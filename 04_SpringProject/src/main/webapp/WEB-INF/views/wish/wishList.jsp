<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Culture Shock</title>

<!-- <script src="../resources/js/jquery-3.6.0.min.js"></script> -->

<style>
body, html, section{
	min-height: 100%
}
</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/category.css" />
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/menubar.jsp"/>

	<section>
	
	
	 
	
	<div class="listArea">		
		<div class="list_container">
			<c:forEach items="${alist}" var="alist" varStatus="status">
				<div class="listArea">
					<img src="${alist.artImg}">
						<%-- <div class="main_topinfo" style="display:none;">
							<button class="main_toprevieww" onclick="goDetail('${alist.artId}'); return false;"
							style="border: none; background-color: var(--black-color);color: #0086D3;">작품보기</button>
						</div>	 --%>
					<div class="list_content">
							<script>
							 $(document).ready(function(){ 
			                 	$('.titleremove').each(function(){ 
			                 		if ($(this).text().length > 15) $(this).html($(this).text().substr(0,15)+"..."); }); });
						 	</script>
						 
						 	<h6 class="titleremove">${alist.artTitle}</h6>
		              						
					</div>
				</div>
			</c:forEach>	
		</div>
	</div>
	
	<c:out value="${pageBar}" escapeXml="false"/>
	</section>
	
	<c:import url="../common/footer.jsp"/>
</body>

</html>