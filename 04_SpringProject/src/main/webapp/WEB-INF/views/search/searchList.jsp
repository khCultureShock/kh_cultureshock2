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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/search.css" />
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/logo.png" />
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/menubar.jsp"/>

	<section>
            <div class="modal_searchDiv" title="검색">          
                <div class="modal_content searchArea">                   
                        <input class="main_searchInput" type="text" onkeyup="enterkey();" placeholder="보고싶은 공연을 검색하세요!"/>
                        <button class="main_search">검색</button>             
                </div>
            </div>
	<script>
	function enterkey() {
	    if (window.event.keyCode == 13) {
	
	    	if ($('.main_searchInput').val() == "") {
				alert("입력 해주세요");
			} else {
				
				var a = $('.main_searchInput').val();
					
				location.href = "${pageContext.request.contextPath}/search/search.do?text="+a;
			}
	    }
	}
	
	$(function() {
			$('.main_search').on("click", function() {
				if ($('.main_searchInput').val() == "") {
					alert("입력 해주세요");
				} else {
					
					var a = $('.main_searchInput').val();
						
					location.href = "${pageContext.request.contextPath}/search/search.do?text="+a;
				}
			})
		})
		
	</script>
	<br /><br />
	<p class="list_total">총 ${totalContents}건의 게시물이 있습니다.</p>
	<hr />
	
	<div class="listArea">		
		<div class="list_container">
			<c:forEach items="${alist}" var="alist" varStatus="status">
				<div class="listArea">
				
					<img src="${alist.artImg}" onclick="Detail('${alist.artId}');">
					
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
	
	<script>
		function Detail(artId){
			location.href = "${pageContext.request.contextPath}/detail/detail.do?artId="+artId;
		}
	</script>
</body>

</html>