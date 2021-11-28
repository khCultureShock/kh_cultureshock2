<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <!DOCTYPE html>
                <html>

                <head>
                    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
                    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/logo.png" />
                    <title>공연 지도</title>

                    <style type="text/css">
                        #outer>h3 {
                            text-align: center;
                        }

                        #map {
                            height: 50em;
                            width: 65%;
                        }

                        #map-marker-content {
                            border: 1px solid green;
                            width: 35%;
                            height: 50em;
                            position:absolute;
                            left: 65%;
                            top: 50%;
                            cursor: pointer;
                        }

                        li {
                            list-style: none;
                        }
                       
                                               
                        .content {
                         background: rgba(255, 255, 255, 0.8);
                         height: 49.7em;
                         
                        }
                        
                        .content > button {
                        border: 1px solid #d9d9d9;                        
                        color: #e60000;
                        
                        }
                        
                        .content > img {
                        width:150px;
                        height: 200px;
                        }
                        
                        
                    </style>


                </head>

                <body>
                    <c:import url="../common/header.jsp" />
                    <c:import url="../common/menubar.jsp" />

                    <div id="outer">
                    <br />
                        <h3>공연 지도</h3>
                     <br />
                       <div>
                        <div id="map"></div>
                        <div id="map-marker-content"></div>
                       </div>

                    </div>
                    <script type="text/javascript"
                        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a92ee2e5e6487b164a9c52e0e15a4622"></script>

                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                            mapOption = {
                                center: new kakao.maps.LatLng(37.566381, 126.977717), // 지도의 중심좌표
                                level: 12 // 지도의 확대 레벨
                            };

                        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다                                    
                        
                        var positions = [];                                              
                        var contents = "";
                        var overlaies = [];
                        var customOverlay = "";
                        

                        // Ajax 공연 정보 가져오기
                        $(function () {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/map/mapViewData.do",
                                type: 'get',
                                async:false,
                                success: function (data) {
                                    console.log(data);                                    
                                    for (var i in data.poster) {
                                       
                                        // 마커를 표시할 위치와 title 객체 배열입니다
                                        	 positions.push({
                                        		 poster: data.poster[i],
                                        		 showtitle: data.title[i], // 공연 이름
                                                 title: data.pname[i], // 장소 이름                                                
                                                 startdate: data.startdate[i],
                                                 enddate: data. enddate[i], 
                                                 latlng: new kakao.maps.LatLng(data.gpsY[i], data.gpsX[i])
                                             	
                                             });
                                        
                                        	 var overlayInfo = {
                                        			 poster: data.poster[i],
                                        			 showtitle: data.title[i],
                                                     title: data.pname[i],    // 공연 이름                                                 
                                                     startdate: data.startdate[i],
                                                     enddate: data. enddate[i]
                                                     
                                                 }
                                        	 
                                        	 overlaies.push(overlayInfo);
                                       
                                    }

                                    // 마커 이미지의 이미지 주소입니다
                                    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                                    for (var i = 0; i < positions.length; i++) {

                                        // 마커 이미지의 이미지 크기 입니다
                                        var imageSize = new kakao.maps.Size(24, 35);

                                        // 마커 이미지를 생성합니다    
                                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                                        // 마커를 생성합니다
                                        var marker = new kakao.maps.Marker({
                                            map: map, // 마커를 표시할 지도
                                            position: positions[i].latlng, // 마커를 표시할 위치
                                            title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                            image: markerImage, // 마커 이미지 
                                            clickable: true
                                        });
                                        
                                        marker.setMap(map); // 마커 표기
                                       
                                        
                                        // 마커에 표시할 인포윈도우를 생성합니다 
                                        var infowindow = new kakao.maps.InfoWindow({
                                        	content: positions[i].title
                                        });
                                        
                                            
                                     	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                                        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                                        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                                        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                                        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
                                       
                                        // 마커 Click 이벤트 등록
                                        kakao.maps.event.addListener(marker, 'click', makeOverlayListener(map, marker, overlaies[i]));
                                     	
                                        
                                    }
                                                                        

                                 	// 인포윈도우 표시
                                    function makeOverListener(map, marker, infowindow) {
                                        return function() {
                                            infowindow.open(map, marker);
                                        };
                                    }

                                    // 인포윈도우 닫기 
                                    function makeOutListener(infowindow) {
                                        return function() {
                                            infowindow.close();
                                        };
                                    }
	
                                    
                                 // 마커에 클릭이벤트를 등록합니다
                                     /* kakao.maps.event.addListener(marker, 'click', function() {                                                                                    
                                    	  // customoverlay.setMap(map); 
                                    	   map.setCenter(customOverlay.getPosition());
                                    });  */ 
                                  
 
                                    
                                },
                                error: function (errorcode) {
                                    console.log(errorcode);
                                    alert("데이터 전달 실패");
                                }

                            });
                        });
                        
                        function makeOverlayListener(map, marker, overlay) {
                            return function () {
                                // 커스텀 오버레이 생성
                                    customOverlay = new kakao.maps.CustomOverlay({
                                    position:marker.getPosition(),
                                    xAnchor: 0.0,
                                    yAnchor: 0.5
                                });

                                var $content = $('<div></div>').addClass('content');
                                var $poster = $('<div></div>').addClass('poster');
                                var	$info = $('<div></div>').addClass('info_area');
                                
                                
                                // 오버레이 들어갈 내용 담기
                                $poster.append('<img src="' + overlay.poster + '" alt="' + overlay.showtitle + '" width ="400" height="550" />');                              
                                $info.append('<h4>' + overlay.showtitle + '</h4>');
                                $info.append('<p>' + overlay.title + '</p>'); 
                                $info.append('<p>' + "시작 날짜: " + overlay.startdate + '</p>');
                                $info.append('<p>' + "종료 날짜: " + overlay.enddate + '</p>');                                
                                $content.append($poster);
                                $content.append($info);
                               // $content.append($close); // 닫기 버튼

                                customOverlay.setContent($content[0]); 
                                //customOverlay.setMap(map);
                                
                               // map.setCenter(customOverlay.getPosition());
                               
                               $('#map-marker-content').html($content);
                               
                               $('#map-marker-content').on('click', function() {
                           		var pname = overlay.title;        						
               					location.href = "${pageContext.request.contextPath}/map/mapPlcSrch.do?pname="+pname;
                           	});
                               
                               
                            }
                            
                        }
                        
                       /*  $(function(){
                        	$('#map-marker-content').on('click', function() {
                        		var pname = positions.title;        						
            					location.href = "${pageContext.request.contextPath}/map/mapPlcSrch.do?pname="+pname;
                        	});
                        }); */
                        



                    </script>
                    <br /><br />
                    <c:import url="../common/footer.jsp" />
                </body>

                </html>