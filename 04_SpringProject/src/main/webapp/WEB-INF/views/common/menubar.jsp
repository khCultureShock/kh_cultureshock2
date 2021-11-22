<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<header>
	<div id="header-container">
		<h2>Culture Shock</h2>
	</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">
			<img src="${pageContext.request.contextPath }/resources/images/rion.PNG" alt="스프링로고" width="100px" height="50px"/>
		</a>
	  	<!-- 반응형으로 width 줄어들경우, collapse버튼관련 -->
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
	  	</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<!-- ul.mr-auto 설정이 없으면, 좌우정렬이 안됨 -->
			<ul class="navbar-nav mr-auto">
		      <!--<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}">Home</a></li>-->
		      <!-- 데모메뉴 DropDown변경 -->
			  <!--https://getbootstrap.com/docs/4.1/components/navbar/#supported-content-->
			  <!--<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				Demo
				</a>
			    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/demo/demo.do">Dev 등록</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/demo/selectDevList.do">Dev 목록</a>
				</div>
			  </li>-->
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				카테고리
				</a>
			    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/show/showView.do">지역별</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/play/playList.do">종류별</a>
				</div>
			  </li>
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				게시판
				</a>
			    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="${pageContext.request.contextPath}/notice/noticeList.do">공지사항</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/board/boardList.do">자유게시판</a>
				</div>
			  </li>
			   <li class="nav-item">
              <a href="${pageContext.request.contextPath}/map/mapView.do" class="nav-link">지도</a>
           </li>
		    </ul>
		   
			<!-- 로그인처리  -->
			<c:if test="${empty member}">
		        <!-- 로그인,회원가입 버튼 -->
		        <button class="btn btn-outline-success my-2 my-sm-0" type="button" data-toggle="modal" data-target="#loginModal">로그인</button>
		        &nbsp;
		        <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">회원가입</button>
		    </c:if>
		    <c:if test="${!empty member}">
		        <span><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}" title="내 정보보기">${member.userName}</a> 님, 안녕하세요</span>
		        &nbsp;
		        <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
		    </c:if>
		 </div>
	</nav>
	<!-- Modal시작 -->
	<!-- https://getbootstrap.com/docs/4.1/components/modal/#live-demo -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="loginModalLabel">로그인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
          <!--로그인폼 -->
          <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
          <form action="${pageContext.request.contextPath}/member/memberLogin.do" method="post">
	      <div class="modal-body">
			  <input type="text" class="form-control" name="userId" placeholder="아이디" required>
			    <br />
			    <input type="password" class="form-control" name="password" placeholder="비밀번호" required>
	      </div>
	      <div class="modal-footer">
	        <a data-toggle="modal" href="#findIdModal" data-dismiss="modal">아이디 찾기</a>
	        /
	        <a data-toggle="modal" href="#changePwModal" data-dismiss="modal">비밀번호 재설정</a>
	        <button type="submit" class="btn btn-outline-success">로그인</button>
	        <button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
	      </div>
		</form>
	    </div>
	  </div>
	</div>
	<!-- Modal 끝-->
	
	<!-- 아이디 찾기 모달 -->
	<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog"
                        aria-labelledby="findIdModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="findIdModalLabel">아이디 찾기</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <!-- 아이디 찾기 폼 -->
                                <!-- https://getbootstrap.com/docs/4.1/components/forms/#overview -->
                                <form action="${pageContext.request.contextPath}/member/findId.do" method="post">
                                    <div class="modal-body">
                                        <input type="text" class="form-control" name="userName" placeholder="이름을 입력하세요."
                                            required>
                                        <br />
                                        <input type="tel" class="form-control" name="phone" placeholder="('-' 없이) 핸드폰 번호를 입력하세요."
                                            required>
                                    </div>
                                    <div class="modal-footer">                                        
                                        <button type="submit" class="btn btn-outline-success">확인</button>
                                        <button type="return" class="btn btn-outline-success" data-dismiss="modal">취소</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>	
                    
	<!-- 아이디 찾기 모달 끝 -->
	
	<!-- 비밀번호 재설정 모달 -->
	<div class="modal fade" id="changePwModal" tabindex="-1" role="dialog"
                        aria-labelledby="changePwModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="changePwModalLabel">비밀번호 재설정</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                
                                
                                <form action="${pageContext.request.contextPath}/member/changePw.do" method="post">
                                    <div class="modal-body">
                                    	<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요."
                                            required>
                                            <br />
                                        <input type="password" class="form-control" id="password1" name="password1" placeholder="새 비밀번호를 입력하세요."
                                            required>
                                        <br />
                                        <input type="password" class="form-control" id="password2" name="password" placeholder="한번 더 입력하세요."
                                            required>
                                    </div>
                                    <div class="modal-footer">                                        
                                        <button type="submit" class="btn btn-outline-success">확인</button>
                                        <button type="return" class="btn btn-outline-success" data-dismiss="modal">취소</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>		
	<!-- 비밀번호 재설정 모달 끝 -->
	
	<script>
	
	$(function() {

		$("#password2").blur(
				function() {
					var p1 = $("#password1").val(), p2 = $("#password2").val();
					if (p1 != p2) {
						alert("패스워드가 일치하지 않습니다.");
						$("#password1").focus();
					}
				});
	});
	
	
	</script>
	
	
	
</header>





