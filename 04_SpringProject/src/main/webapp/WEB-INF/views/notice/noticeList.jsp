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
		function fn_goNoticeForm(){
			location.href = "${pageContext.request.contextPath}/notice/noticeForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var noticeNo = $(this).attr("id");
				console.log("noticeNo="+noticeNo);
				location.href = "${pageContext.request.contextPath}/notice/noticeView.do?no="+noticeNo;
			});
		});
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
			<section id="notice-container" class="container">
			<br /><br />
				<p>Culture Shock 공지사항 입니다.</p>
				<p>총 ${totalContents }건의 게시물이 있습니다.</p>
				<c:if test="${member.userStatus == 1}">
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goNoticeForm();"/>
				</c:if>
				<table id="tbl-notice" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<!-- <th>첨부파일</th> -->
						<th>조회수</th>
					</tr>
					<c:forEach items="${list}" var="n"> 
					<tr id="${n.noticeNo}">
						<td>${n.noticeNo}</td>
						<td>${n.noticeTitle}</td>
						<td>${n.noticeWriter}</td>
						<td>${n.noticeDate}</td>
						<%-- <td align="center">
							<c:if test="${b.fileCount>0}">
								<img alt="첨부파일" src="${pageContext.request.contextPath}/resources/images/file.png" width=16px>
							</c:if>
						</td> --%>
						<td>${n.noticeReadCount }</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>