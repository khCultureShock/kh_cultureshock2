<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
    <title>공연 지도</title>

    <style type="text/css">
      
      #outer > h3 {text-align:center;}
      
      #map {height: 50em; width: 65%;}
      
      #map-marker-content{
      border:1px solid green;
      width:35%;
      height:50em;
      position:absolute;
      top:250px;
      right: 0; 
      overflow: auto;  
      }
      
      li { list-style:none;}
      
    </style>
    <script>
       
     
      // Initialize and add the map
      function initMap() {
        // The location of Uluru
        const seoul = { lat: 37.566381, lng: 126.977717 };
        // The map, centered at Uluru
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 12,
          center: seoul,
        });
        // The marker, positioned at Uluru
        const marker = new google.maps.Marker({
          position: seoul,
          map: map,
        });
      }
     
      
      
      
      // Ajax 공연 정보 가져오기
      $(function(){
	 	$.ajax({
		 url : "${pageContext.request.contextPath}/map/mapViewData.do",
		 type : 'get',
		 success : function(data){
			 console.log(data);
			 var pArr = [];
			 var result = "";
			 for( var i in data.poster){
				 var innerHtml = ""
						
						innerHtml =	  '<li class="cell">'
						innerHtml +='<img src='+data.poster[i] +'>'
						innerHtml +='<div class="main_topinfo">'
						innerHtml +=  '<h1 class="' + data.title[i] + '">' + data.title[i] + '</h1>'
						innerHtml +=  '<p class="main_placeName"' + 'value="' + data.plcName[i] + '">'+ data.plcName[i] + '</p>' 
						innerHtml += '<p class="main_placeId" value="' + data.pCode[i] + '">' + data.pCode[i] + '</p>'
						innerHtml +=  '<hr>'
						innerHtml +=  '<input type="hidden" class="main_pnum" value="' + data.pnum[i] + '"/>'
						innerHtml += '</div>'
						innerHtml +='</li>'
						
						$('#map-marker-content').append(innerHtml);		
						pArr.push(data.pCode[i]);
							 
			 }
			  
			  			console.log(pArr);
			  		/*
			  		// 위도 경도 가져오기 
			  		$.ajax({
			  			url :  "${pageContext.request.contextPath}/map/mapViewXY.do",
			  			type : 'get',
			  			data : { pnum : pArr }, // controller > RequestMapping 부분에 "produces"를 하지 않으면 문자가 깨져서 옴	
			  			success : function(data){
			  				console.log(data);
			  				
			  				// 지도 마커
			  				function initMap(){
			  					const myLatLng = {
			  							lat : 37.55902624,
			  							lng : 126.9749014
			  					};
			  					
			  					var locations = [
			  						 // ['서울역', 37.5546788, 126.9706069], ...  
			  						
			  					];
			  					
			  					var map = new google.maps.Map(document.getElementById('map'), {
			  						zoom : 4,
			  						center: myLatLng,
			  					});
			  					
			  					var infowindow = new google.maps.InfoWindow();
			  					 var marker, i;
			  					 
			  					 // 마커 반복해서 찍기
			  					 for(i=0; i < locations.length; i++){
			  						 marker = new google.maps.Marker({
			  							 position : new google.maps.LatLng(locations[i][1], locations[i][2]),
			  							 map : map
			  						 };)
			  						 
			  						 google.maps.event.addListener(marker,'click',(function(marker,i){
			  							 return function(){
			  								 infowindow.setContent(locations[i][0]);
			  								 infowindow.open(map,marker);
			  							 }
			  						 })(marker, i));
			  						 
			  					 } // for문 끝
			  					
			  				} // 지도 마커 끝
			  			    
			  			}
			  		});// 위도 경도 ajax 끝
			  */
		 },
		 error : function( errorcode ) {
			 console.log( errorcode );				
			 alert("데이터 전달 실패");
		 }
	 });
 });
      
      

      
      
      
    </script>
    
  </head>
   <body>
    <c:import url="../common/header.jsp" />
  	<c:import url="../common/menubar.jsp"/>
   
   <div id="outer">
    <h3>공연 지도</h3>
    <!--The div element for the map -->
    <div id="map"></div>
	<div id="map-marker-content"></div>
    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIZNu96-M9LGBqULXCp6cdlngJ8AUXxnY&callback=initMap&libraries=&v=weekly"
      async
    ></script>
    </div>
    <c:import url="../common/footer.jsp" />
  </body>
</html>