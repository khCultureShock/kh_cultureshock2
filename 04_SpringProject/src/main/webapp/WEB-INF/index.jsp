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
			<img src="${pageContext.request.contextPath }/resources/images/rion.PNG" id="center-image" alt="스프링로고" />
		</section>
		<c:import url="views/common/footer.jsp"/>
	</div>
</body>
</html>