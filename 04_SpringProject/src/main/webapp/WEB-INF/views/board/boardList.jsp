<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<c:import url="../common/header.jsp"/>
	<style>
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
	</style>
	<script>
		function fn_goBoardForm(){
			location.href = "${pageContext.request.contextPath}/board/boardForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var boardNo = $(this).attr("id");
				console.log("bordNo="+boardNo);
				location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+boardNo;
			});
		});
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
			<section id="board-container" class="container">
			<br /><br />
				<p>Culture Shock 자유 게시판 입니다.</p>
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm();"/>
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>첨부파일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${list}" var="b"> 
					<tr id="${b.boardNo}">
						<td>${b.boardNo}</td>
						<td>${b.boardTitle}</td>
						<td>${b.boardWriter}</td>
						<td>${b.boardDate}</td>
						<td align="center">
							<c:if test="${b.fileCount>0}">
								<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
							</c:if>
						</td>
						<td>${b.boardReadCount }</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>