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
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input,div#board-container button{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		textarea {width: 600px; height: 300px;}
	</style>
	<script>
		function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
		}
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<div id="board-container">
		 <td>
           <hr>
             <h1>게시글</h1>
           <hr>
         </td>
		<tr>
                <td class="title">제목</td>
                    <tr>
                        <td>
                            <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle }" required>
                        </td>
                    </tr>
                </tr>
                
                <tr>
                    <td class="write">작성자</td>
                        <tr>
                             <td>
                                <input type="text" class="form-control" name="boardWriter" value="${board.boardWriter}" readonly required>
                            </td>
                        </tr>
                </tr>

		
			<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<tr>
					<td class="nput-group mb-3">첨부파일</td>
						<button type="button" 
								class="btn btn-outline-success btn-block"
								onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');">
							첨부파일${vs.count} - ${a.originalFileName }
						</button>
					</c:forEach>
				</tr>
			<br />
			   <tr>
                <td class="text">내용</td>
                    <tr>
                        <td>
                             <textarea class="form-control" name="boardContent" placeholder="내용" required>${board.boardContent }</textarea>
                        </td>
                    </tr>
                </tr>
            <br /><br />
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardList.do'">돌아가기</button>
		    <c:if test="${member.userId eq board.boardWriter}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?boardNo=${board.boardNo}'">수정</button>
			</c:if>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>