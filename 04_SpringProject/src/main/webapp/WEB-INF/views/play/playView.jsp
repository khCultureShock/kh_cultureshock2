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

</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<div id="play-container">
		 <table id="tbl-play" class="table table-striped table-hover">
					
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
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>