<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Add Map</title>
    
	<c:import url="../common/header.jsp" />
	<c:import url="../common/menubar.jsp"/>
	
    <style type="text/css">
      /* Set the size of the div element that contains the map */
      #outer > h3 {
      	text-align:center;
      }
      #map {
      	border: 1px solid orange;
        height: 50em;
        /* The height is 400 pixels */
        width: 70%;
        /* The width is the width of the web page */
        position: relative;
        left:18em;
      }
      
      #outer{
      border:1px solid black;
      }
      
      
    </style>
    <script>
      // Initialize and add the map
      function initMap() {
        // The location of Uluru
        const uluru = { lat: -25.344, lng: 131.036 };
        // The map, centered at Uluru
        const map = new google.maps.Map(document.getElementById("map"), {
          zoom: 4,
          center: uluru,
        });
        // The marker, positioned at Uluru
        const marker = new google.maps.Marker({
          position: uluru,
          map: map,
        });
      }
    </script>
  </head>
  <body>
  <div id="outer">
    <h3>공연 지도</h3>
    <!--The div element for the map -->
    <main>
    <div id="map"></div>
	</div>
    <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
    <script
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIZNu96-M9LGBqULXCp6cdlngJ8AUXxnY&callback=initMap&libraries=&v=weekly"
      async
    ></script>
    </main>
    <c:import url="../common/footer.jsp" />
  </body>
</html>