<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Culture Shock4</title>
	<c:import url="views/common/header.jsp"/>
</head>
<body>
	<div id="container">
		<c:import url="views/common/menubar.jsp"/>
		<section id="content">
		
			<div style="height:220px; width:1100px; margin-left:22%; margin-top:20px;">
				    <div style="width:53px; height:53px; padding-top:50px; display:inline-block;">
				    	<button style="margin-top:50px; border: 1px; background-color:white;" 
				    	        type="button" onclick=function();> 
				    		<img src="${pageContext.request.contextPath }/resources/images/left.png"" alt="왼쪽 화살표" /> <br /> <!-- ajax 적용 필요 -->
				    	</button>
				    </div>
					&nbsp;
					<div style="height:220px; width:200px; display:inline-block;">
						<a href="${pageContext.request.contextPath}/poster/Notredame.do" style="margin-left:5px;">					<!-- 링크 변경 필요 -->
							<img src="${pageContext.request.contextPath }/resources/images/Notredame.png"" alt="노트르담 포스터" /> 
						</a>
						<br />
						<a href="${pageContext.request.contextPath}/poster/Notredame.do" style="margin-left:45px;">노트르담 드 파리</a> <!-- 링크 변경 적용 필요 -->
						<p style="font-size:small; margin-left:25px;">서울ㅣ세종문화회관ㅣ0.39km <br /> 2021-11-17 ~ 2021-12-05</p>
					</div>
					&nbsp;
					<div style="height:220px; width:200px; display:inline-block;">
						<a href="${pageContext.request.contextPath}/poster/BurningField.do" style="margin-left:10px;">				<!-- 링크 변경 필요 -->
							<img src="${pageContext.request.contextPath }/resources/images/BurningField.png"" alt="버닝필드 포스터" /> 
						</a>
						<br />
						<a href="${pageContext.request.contextPath}/poster/BurningField.do" style="margin-left:70px;">버닝 필드</a> <!-- 링크 변경 필요 -->
						<p style="font-size:small; width:200px;">서울ㅣ세종문화회관S씨어터ㅣ0.4km <br />&nbsp;&nbsp; 2021-11-18 ~ 2021-11-21</p>
					</div>
					&nbsp;
					<div style="height:220px; width:200px; display:inline-block;">
						<a href="${pageContext.request.contextPath}/poster/NowAndThen.do" style="margin-left:5px;">				<!-- 링크 변경 필요 -->
							<img src="${pageContext.request.contextPath }/resources/images/NowAndThen.png"" alt="Now and Then 포스터" /> 
						</a>
						<br />
						<a href="${pageContext.request.contextPath}/poster/NowAndThen.do" style="margin-left:45px;">Now and Then</a> <!-- 링크 변경 필요 -->
						<p style="font-size:small;width:200px;">서울ㅣ세종문화회관S씨어터ㅣ0.4km <br />&nbsp;&nbsp;  2021-11-13 ~ 2021-11-14</p>
					</div>
					&nbsp;
					<div style="height:220px; width:200px; display:inline-block;">
						<a href="${pageContext.request.contextPath}/poster/TheTopping.do" style="margin-left:5px;">				<!-- 링크 변경 필요 -->
							<img src="${pageContext.request.contextPath }/resources/images/TheTopping.png"" alt="The Topping 포스터" /> 
						</a>
						<br />
						<a href="${pageContext.request.contextPath}/poster/TheTopping.do" style="margin-left:55px;">The Topping</a> <!-- 링크 변경 필요 -->
						<p style="font-size:small; width:200px;">서울ㅣ세종문화회관S씨어터ㅣ0.4km <br />&nbsp;&nbsp;   2021-12-02 ~ 2021-12-04</p>
					</div>
					&nbsp;&nbsp;
					<div style="width:53px; height:53px; margin-left:8px; display:inline-block;">
						<button style="border: 1px; background-color:white;" 
						        type="button" onclick=function();> 
				    		<img src="${pageContext.request.contextPath }/resources/images/right.png"" alt="오른쪽 화살표" /> <br /> <!-- ajax 적용 필요 -->
				    	</button>
					</div>
			</div>
			
			<br /><br /><br /><br />
			
			<div style="height:200px; width:1000px; margin-left:26%; margin-top:20px;">
				<a href="${pageContext.request.contextPath}/calendar/selectCalendarList.do">
					<img src="${pageContext.request.contextPath }/resources/images/calendar.png"" alt="달력"> <!-- 링크 필요 -->
				</a> 
			</div>
			
			<br /><br />
			
			<span style="height:200px; width:1000px; margin-left:25%; margin-top:20px;">				
					<div style="width:500px; height:200px; display:inline-block;">
						<a href="">
							<img src="${pageContext.request.contextPath }/resources/images/notice1.png"" alt="공지사항1"> <!-- 링크 필요 -->
						</a> 
						<br />
                                <a href="/perform/performView.do?uci=G7061634197082232" title="공지1 이동" class="test1" style="li">
                                <span class="blink" style="animation: blink 3s both; animation-iteration-count: infinite; color: #007bff;">HOT!</span> &nbsp;공지1 공지 내용</a> <!-- 링크 변경 필요 -->
                              	<br />
                                <a href="/perform/performView.do?uci=G7061635813646205" title="공지2 이동" class="test1">
                                <span class="blink" style="animation: blink 3s both; animation-iteration-count: infinite; color: #007bff;">HOT!</span> &nbsp;공지2 공지 내용</a> <!-- 링크 변경 필요 -->
                              	<br />
                                <a href="/perform/performView.do?uci=G7061635813718017" title="공지3 이동" class="test1">
                                <span class="blink" style="animation: blink 3s both; animation-iteration-count: infinite; color: #007bff;">HOT!</span> &nbsp;공지3 공지 내용</a> <!-- 링크 변경 필요 -->
					</div>
					&nbsp;&nbsp;
					<div style="width:500px; height:200px; display:inline-block;">
						<a href="">
							<img src="${pageContext.request.contextPath }/resources/images/notice2.png"" alt="공지사항2"> <!-- 링크 필요 -->
						</a>
						<br />
                                <a href="/perform/performView.do?uci=G7061634197082232" title="공지4 이동" class="test1">
                                <span class="blink" style="animation: blink 3s both; animation-iteration-count: infinite; color: #007bff;">HOT!</span> &nbsp;공지4 공지 내용</a> <!-- 링크 변경 필요 -->
                             	<br />
                                <a href="/perform/performView.do?uci=G7061635813646205" title="공지5 이동" class="test1">
                                <span class="blink" style="animation: blink 3s both; animation-iteration-count: infinite; color: #007bff;">HOT!</span> &nbsp;공지5 공지 내용</a> <!-- 링크 변경 필요 -->
                               	<br />
                                <a href="/perform/performView.do?uci=G7061635813718017" title="공지6 이동" class="test1">
                                <span class="blink" style="animation: blink 3s both; animation-iteration-count: infinite; color: #007bff;">HOT!</span> &nbsp;공지6 공지 내용</a> <!-- 링크 변경 필요 -->
					</div>    	
			</span>
		
		</section>
		<c:import url="views/common/footer.jsp"/>
	</div>
