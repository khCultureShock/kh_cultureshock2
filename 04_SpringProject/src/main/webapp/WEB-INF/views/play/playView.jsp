<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 상세보기</title>
	<c:import url="../common/header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/write.css" />
	<style>
		div#play-container{width:1500px; margin:0 auto; text-align:center;}
		div#play-container input,div#play-container button{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#play-container label.custom-file-label{text-align:left;}
		textarea {width: 600px; height: 300px;}
	</style>
	<script>
		/* function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/play/fileDownload.do?oName="+oName+"&rName="+rName;
		} */
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<div id="play-container">
		 <table id="tbl-play" class="table table-striped table-hover">
					<%-- <tr>
						<th>번호</th>
						<th>포스터</th>
						<th>제목</th>
						<th>지역</th>
						<!-- <th>첨부파일</th> -->
					</tr>
					<tr id="${a.artNo}">
						<td>${a.artNo}</td>
						<td><img src="'+ ${a.artImg} +'">
						<!-- <img src=${a.artImg} alt="" width="200" height="300"> -->
						<img src="${a.artImg}" width="150" height="200">
						</td>
						<td>${a.artTitle}</td>
						<td>${a.artArea}</td>
					</tr> --%>
					
					<td >제목</td>
                    <tr>
                        <td>
                            ${play.artTitle}
                        </td>
                    </tr>
                </tr>
                
                <tr>
                    <td>지역</td>
                        <tr>
                             <td>
                             ${play.artArea}
                            </td>
                        </tr>
                </tr>
				</table>
            <br /><br />
		    <%-- <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/play/playList.do'">돌아가기</button>
		    <c:if test="${member.userId eq play.playWriter}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/play/playUpdateView.do?playNo=${play.playNo}'">수정</button>
			</c:if> --%>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>