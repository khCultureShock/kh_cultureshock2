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
		
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/logo.png" />
		
</head>
<body>
	<c:import url="views/common/header.jsp"/>
	<c:import url="views/common/menubar.jsp"/>
	
		<section id="content">		
		
			<!--div{$번째 영역}*3-->
			<br /><br />
			<div class="firstPar">
			   
			</div>
			
			<div style="height:70px;"> <hr style="margin-top:28px; border: none;"/> </div>
			
			<div class="secondPar">
			<br />
				<a href="${pageContext.request.contextPath}/calendar/selectCalendarList.do">
					<img src="${pageContext.request.contextPath }/resources/images/nov.png""  width=900px height=400px alt="달력"> <!-- 링크 필요 -->
				</a> 
			</div>
			
			<div style="height:20px;"> <hr style="margin-top:32px; border: none;"/> </div>
			
				<div class="thirdPar">
						<div class="noticeThumbnail">
							<a href="${pageContext.request.contextPath}/notice/noticeList.do">
								<img src="${pageContext.request.contextPath }/resources/images/notice.jpg" alt="공지사항" > <!-- 링크 필요 -->
							</a> 
						</div>
						<div class="noticeThumbnail">
							<a href="${pageContext.request.contextPath}/board/boardList.do">
								<img src="${pageContext.request.contextPath }/resources/images/board.jpg" alt="자유게시판"> <!-- 링크 필요 -->
							</a>
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
                    + '<button class="art-button" onclick="location.href="detail/detail.do"" style="background-color: rgb(255, 243, 184); color: rgb(35, 189, 247);"><h6 class="art-title-font">' + art.artTitle + '</h6></button>' 
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