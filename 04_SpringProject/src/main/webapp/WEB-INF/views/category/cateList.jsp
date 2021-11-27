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
		body, html, section{ min-height: 100%;}
		ul {
				text-align : center; 
				justify-content: center;
				font-size: 20px;
				color: black;
				padding-right: 400px;
				color : rgb(213, 157, 113);
			}

		.nav-link1 {color : rgb(213, 157, 113); }
</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/category.css" />
	
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/menubar.jsp"/>

	<section>
	<nav class="navbar navbar-expand-lg navbar-light">
	<a class="navbar-brand" href="${pageContext.request.contextPath}"></a>

            <div class="modal_cateDiv" id="navbarNav">
          <ul class="navbar-nav mr-auto">
           <li class="nav-item">
              <a href="${pageContext.request.contextPath}/category/cateList.do?artGenre=연극" class="nav-link1">연극</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/category/cateList.do?artGenre=뮤지컬" class="nav-link1">뮤지컬</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/category/cateList.do?artGenre=클래식" class="nav-link1">클래식</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/category/cateList.do?artGenre=오페라" class="nav-link1">오페라</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/category/cateList.do?artGenre=무용" class="nav-link1">무용</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/category/cateList.do?artGenre=국악" class="nav-link1">국악</a>
           </li>
        
          </ul>
    	</div>
    	</nav>
	<script>
		function fn_goPlayForm(){
			location.href = "${pageContext.request.contextPath}/play/playForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var artNo = $(this).attr("id");
				console.log("artNo="+artNo);
				location.href = "${pageContext.request.contextPath}/play/playView.do?no="+artNo;
			});
		});
		
		function Detail(artId){
			location.href = "${pageContext.request.contextPath}/detail/detail.do?artId="+artId; 
		   }
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
</body>

</html>s