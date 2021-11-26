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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/ticketingSeat.css" />
</head>

<body >
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/menubar.jsp"/>

	<section>
		<form action="${pageContext.request.contextPath}/ticketing/ticketing3.do" method="post">
		    <div class="reserve-container">
		        <div class="movie-part">
		            <div class="reserve-title">좌석 정보</div>	          		            
			            <div class="sort-wrapper">
			            	<div class="sort-rate sort-selected"> SCREEN </div>         
			            </div>
			            <div class="movie-list">
			            	<div class="seat-wrapper"></div>
			            </div>	  
			            <div class="sort-wrapper">
			            	<div class="sort-rate sort-selected"> 1개 좌석 금액  </div>    
			            </div>   
			            <div class="sort-wrapper">
			            	<div class="sort-rate sort-selected"> 100원  </div>      
			            </div> 
			    	♥      
		        </div>
		        <div class="day-part">
		            <div class="reserve-title">선택 정보</div>
		            <div class="reserve-date">
		            	<div class="sort-rate sort-selected"> 선택 좌석 </div>
		            </div>
		            <div class="reserve-date">
		            	<div class="sort-rate sort-selected" id="selectedSeat1" > 버튼 클릭 함수 적용 </div>
		            </div>
		            <div class="reserve-date">
		            	<div class="sort-rate sort-selected"> 결제 금액 </div>
		            </div>
		            <div class="reserve-date">
		            	<div class="sort-rate sort-selected" id="totalPayment"> 계산기 &nbsp;&nbsp; 함수 적용 </div>
		            </div>
		        </div>
		        <div class="time-part">
		            <div class="reserve-title">예매 정보</div>			            
		            			<input type="hidden" id="reservDate" name="reservDate"/>
		           		<div class="movie-list"><img src="${art.artImg}" width=370px; height=182px;></div>
		           				<input type="hidden" name="artImg" value="${art.artImg}"/>	
		           		<div class="sort-wrapper">
			                <div class="sort-rate sort-selected">장르 : ${art.artGenre}</div>               
				           		<input type="hidden" name="artGenre" value="${art.artGenre}"/>			           		           
			            </div>
			            <div class="sort-wrapper">
			                <div class="sort-rate sort-selected">제목 : ${art.artTitle}</div>               
			                 	<input type="hidden" name="artTitle" value="${art.artTitle}"/>		 			            
			            </div> 
			            <div class="sort-wrapper">
			                <div class="sort-rate sort-selected">장소 : ${art.artPlace}</div>               
			                 	<input type="hidden" name="artPlace" value="${art.artPlace}"/>			            
			            </div>            
			            <div class="sort-wrapper">
			                <div class="sort-rate sort-selected">날짜 : ${art.startDate} ~ ${art.endDate}</div>   
			                	<input type="hidden" name="startDate" value="${art.startDate}"/>
		            			<input type="hidden" name="endDate" value= "${art.endDate}"/>      
			            </div>
			            <div class="sort-wrapper">
			                <div class="sort-rate sort-selected" id="selectedSeat2">선택 좌석 : &nbsp; || &nbsp; 결제 금액 : </div>     
			                	<input type="hidden" name="" value=""/>
		            			<input type="hidden" name="" value= ""/>    
			            </div>
			            <div class="sort-wrapper">
			                <button type="submit">결제하기</button>  
			                <button type="button" onclick="location.href='${pageContext.request.contextPath}/search/searchList.do'">돌아가기</button>        
			            </div>
		        </div>	         
		    </div>    		   
	    </form>
    </section>
    
