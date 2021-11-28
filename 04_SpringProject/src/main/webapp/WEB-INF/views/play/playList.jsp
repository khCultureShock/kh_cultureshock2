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
		body, html, section{min-height: 100%}
		#navbarNav{magin-left:35%;}
		ul {
				font-size: 20px;
				padding-left: 100px;
			}
			a{
				color : rgb(213, 157, 113);
			}

	</style>
	<script>
		function fn_goPlayForm(){
			location.href = "${pageContext.request.contextPath}/play/playForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var artNo = $(this).attr("id");
				console.log("artNo="+artNo);
				location.href = "${pageContext.request.contextPath}/play/playTestView.do?no="+artNo;
			});
		});
	</script>
</head>
<body>
    
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
			<section id="play-container" class="container">
			<br />
			<nav class="navbar navbar-expand-lg navbar-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">   
      	</a>

            <div class="modal_cateDiv" id="navbarNav" style="text-align:center;">
          <ul class="navbar-nav mr-auto">
          	<li class="nav-item">
          	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
              <a href="${pageContext.request.contextPath}/play/playList.do?artArea=전체" class="nav-link1">전체</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${pageContext.request.contextPath}/play/playList.do?artArea=서울" class="nav-link1">서울</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/play/playList.do?artArea=경기" class="nav-link1">경기</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/play/playList.do?artArea=충청" class="nav-link1">충청</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/play/playList.do?artArea=강원" class="nav-link1">강원</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/play/playList.do?artArea=경상" class="nav-link1">경상</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/play/playList.do?artArea=전라" class="nav-link1">전라</a>
           </li>
           &nbsp;&nbsp;&nbsp;&nbsp;
           <li class="nav-item">
              <a href="${ pageContext.request.contextPath }/play/playList.do?artArea=제주 " class="nav-link1">제주</a>
           </li>
        
          </ul>
    	</div>
    	</nav>	
    	<br /><br />
				<p class="list_total">총 ${totalContents}건의 게시물이 있습니다.</p>
				<hr />
				
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
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>