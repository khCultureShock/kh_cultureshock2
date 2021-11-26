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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/show.css" />
</head>
<body>
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/menubar.jsp"/>
	
		<section id="content">		
		
			<!--div{$번째 영역}*3-->
			<div class="show">
			   
			</div>
			
		</section>
			
		<c:import url="../common/footer.jsp"/>
</body>

<script>
$(function(){
    $.ajax({ // 컨트롤러와 통신
        type: 'POST',
        url: "${pageContext.request.contextPath}/show/show.do",
        contentType: "application/json; charset=UTF-8",
        async: false,
        success: function(data) {
           
            console.log(data);
            result = "";
            for(var i in data){
                var art = data[i];
                result 
                    += '<div class="art">'
                    + '<div class="art-img">'
                    + '<img src="'+ art.artImg +'">'
                    + '</div>'
                    + '<div class="art-title">'
                    + '<button class="art-button" onclick="location.href="detail/detail.do?""><h6 class="art-title-font">' + art.artTitle + '</h6></button>' 
                    + '</div></div>'
            }
 				
            $('.show').html(result);
            
        },  error: function(error) {
            alert("오류");
            console.log(error);
        },
    });
 });
 
//<a href="${pageContext.request.contextPath}/poster/Notredame.do" style="margin-left:45px;">노트르담 드 파리</a> <!-- 링크 변경 적용 필요 -->

</script>

</html>