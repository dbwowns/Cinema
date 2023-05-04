<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>review</title>
<script src="../include/jquery-3.6.3.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="${path}/cafe_servlet/logout.do";
	});
});
</script>

</head>
<link rel="stylesheet" href="${path}/cafe/css/review.css">
<body>
<div class="navbar">
	<div style="text-align: center;"> <a href="${path}/cafe_servlet/cinema.do" id="logo">Luyis Cinema</a></div>
	<ul id="menu">
	 <li><a>${sessionScope.userid}님이 접속중입니다.</a></li>
	 <li><a href="${path}/cafe_servlet/list.do">home</a></li>
 	 <li><a href="#">instargram</a></li>
	 <li><a href="${path}/cinemaboard_servlet/list.do">게시판</a></li>
	 <li><a ><button type="button" id="btnLogout" style="border-radius: 6px; font: status-bar;">로그아웃</button></a></li>
	</ul>
</div>
<div class="wrapper">
 <div style="display: flex; align-items: center; padding: 150px; padding-bottom: 50px">
  <img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230206_264%2F1675649061557DaJHD_JPEG%2Fmovie_image.jpg" style="width: 280px;height: 410px; margin-right: 40px; ">
  <div style="margin-left: 200px;">
    <table>
      <tr>
        <th colspan="2" style="font-size: 30px; padding-bottom: 80px;">스즈메의 문단속</th>
      </tr>
      <tr>
        <td style="font-weight: bold; font-size: 25px">장르</td>
        <td style="font-size: 20px">  &nbsp&nbsp  애니메이션</td>
      </tr>
      <tr>
        <td style="font-weight: bold;font-size: 25px">개봉일</td>
        <td style="font-size: 20px"> &nbsp&nbsp   2023년 03월 08일</td>
      </tr>
      <tr>
        <td style="font-weight: bold;font-size: 25px">등급</td>
        <td style="font-size: 20px">  &nbsp&nbsp  12세 관람가</td>
      </tr>
      <tr>
        <td style="font-weight: bold;font-size: 25px">러닝타임</td>
        <td style="font-size: 20px">  &nbsp&nbsp  122분</td>
      </tr>
      <tr>
        <td style="font-weight: bold;font-size: 25px">감독</td>
        <td style="font-size: 20px">  &nbsp&nbsp  신카이 마코토</td>
      </tr>
    </table>
  </div>
 </div>
 
 <div style="margin-bottom: 50px;">
<iframe width="700" height="400" 
src="https://www.youtube.com/embed/vpe62i_LDps" 
title="YouTube video player" 
frameborder="0" 
allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
allowfullscreen>
</iframe>
</div>
<div class="footer" style="margin-bottom: 50px;">
          Copyright ⓒ 2023  Luyis Cinema All Rights Reserved.
        </div>
</div>


</body>
</html>