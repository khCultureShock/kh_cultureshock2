<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 수정</title>
	<c:import url="../common/header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/write.css" />
	<style>
		div#board-container{width:400px; margin:0 auto; text-align:center;}
		div#board-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
	</style>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=boardContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
	
	/*부트스트랩 : file 변경시 파일명 보이기 */
	$(function(){
		$('[name=upFile]').on('change',function(){
		    //var fileName = $(this).val();//C:\fakepath\파일명
		    //var fileName = this.files[0].name;//파일명(javascript)
		    //var fileName = $(this)[0].files[0].name;//파일명(jquery)
		    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
			//console.log($(this).prop('files'));//FileList {0: File(54955), length: 1}
		    console.log($(this).val());
		    $(this).next('.custom-file-label').html(fileName);
		})
	});
	
	function fileDownload(oName, rName){
		//한글파일명이 있을 수 있으므로, 명시적으로 encoding
		oName = encodeURIComponent(oName);
		location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
	}

	function fileDelete(obj, attNo, rName){
		$.ajax({
			url : '${pageContext.request.contextPath}/board/fileDelete.do',
			data : { attNo : attNo, rName : rName }, 
			dataType : 'json',
			success : function(data){
				if(data == true) {
					alert("첨부파일 삭제 완료!");
					$(obj).parent().remove();
				} else {
					alert("첨부파일 삭제 실패!");
				}
			}, error : function(req, status, error){
				console.log(req);
				console.log(status);
				console.log(error);
			}
		});
	}
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<div id="board-container">
			<form name="boardFrm" action="${pageContext.request.contextPath}/board/boardUpdate.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
			<td>
                <hr>
                <h1>게시글 수정</h1>
                <hr>
            </td>
				<input type="hidden" name="boardNo" value="${ board.boardNo }" />
			 <tr>
                <td class="title">제목</td>
                    <tr>
                        <td>
                            <input type="text" class="form-control" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle}" required>
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
					<div class="rows">
						<button type="button" class="btn btn-outline-success col-8"
							onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');" download>
						첨부파일${vs.count} - ${a.originalFileName }
					</button>
					<button type="button" class="btn btn-outline-danger col-3"
							onclick="fileDelete(this, '${a.attachmentNo}', '${a.renamedFileName }');">파일 삭제</button>
					</div>
				</c:forEach>
                <tr>
                 <td class="nput-group mb-3">첨부파일</td>
                    <tr>
                        <td >
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
                                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                                </div>
                        </td>
                    </tr>
                    </tr>
                   
            </tr>
            <br /><br />
            <tr>
                <td class="text">내용</td>
                    <tr>
                        <td>
                            <textarea class="form-control" name="boardContent" placeholder="내용" required>${board.boardContent}</textarea>
                        </td>
                    </tr>
                </tr>
				<br />
				<input type="submit" class="btn btn-outline-success" value="수정" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-outline-danger" value="삭제" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?boardNo=${board.boardNo}'"/>
			</form>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>