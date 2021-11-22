<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 창</title>
<c:import url="../common/header.jsp" />
<style>
div#enroll-container {
	width: 400px;
	margin: 0 auto;
	text-align: center;
}

div#enroll-container input, div#enroll-container select {
	margin-bottom: 10px;
}

div#enroll-container table th {
	text-align: right;
	padding-right: 10px;
}

div#enroll-container table td {
	text-align: left;
}
/*중복아이디체크관련*/
div#userId-container {
	position: relative;
	padding: 0px;
}

div#userId-container span.guide {
	display: none;
	font-size: 12px;
	position: absolute;
	top: 12px;
	right: 10px;
}

div#userId-container span.ok {
	color: green;
}

div#userId-container span.error, span.invalid {
	color: red;
}

.terms-div {
	position: relative;
	right: 200px;
	width: 800px;
	height: 500px;
	/* border: 1px solid pink;  */
}

.terms-div>textarea {
	width: 100%;
	height: 100%;
	white-space: nowrap;
	resize: none;
}

.btnZone {
	padding-top: 5em;
}
</style>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp" />
		<section id="content">
			<div id="enroll-container">
				<form name="memberEnrollFrm" action="memberEnrollEnd.do"
					method="post" onsubmit="return fn_enroll_validate();">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<div id="userId-container">
									<input type="text" class="form-control" placeholder="4글자이상"
										name="userId" id="userId_" required>
									<!-- 아이디중복검사 코멘트추가 -->
									<span class="guide ok">사용 가능</span> <span class="guide error">사용
										불가</span> <span class="guide invalid">4글자 미만</span> <input
										type="hidden" name="idDuplicateCheck" id="idDuplicateCheck"
										value="0" />
								</div>
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td><input type="password" class="form-control"
								name="password" id="password_" required></td>
						</tr>
						<tr>
							<th>패스워드확인</th>
							<td><input type="password" class="form-control"
								id="password2" required></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" class="form-control" name="userName"
								id="userName" required></td>
						</tr>
						<tr>
							<th>나이</th>
							<td><input type="number" class="form-control" name="age"
								id="age" required></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="email" class="form-control"
								placeholder="abc@xyz.com" name="email" id="email" required>
							</td>
						</tr>
						<tr>
							<th>휴대폰</th>
							<td><input type="tel" class="form-control"
								placeholder="(-없이)01012345678" name="phone" id="phone"
								maxlength="11" required></td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" name="gender"
										id="gender0" value="M" checked> <label for="gender0">남</label>
									<input type="radio" class="form-check-input" name="gender"
										id="gender1" value="F"> <label for="gender1">여</label>
								</div>
							</td>
						</tr>


					</table>

					<div class="terms-div">
						<textarea style="border: solid 2px LightSlateGrey;">
 가. 수집하는 개인정보의 항목
  첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 
  아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
 
 
  회원가입
  - 이름, 생년월일, 성별, 아이디, 비밀번호, 별명, 연락처(메일주소, 휴대폰 번호 중 선택), 가입인증정보
 
  만14세 미만 아동 회원가입
  - 이름, 생년월일, 성별, 법정대리인 정보, 아이디, 비밀번호,
    연락처 (메일주소, 휴대폰 번호 중 선택), 가입인증정보
 
  단체아이디 회원가입
  - 단체아이디, 회사명, 대표자명, 대표 전화번호, 대표 이메일 주소, 단체주소,
    관리자 아이디, 관리자 연락처, 관리자 부서/직위
  - 선택항목 : 대표 홈페이지, 대표 팩스번호
 
 
  둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
  - IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
 
 
  셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서
   해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며,
   이러한 경우 별도의 동의를 받습니다.
 
 
  넷째, 성인컨텐츠, 유료/게임 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우,
   아래와 같은 정보들이 수집될 수 있습니다.
  - 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI),
    휴대폰 번호(선택), 아이핀 번호(아이핀 이용시), 내/외국인 정보
 
 
  다섯째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
  - 신용카드 결제시 : 카드사명, 카드번호 등
  - 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
  - 계좌이체시 : 은행명, 계좌번호 등
  - 상품권 이용시 : 상품권 번호
 
 나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.
  - 홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
  - 협력회사로부터의 제공
  - 생성정보 수집 툴을 통한 수집
 </textarea>
						<input type="checkbox" id="reqChkBox" required> (필수) 개인정보 수집 및 이용에
						동의합니다.
					</div>
					<div class="btnZone">
						<input type="submit" class="btn btn-outline-success" value="가입">
						<input type="reset" class="btn btn-outline-danger" value="취소">
					</div>
				</form>
			</div>



			<script>
				$(function() {

					$("#password2").blur(
							function() {
								var p1 = $("#password_").val(), p2 = $(
										"#password2").val();
								if (p1 != p2) {
									alert("패스워드가 일치하지 않습니다.");
									$("#password_").focus();
								}
							});

					/* 아이디 중복검사 이벤트 추가 */
					$("#userId_")
							.on(
									"keyup",
									function() {
										var userId = $(this).val().trim();

										if (userId.length < 4) {
											$(".guide.error").hide();
											$(".guide.ok").hide();
											$(".guide.invalid").show();
											return;

										} else {

											$.ajax({
														url : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
														data : {
															userId : userId
														},
														dataType : "json",
														success : function(data) {
															console.log(data);
															// if(data==true) { //stream 방식

															if (data.isUsable == true) { //viewName 방식
																$(
																		".guide.error")
																		.hide();
																$(
																		".guide.invalid")
																		.hide();
																$(".guide.ok")
																		.show();
																$(
																		"#idDuplicateCheck")
																		.val(1);
															} else {
																$(
																		".guide.error")
																		.show();
																$(
																		".guide.invalid")
																		.hide();
																$(".guide.ok")
																		.hide();
																$(
																		"#idDuplicateCheck")
																		.val(0);
															}
														},
														error : function(jqxhr,
																textStatus,
																errorThrown) {
															console
																	.log("ajax 처리 실패");
															//에러로그
															console.log(jqxhr);
															console
																	.log(textStatus);
															console
																	.log(errorThrown);
														}
													});
										}
										//console.log(userId);
									});
				});

				function validate() {
					var userId = $("#userId_");
					if (userId.val().trim().length < 4) {
						alert("아이디는 최소 4자리이상이어야 합니다.");
						userId.focus();
						return false;
					}

					//아이디중복체크여부
					if ($("#idDuplicateCheck").val() == 0) {
						alert("사용가능한 아이디를 입력해주세요.");
						return false();
					}

					if ($("#password_").val() == ""
							|| $("#userId_").val() == "") {
						alert("아이디나 비밀번호는 필수 값입니다.");
						return false();
					}

					if ($("#reqChkBox").is(":checked") != true) {
						alert("이용 약관에 동의하지 않으셨습니다.");
						return false();
					} 

					if ($("#userName").val() == "") {
						alert("이름은 필수 값입니다.");
						return false();
					}

					if ($("#age").val() == "") {
						alert("나이를 입력해주세요");
						return false();
					}

					if ($("#email").val() == "") {
						alert("이메일을 입력해주세요");
						return false();
					}

					if ($("#phone").val() == "") {
						alert("휴대폰 번호를 입력해주세요");
						return false();
					}

					return true;
				}

			</script>
		</section>
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>