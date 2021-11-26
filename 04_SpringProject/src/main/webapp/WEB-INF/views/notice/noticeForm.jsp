<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
	<c:import url="../common/header.jsp"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/write.css" />
	<style>
		div#notice-container{width:400px; margin:0 auto; text-align:center;}
		div#notice-container input{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#notice-container label.custom-file-label{text-align:left;}
	</style>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=noticeContent]").val();
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
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<div id="notice-container">
			<form name="noticeFrm" action="${pageContext.request.contextPath}/notice/noticeFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
            <td>
                <hr>
                <h1>게시글 작성</h1>
                <hr>
            </td>
            
            <tr>
                <td class="title">제목</td>
                    <tr>
                        <td>
                            <input type="text" class="form-control" placeholder="제목입력" name="noticeTitle" id="noticeTitle" required>
                        </td>
                    </tr>
                </tr>
                
                <tr>
                    <td class="write">작성자</td>
                        <tr>
                             <td>
                                <input type="text" class="form-control" name="noticeWriter" value="${member.userId}" readonly required>
                            </td>
                        </tr>
                </tr>
                
                <tr>
                 <!-- <td class="nput-group mb-3">첨부파일</td>
                    <tr>
                        <td >
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
                                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
                                </div>
                        </td> -->
                    </tr>
                    </tr>
                   
            </tr>
            <br /><br />
            <tr>
                <td class="text">내용</td>
                    <tr>
                        <td>
                            <textarea class="form-control" name="noticeContent" placeholder="내용입력" required></textarea>
                        </td>
                    </tr>
                </tr>
        
        <br /><br /><br />   
        <p align="middle">
            <input type="submit" class="btn btn-outline-success" value="등록" >
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" class="btn btn-outline-info" onclick="location.href='${pageContext.request.contextPath}/notice/noticeList.do'" value="취소" >
        </p>
	</form>
	</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>