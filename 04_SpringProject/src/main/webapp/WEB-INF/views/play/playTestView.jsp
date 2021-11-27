<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문화예술 상세보기</title>
	<c:import url="../common/header.jsp"/>
	<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/detail.css" /> --%>
	<style>
		div#board-container{width:1000px; margin:0 auto; text-align:center;}
		div#board-container input,div#board-container button{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		.part2 { display: inline-block; }
		.menu h3 a:hover, menu h3:active { /* 마우스 올렸을 때 변화 */
            background-color: black;
            color: white;
        }
        .menu p {
            padding: 0px 10px;
            margin: 0;
            height: 0;
            overflow: hidden;
            transition: height 2s ease-in;
            background-color: rgb(255, 243, 184);
            color: black;
            text-align: center;
        }
       .menu:target p {
            overflow: auto; /* 숨긴 p문장을 클릭하면 나오게 */
            height: 200px;
        }
        div#wrap { margin: 0 auto;}
        .detaill {         
			    width: 500px;
		        height: 660px;
		        justify-content: center;
		        display:flex;
	       }
	    .info1 { font-size: 20px; }
	</style>
	<script>
		function fileDownload(oName, rName){
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oName = encodeURIComponent(oName);
			location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oName+"&rName="+rName;
		}
		
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/menubar.jsp"/>
		<div id="board-container">
		 <td>
           <hr>
             <h1>Culture Shock</h1>
           <hr>
         </td>
         
        <div id="wrap">
         <table class="info" align="center">
			<tr>
                <td>
                <!-- 포스터 출력 -->
				<img src="${play.artImg}" width="450px" height="550px">
                </td>
                </tr>
          </table>
          
          <br /><br /><br />
          <table class="info1" align="center">
                
                <!-- 정보 받아오기 -->
              
                <tr>
                    <th class="title">타이틀</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                    &nbsp;&nbsp; ${play.artTitle}
                      <!-- <input type="text" style="border:none; width: 500px; height: 50px;" readonly required> -->
                    </td>
                </tr>
                

                <tr>
                    <th class="date">날짜</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                    &nbsp;&nbsp; ${play.startDate} ~ ${play.endDate} 
                      <!--  <input type="text" style="border:none; width: 200px; height: 50px;" readonly required>
                       ~
                       <input type="text" style="border:none; width: 200px; height: 50px;" readonly required> -->
                    </td>
                </tr>
				
	
                <tr>
                    <th class="place">장소</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                    &nbsp;&nbsp; ${play.artPlace}
                       <!-- <input type="text" style="border:none; width: 500px; height: 50px;"  readonly required> -->
                    </td>
                </tr>
                
 			
                 <tr>
                    <th class="genre">장르</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                    &nbsp;&nbsp; ${play.artGenre}
                          <!-- <input type="text" style="border:none; width: 500px; height: 50px;" readonly required> -->
                    </td>
                </tr>
                
                <tr>
                    <th class="price">가격</th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                    &nbsp;&nbsp; ${art.artPrice}
                          <!-- <input type="text" style="border:none; width: 500px; height: 50px;" readonly required> -->
                    </td>
                </tr>
                
                  
             </table>
             
            <br />
            <br />
            <br />
           <div class="menu" id="part3">
           <hr />
	            <h3><a href="#part3">줄거리</a></h3>
	        <hr />
	                <p>
	                <br><br>
	                ${art.artText} 
	            </p>
            </div>
           </div>
             
            <br /><br />
		    <button class="btn btn-outline-info" type="button" onclick="ticketing('${play.artId}');"><img src="${pageContext.request.contextPath }/resources/images/ticket.png" alt="ticket" width="70px" height="40px"/></button>
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="wishlist('${play.artId}');"><img src="${pageContext.request.contextPath }/resources/images/redheart.png" alt="ticket" width="40px" height="40px"/></button>
	 		&nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/art/artList.do'"><img src="${pageContext.request.contextPath }/resources/images/back.png" alt="ticket" width="40px" height="40px"/></button>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
		function ticketing(artId){
			location.href = "${pageContext.request.contextPath}/ticketing/ticketing.do?artId="+artId;
		}
		
		function wishlist(artId){
			location.href = "${pageContext.request.contextPath}/wish/insert.do?artId="+artId;
		}
	</script>
</body>



</html>