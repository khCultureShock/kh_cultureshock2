<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>개발자 등록(Demo)</title>
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
	<form id="devFrm">
		<div class="form-group row">
		  <label for="devName" class="col-sm-2 col-form-label">이름</label>
		  <div class="col-sm-10">
		    <input type="text" class="form-control" id="devName" name="devName">
		  </div>
		</div>
		<div class="form-group row">
		  <label for="devAge" class="col-sm-2 col-form-label">나이</label>
		  <div class="col-sm-10">
		    <input type="number" class="form-control" id="devAge" name="devAge">
		  </div>
		</div>
		<div class="form-group row">
		  <label for="devEmail" class="col-sm-2 col-form-label">이메일</label>
		  <div class="col-sm-10">
		    <input type="email" class="form-control" id="devEmail" name="devEmail">
		  </div>
		</div>
	  	<!-- https://getbootstrap.com/docs/4.1/components/forms/#inline -->
	    <div class="form-group row">
	    	<label class="col-sm-2 col-form-label">성별</label>
	    	<div class="col-sm-10">
			    <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="devGender" id="devGender0" value="M">
				  <label class="form-check-label" for="devGender0">남</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="devGender" id="devGender1" value="F">
				  <label class="form-check-label" for="devGender1">여</label>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">개발언어</label>
			<div class="col-sm-10">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="devLang" id="Java" value="Java">
				  <label class="form-check-label" for="Java">Java</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="devLang" id="C" value="C">
				  <label class="form-check-label" for="C">C</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="checkbox" name="devLang" id="Javascript" value="Javascript">
				  <label class="form-check-label" for="Javascript">Javascript</label>
				</div>
			</div>
		</div>
	</form>
	<!-- 전송버튼  -->
	<div class="list-group">
	  <button type="button" onclick="demo1();" class="list-group-item list-group-item-action">파라미터 핸들링 - HttpServletRequest</button>
	  <button type="button" onclick="demo2();" class="list-group-item list-group-item-action">파라미터 핸들링 - RequestParam</button>
	  <button type="button" onclick="demo3();" class="list-group-item list-group-item-action">파라미터 핸들링 - VO</button>
	  <button type="button" onclick="insertDev();" class="list-group-item list-group-item-action">dev 등록</button>
	</div>
</div>
	<c:import url="../common/footer.jsp"/>
</div>

<script>
function demo1(){
	$("#devFrm").attr("action","${pageContext.request.contextPath}/demo/demo1.do");
	$("#devFrm").submit();
}
function demo2(){
	$("#devFrm").attr("action","${pageContext.request.contextPath}/demo/demo2.do");
	$("#devFrm").submit();
}
function demo3(){
	$("#devFrm").attr("action","${pageContext.request.contextPath}/demo/demo3.do");
	$("#devFrm").submit();
}
function insertDev(){
	if(validate()==false) return;
	
	$("#devFrm").attr("action","${pageContext.request.contextPath}/demo/insertDev.do");
	$("#devFrm").attr("method","post");
	$("#devFrm").submit();
}

function validate(){
	//required속성은 form안에 제출버튼이 있는 경우 유효함.
 	//폼밖에서 제출하는 경우 별도의 validation메소드가 필요함.
	if($("#devName").val().trim().length==0){
		alert("이름을 작성하세요");
		return false;
	}
	
	//클라이언트단 유효성검사
	if($("[name=devLang]:checked").length==0){
		alert("하나 이상의 개발언어를 선택하세요.")
		return false;
	}
	
	return true;
}
</script>
</body>
</html>