<script>
    let test = [];
    let selectedSeats = new Array();
    let selectedSeatsMap = [];
    const seatWrapper = document.querySelector(".seat-wrapper");
    let clicked = "";
    let div = "";

    for (let i = 0; i < 7; i++) {
        div = document.createElement("div");
        seatWrapper.append(div);
        for (let j = 0; j < 7; j++) {
            const input = document.createElement('input');
            input.type = "button";
            input.name = "seats"
            input.classList = "seat";
            //3중포문을 사용하지 않기위해 
            mapping(input, i, j);
            div.append(input);
            input.addEventListener('click', function(e) {
                console.log(e.target.value);
                
                //중복방지 함수
                selectedSeats = selectedSeats.filter((element, index) => selectedSeats.indexOf(element) != index);

                //click class가 존재할때(제거해주는 toggle)
                if (input.classList.contains("clicked")) {
                    input.classList.remove("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    selectedSeats.splice(selectedSeats.indexOf(e.target.value), 1);
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    });
                    //click class가 존재하지 않을때 (추가해주는 toggle)
                } else {
                    input.classList.add("clicked");
                    clicked = document.querySelectorAll(".clicked");
                    clicked.forEach((data) => {
                        selectedSeats.push(data.value);
                    })
                }
                console.log(selectedSeats);
                
                if(selectedSeats.length != 0){
                	$('#selectedSeat1').text(selectedSeats);
                	$('#totalPayment').text(selectedSeats.length * 100)
                    $('#selectedSeat2').text('선택 좌석 : ' + selectedSeats + ' || 결제 금액 : ' + selectedSeats.length * 100 + ' ');
                } else {
                	$('#selectedSeat1').text(' 버튼 클릭 함수 적용 ');
                    $('#selectedSeat2').text('선택 좌석 :  ||  결제 금액 : ');
                }
                
               /* $('.seat').html(selectedSeats); */
              /* window.getSelection().getRangeAt()
               Range
               console.log(window.getSelection().getRangeAt()); */
            })
        }
    }

    function mapping(input, i, j) {
        if (i === 0) {
            input.value = "A" + j;
        } else if (i === 1) {
            input.value = "B" + j;
        } else if (i === 2) {
            input.value = "C" + j;
        } else if (i === 3) {
            input.value = "D" + j;
        } else if (i === 4) {
            input.value = "E" + j;
        } else if (i === 5) {
            input.value = "F" + j;
        } else if (i === 6) {
            input.value = "G" + j;
        }
    }
</script>

</html>








	<%-- <section>
	<form action="ticketing/ticketing2.do" method="post">
    <div class="reserve-container">
        <div class="movie-part">
            <div class="reserve-title">${art.artGenre}</div>
            <div class="sort-wrapper">
                <div class="sort-rate sort-selected">${art.artTitle} || ${art.artPlace}</div>         
            </div>
            <div class="movie-list"><img src="${art.artImg}" width=282px; height=380px;></div>
        </div>
        <div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date">
            	<input type="hidden" name="startDate" value= "${art.startDate}"/>
            	<input type="hidden" name="endDate" value= "${art.endDate}"/>
            </div>
        </div>
        <div class="time-part">
            <div class="reserve-title">예매 정보</div>
            <div class="sort-wrapper">
                <div class="sort-rate sort-selected">장르 : ${art.artGenre} &nbsp; || &nbsp; 제목 : ${art.artTitle} &nbsp; || &nbsp; 장소 : ${art.artPlace}</div>               
            </div>
            <input type="hidden" id="reservDate" name="reservDate"/>
            <div class="movie-list"><img src="${art.artImg}" width=370px; height=300px;></div>
            <div class="sort-wrapper">
                <div class="sort-rate sort-selected">날짜 : ${art.startDate} ~ ${art.endDate}</div>         
            </div>
            <div class="sort-wrapper">
                <button type="button">예매하기</button>        
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
            
            		console.log(startDateCompare.getDate());
            		console.log(endDateCompare.getDate());
            		
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
    </script> --%>
    
    <c:import url="../common/footer.jsp"/>
</body>

</html>

<!-- 41라인 <input type="hidden" id="reservDate" name="reservDate"/>
     99라인 $('#reservDate').val($(this).find('span').text()); 
     강사님께서 도와주신 것!! 대박!! -->