</body>

<script>
	function(){
		<!-- 게시판 함수 필요 -->
	}

	function(){
		<!-- 지도 함수 필요 -->
	}
	
	function(){
		<!-- 지역별 함수 필요 -->
	}
	
	function(){
		<!-- 종류별 함수 필요 -->
	}

	function(){
		<!-- 왼쪽 화살표 ajax 적용 필요 -->
	}
	
	function(){
		<!-- 오른쪽 화살표 ajax 적용 필요 -->
	}

	/*
	
	ajax 참고 예시 
	1. 04_SpringProject memberEnroll.jsp
	
	$(function(){
		
		$("#password2").blur(function(){
			var p1=$("#password_").val(), p2=$("#password2").val();
			if(p1!=p2){
				alert("패스워드가 일치하지 않습니다.");
				$("#password_").focus();
			}
		});
		
		/* 아이디 중복검사 이벤트 추가 */
		/*
		$("#userId_").on("keyup", function(){
	        var userId = $(this).val().trim();
	        
	        if(userId.length<4) {
	        	$(".guide.error").hide();
	        	$(".guide.ok").hide();
	        	$(".guide.invalid").show();
	        	return;
	        	
	        } else {
	        	
		        $.ajax({
		            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
		            data : {userId:userId},
		            dataType: "json",
		            success : function(data){
		                console.log(data);
		                 //if(data==true) {//stream 방식
		                 
		                if(data.isUsable==true){ //viewName 방식
		                    $(".guide.error").hide();
		                    $(".guide.invalid").hide();
		                    $(".guide.ok").show();
		                    $("#idDuplicateCheck").val(1);
		                } else {
		                    $(".guide.error").show();
		                    $(".guide.invalid").hide();
		                    $(".guide.ok").hide();
		                    $("#idDuplicateCheck").val(0);
		                }
		            }, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		                //에러로그
		                console.log(jqxhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		            }
	        	});
	     	}
	     //console.log(userId);
		});
	});
	
	ajax 참고 예시 
	2. semiProject index.jsp
	
	   function logCheck() {
        $.ajax({
          url :'${pageContext.request.contextPath}/login.do',
          data: { userId : $('#userId').val(),
                  userPwd : $('#userPwd').val()},
          success : function(data){
            if( data == 1) {
              location.replace('views/main/realMain.jsp');
              alert("로그인 성공!");
            } else if( data == 2) {
              location.replace('views/admin/index.jsp');
              alert("로그인 성공!");

            }else{
              alert("로그인 실패!");
              location.replace('index.jsp');
            }
          }, error : function( data ) {

          }
        });
    }
	*/
	
	
</script>

</html>