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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css" />
</head>
<body>
	<c:import url="views/common/header.jsp"/>
	<c:import url="views/common/menubar.jsp"/>
	
		<section id="content">		
		
			<!--div{$번째 영역}*3-->
			<div class="firstPar">
			   
			</div>
			
			<div style="height:60px;"> <hr style="margin-top:28px;"/> </div>
			
			<div class="secondPar">
				<a href="${pageContext.request.contextPath}/calendar/selectCalendarList.do">
					<img src="${pageContext.request.contextPath }/resources/images/calendar.png"" alt="달력"> <!-- 링크 필요 -->
				</a> 
			</div>
			
			<div style="height:60px;"> <hr style="margin-top:32px;"/> </div>
			
			<div class="thirdPar">
					<div class="noticeThumbnail">
						<a href="">
							<img src="${pageContext.request.contextPath }/resources/images/notice1.png"" alt="공지사항1"> <!-- 링크 필요 -->
						</a> 
						<br />
                        <a href="/perform/performView.do?uci=G7061634197082232" title="공지1 이동" class="test1" style="li">
                            <span class="blink">HOT!</span> &nbsp;공지1 공지 내용</a> <!-- 링크 변경 필요 -->
                        <br />
                        <a href="/perform/performView.do?uci=G7061635813646205" title="공지2 이동" class="test1">
                            <span class="blink">HOT!</span> &nbsp;공지2 공지 내용</a> <!-- 링크 변경 필요 -->
                        <br />
                        <a href="/perform/performView.do?uci=G7061635813718017" title="공지3 이동" class="test1">
                        <span class="blink">HOT!</span> &nbsp;공지3 공지 내용</a> <!-- 링크 변경 필요 -->
					</div>
					&nbsp;&nbsp;
					<div class="noticeThumbnail">
						<a href="">
							<img src="${pageContext.request.contextPath }/resources/images/notice2.png"" alt="공지사항2"> <!-- 링크 필요 -->
						</a>
						<br />
                        <a href="/perform/performView.do?uci=G7061634197082232" title="공지4 이동" class="test1">
                            <span class="blink">HOT!</span> &nbsp;공지4 공지 내용</a> <!-- 링크 변경 필요 -->
                        <br />
                        <a href="/perform/performView.do?uci=G7061635813646205" title="공지5 이동" class="test1">
                            <span class="blink">HOT!</span> &nbsp;공지5 공지 내용</a> <!-- 링크 변경 필요 -->
                        <br />
                        <a href="/perform/performView.do?uci=G7061635813718017" title="공지6 이동" class="test1">
                            <span class="blink">HOT!</span> &nbsp;공지6 공지 내용</a> <!-- 링크 변경 필요 -->
					</div>    	
			</div>
		</section>
			
		<c:import url="views/common/footer.jsp"/>
</body>

<script>
$(function(){
    $.ajax({ // 컨트롤러와 통신
        type: 'POST',
        url: "${pageContext.request.contextPath}/art/art.do",
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
                    + '<img src="'+ art.artImg +'")" onclick="Detail('+'\''+ art.artId +'\''+');">'
                    + '</div>'
                    + '<div class="art-title">'
                    + '<button class="art-button" onclick="location.href="detail/detail.do""><h6 class="art-title-font">' + art.artTitle + '</h6></button>' 
                    + '</div></div>'
            }
           
            $('.firstPar').html(result);
            
        },  error: function(error) {
            alert("오류");
            console.log(error);
        },
        
    });
 });
 
 function Detail(artId){
						location.href = "${pageContext.request.contextPath}/detail/detail.do?artId="+artId; 
					   }
 
//<a href="${pageContext.request.contextPath}/poster/Notredame.do" style="margin-left:45px;">노트르담 드 파리</a> <!-- 링크 변경 적용 필요 -->

</script>

<!-- onclick="Detail('${art.artId}');"  -->
<!-- 		function Detail(artId){
			location.href = "${pageContext.request.contextPath}/detail/detail.do?artId="+artId;
		} -->

</html>