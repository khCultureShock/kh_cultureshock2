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
	<script src="../resources/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ticketing.css" />
</head>

<body >
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/menubar.jsp"/>

	<section>
		<form action="${pageContext.request.contextPath}/ticketing/ticketing2.do" method="post">
		    <div class="reserve-container">
		        <div class="movie-part">
		            <div class="reserve-title">${art.artGenre}</div>
		            		<input type="hidden" name="artGenre" value="${art.artGenre}"/>
		            <div class="movie-list"><img src="${art.artImg}" width=330px; height=340px;></div>
		            		<input type="hidden" name="artImg" value="${art.artImg}"/>
		            <div class="sort-wrapper">
		            	<div class="sort-rate sort-selected"> ${art.artTitle}
		                	<input type="hidden" name="artTitle" value="${art.artTitle}"/>		                	
		                </div>         
		            </div>
		            <div class="sort-wrapper">
		            	<div class="sort-rate sort-selected">${art.artPlace}
		                	<input type="hidden" name="artPlace" value="${art.artPlace}"/>
		                </div>         
		            </div>
		        </div>
		        <div class="day-part">
		            <div class="reserve-title">날짜</div>
		            <div class="reserve-date">
		            	<input type="hidden" name="startDate" value="${art.startDate}"/>
		            	<input type="hidden" name="endDate" value= "${art.endDate}"/>
		            </div>
		        </div>
		        <div class="time-part">
		            <div class="reserve-title">예매 정보</div>

		           		<input type="hidden" id="reservDate" name="reservDate"/>
		           		
		            <div class="movie-list"><img src="${art.artImg}" width=370px; height=220px;></div>
		            <div class="sort-wrapper">
		                <div class="sort-rate sort-selected">장르 : ${art.artGenre}</div>               
		            </div>
		            <div class="sort-wrapper">
		                <div class="sort-rate sort-selected">제목 : ${art.artTitle}</div>               
		            </div>
		            <div class="sort-wrapper">
		                <div class="sort-rate sort-selected">장소 : ${art.artPlace}</div>               
		            </div>
		            <div class="sort-wrapper">
		                <div class="sort-rate sort-selected">날짜 : ${art.startDate} ~ ${art.endDate}</div>         
		            </div>
		            <div class="sort-wrapper">
		                <button type="submit">좌석 선택</button> &nbsp;&nbsp;  
		                <button type="button" onclick="location.href='${pageContext.request.contextPath}/search/searchList.do'">돌아가기</button>      
		            </div>
		        </div>		
		    </div>
	    </form>
    </section>
    
    <script>      
            var startDate=$("input[name=startDate]").val()
            var startDateArr = startDate.split('-');
            
            var endDate=$("input[name=endDate]").val()
            var endDateArr = endDate.split('-');
            
            var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
            var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
            
            const reserveDate = document.querySelector(".reserve-date");
            
            	//console.log(startDate);
            	//console.log(endDate);
            	//console.log(startDateCompare)
            	//console.log(endDateCompare)
            	
            for (i = startDateCompare.getDate(); i <= endDateCompare.getDate(); i++) {
            
            		//console.log(startDateCompare.getDate());
            		//console.log(endDateCompare.getDate());
            		
            		 const button = document.createElement("button");
            		 const spanDay = document.createElement("span");
            		 button.type = "button";
            		 button.classList = "movie-date-wrapper";
            		 spanDay.classList = "movie-day";
            		 
            		 spanDay.innerHTML = i;
            		 button.append(spanDay);
            		 reserveDate.append(button);
            		 
            		 dayClickEvent(button);
            }
            	
                function dayClickEvent(button) {
                    button.addEventListener("click", function() {
                        const movieDateWrapperActive = document.querySelectorAll(".movie-date-wrapper-active");
                        movieDateWrapperActive.forEach((list) => {
                            list.classList.remove("movie-date-wrapper-active");
                        })
                        button.classList.add("movie-date-wrapper-active");
                        
                        $('#reservDate').val($(this).find('span').text());
                    });
                }
    </script>
    
    <c:import url="../common/footer.jsp"/>
</body>

</html>

<!-- 41라인 <input type="hidden" id="reservDate" name="reservDate"/>
     99라인 $('#reservDate').val($(this).find('span').text()); 
     강사님께서 도와주신 것!! 대박!! -->