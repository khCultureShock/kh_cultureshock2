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
      
    </style>
    <script>
      // Initialize and add the map
      function initMap() {
        // The location of Uluru
        const seoul = { lat: 37.566381, lng: 126.977717 };
        // The map, centered at Uluru
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 4,
          center: seoul,
        });
        // The marker, positioned at Uluru
        const marker = new google.maps.Marker({
          position: seoul,
          map: map,
        });
      }
      
      
      
      // Ajax
      $(function(){
	 	$.ajax({
		 url : "${pageContext.request.contextPath}/map/mapViewData.do",
		 type : 'get',
		 success : function(data){
			 console.log(data);
			 var result = "";
			 for( var i in data){
				 	 var show = data[i];
					 result += '<li class="showList"><img src=' + show.poster + '>'
							 + '<div class="select title"' + ' value="' + show.title + '">' + show.title + '</div>'
							 + '<div class="select pnum"' + 'value="' + show.pnum + '">' + show.pnum +'</div>'
							 + '<div class="select plcName"'+ 'value="' + show.plcName + '">' + show.plcName + '</div>'
							 + '</li>'; 
							 
							 
			 }
			  $('#map-marker-content').html(result);
			  
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