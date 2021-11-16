<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.spring.demo.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% Dev dev = (Dev)request.getAttribute("dev");%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Dev 수정</title>
	<c:import url="../common/header.jsp"/>
	<style>
		div#demo-container{
			width:40%;
			padding:15px;
			margin:0 auto;
			border:1px solid lightgray;
			border-radius: 10px;
		}
	</style>
</head>
<body>
	<div id="container">
	<c:import url="../common/menubar.jsp"/>
		<div id="demo-container">
			<!-- https://getbootstrap.com/docs/4.1/components/forms/#readonly-plain-text -->
			<form id="devFrm" method="post" action="${pageContext.request.contextPath}/demo/updateDevEnd.do">
			  <!-- 이름 -->
			  <div class="form-group row">
			    <label for="devName" class="col-sm-2">이름</label>
			    <input type="text" class="form-control col-sm-8" id="devName" name="devName" placeholder="이름" value="${dev.devName}" required/>
			  </div>
			  <!-- 이름 -->
			  <div class="form-group row">
			    <label for="devAge" class="col-sm-2">나이</label>
			    <input type="number" class="form-control col-sm-8" id="devAge" name="devAge" value="${dev.devAge}" placeholder="나이" required/>
			  </div>
			  <!-- 이메일 -->
			  <div class="form-group row">
			    <label for="devEmail" class="col-sm-2">이메일</label>
			    <input type="email" class="form-control col-sm-8" id="devEmail" name="devEmail" value="${dev.devEmail}" placeholder="이메일" required/>
			  </div>
			  <!-- 성별 -->
			  <div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="devGender" id="gender-m" value="M" ${dev.devGender=='M'?"checked":"" }>
				  <label class="form-check-label" for="gender-m">남</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="devGender" id="gender-f" value="F" ${dev.devGender=='F'?"checked":"" }>
				  <label class="form-check-label" for="gender-f">여</label>
				</div>
			  </div>
			 <!--  개발가능언어 -->
			  <div class="form-group row">
			    <label class="col-sm-2">개발가능<br>언어</label>
			    <div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" id="Java" name="devLang" value="Java" <%=Arrays.asList(dev.getDevLang()).contains("Java")?"checked":"" %>>
				  <label class="form-check-label" for="Java">Java</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" id="C" name="devLang"  value="C" <%=Arrays.asList(dev.getDevLang()).contains("C")?"checked":"" %>/>
				  <label class="form-check-label" for="C">C</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" id="Javascript" name="devLang" value="Javascript" <%=Arrays.asList(dev.getDevLang()).contains("Javascript")?"checked":"" %>/>
				  <label class="form-check-label" for="Javascript">Javascript</label>
				</div>
			  </div>
			  <!-- 중요 - 수정시 반드시 고유번호도 함께 넘겨주어야 함 -->
			  <input type="hidden" name="devNo" value="${dev.devNo}" />
			  <button type="submit" onclick="return validate();" class="list-group-item list-group-item-action">dev 수정</button>
			</form>
		</div>
<script>
function validate(){
	//required속성은 form안에 제출버튼이 있는 경우 유효함.
 	//폼밖에서 제출하는 경우 별도의 validation메소드가 필요함.
	if($("#devName").val().trim().length==0){
		alert("이름을 작성하세요");
		return false;
	}
	
	//클라이언트단 유효성검사
	if($("[name=devLang]:checked").length==0){
		alert("하나이상의 개발언어를 선택하세요.")
		return false;
	}
	
	return true;
}
</script>
<c:import url="../common/footer.jsp"/>
</div>
</body>
</html>