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

<script>
$(function(){

    $("#btnList").click(function(){
        location.href="${path}/wish/wishList";
    });

});

function Detail(artId){
	location.href = "${pageContext.request.contextPath}/detail/detail.do?artId="+artId; 
   }
</script>

<style>
body, html, section{
	min-height: 100%
}
</style>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/category.css" />
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/menubar.jsp"/>

	<section>
	
	
	 
	
	<c:choose>
    <c:when test="${map.count == 0 }">
    <!-- when은 ~~일때 라는 뜻 그러니까 map의 count가 0일때... -->
    <!-- xml파일에서 hashmap에 list를 넣어놓았기 때문에 현재 map에 자료가 들어있다.  -->
    <!-- map에 자료가 아무것도 없다면 -->
        WishList가 비었습니다.
    </c:when>
    
    <c:otherwise>
    <!-- map.count가 0이 아닐때, 즉 자료가 있을때 -->
    <!-- form을 실행한다.  -->
    <table id="tbl-play" class="table table-striped table-hover">
					<tr>
						<th>번호</th>
						<th>포스터</th>
						<th>제목</th>
						<th>장르</th>
						<th>지역</th>
						<th>&nbsp;</th>
					</tr>
					<c:forEach items="${map.list}" var="a"> 
					<tr id="${a.artNo}">
						<td>${a.artNo}</td>
						<td>
						<img src="${a.artImg}" width="100" height="150" onclick="Detail('${a.wishArtId}');">
						
						</td>
						<td>${a.artTitle}</td>
						<td>${a.artGenre}</td>
						<td>${a.artArea}</td>
						<td><a href=
							"${path}/spring/wish/delete.do?wishId=${a.wishId}">
							<img src="${pageContext.request.contextPath }/resources/images/delete.png" alt="del" width="25px" height="25px"/>
							</a>

                    	</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section> 
    </c:otherwise>
</c:choose>
	
	<c:import url="../common/footer.jsp"/>
</body>

</html>