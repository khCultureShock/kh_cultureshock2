<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>지역별 페이지</title>
	<c:import url="../common/header.jsp"/>
	<style>
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
	</style>
	<script>
		function fn_goPlayForm(){
			location.href = "${pageContext.request.contextPath}/play/playForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var artNo = $(this).attr("id");
				console.log("artNo="+artNo);
				location.href = "${pageContext.request.contextPath}/art/artView.do?no="+artNo;
			});
		});
	</script>
</head>
<body>
    
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
			<section id="play-container" class="container">
				<p>Culture Shock 지역별 페이지 입니다.</p>
				<p>총 ${totalContents }건의 게시물이 있습니다.</p>
				<table id="tbl-play" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>포스터</th>
						<th>제목</th>
						<th>지역</th>
						<!-- <th>첨부파일</th> -->
					</tr>
					<c:forEach items="${list}" var="a"> 
					<tr id="${a.artNo}">
						<td>${a.artNo}</td>
						<td><%-- <img src="'+ ${a.artImg} +'"> --%>
						<!-- <img src=${a.artImg} alt="" width="200" height="300"> -->
						<img src="${a.artImg}" width="150" height="200">
						</td>
						<td>${a.artTitle}</td>
						<td>${a.artArea}</td>
						<%-- <td align="center">
							<c:if test="${b.fileCount>0}">
								<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
							</c:if>
						</td> --%>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>