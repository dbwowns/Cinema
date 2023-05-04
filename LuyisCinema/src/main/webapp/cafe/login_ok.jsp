<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.3.min.js"></script>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function() {
	$("#btnLogout").click(function() {
		location.href="${path}/cafe_servlet/logout.do";
	});
});
/* var message = '${sessionScope.message}';
alert(message); */
</script>
<link rel="stylesheet" href="${path}/cafe/css/login_ok.css">
</head>
<body>
<%-- 
${sessionScope.userid}님이 접속중입니다. <br>
<button type="button" id="btnLogout">로그아웃</button> --%>



<div class="navbar">
	<div style="text-align: center;"> <a href="${path}/cafe_servlet/cinema.do" id="logo">Luyis Cinema</a></div>
	<%-- <h2>${sessionScope.message}</h2> --%>
	<ul id="menu">
	 <li><a>${sessionScope.userid}님이 접속중입니다.</a></li>
	<%--  <li><a href="${path}/cafe/main.jsp">home</a></li> 수정전 --%>
	 <li><a href="${path}/cafe_servlet/list.do">home</a></li>
 	 <li><a href="#">instargram</a></li>
 	 <li><a href="${path}/cinemaboard_servlet/list.do">게시판</a></li>
	 <li><a ><button type="button" id="btnLogout" style="border-radius: 6px; font: status-bar;">로그아웃</button></a></li>
	</ul>
</div>

<!--  <div class="header"></div>  -->
<div class="header">
 <img src="https://caching2.lottecinema.co.kr/lotte_image/2023/MU/0329/MU_1920774_2.jpg" alt="Slide 1" >
  <img src="https://caching2.lottecinema.co.kr/lotte_image/2023/AIR/AIR_1920774.jpg" alt="Slide 2" >
  <img src="https://caching2.lottecinema.co.kr/lotte_image/2023/IMHERE/IMHERE_1920774.jpg" alt="Slide 3" >
</div>
<script type="text/javascript">
var slideIndex = 0;
var slides = document.querySelectorAll('.header img');

setInterval(function() {
  for (var i = 0; i < slides.length; i++) {
    slides[i].classList.remove('active');
  }
  slideIndex++;
  if (slideIndex > slides.length) {
    slideIndex = 1;
  }
  slides[slideIndex - 1].classList.add('active');
}, 3000);
</script>

<div class="products">
 	<h2>Cinema</h2>
	
	<div class="product-list">
	 <a href="${path}/cafe/review.jsp" class="product">
                <img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230206_264%2F1675649061557DaJHD_JPEG%2Fmovie_image.jpg
                " width="225" height="250px">
                <div class="product-name">
                    스즈메의 문단속
                </div>
     </a>
     
      <a href="${path}/cafe/review2.jsp" class="product">
                <img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202304/19606_103_1.jpg" width="225" height="250">
                <div class="product-name">
                    리바운드
                </div>
     </a>

      <a href="${path}/cafe/review3.jsp" class="product">
                <img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202304/19666_103_1.jpg" width="225" height="250">
                <div class="product-name">
                    에어
                </div>
     </a>
     
     <a href="${path}/cafe/review4.jsp" class="product">
                <img src="https://caching.lottecinema.co.kr//Media/MovieFile/MovieImg/202304/19683_103_1.jpg" width="225" height="250">
                <div class="product-name">
                    존 윅 4
                </div>
     </a>
     
     <a href="${path}/cafe/review5.jsp" class="product">
                <img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230414_79%2F16814517611575tadE_JPEG%2Fmovie_image.jpg" width="225" height="250">
                <div class="product-name">
                    킬링 로맨스
                </div>
     </a>
     
     <a href="${path}/cafe/review6.jsp" class="product">
                <img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230309_3%2F1678329123596Kpcdb_JPEG%2Fmovie_image.jpg" width="225" height="250">
                <div class="product-name">
                    슈퍼 마리오 브라더스
                </div>
     </a>
     
     <a href="${path}/cafe/review7.jsp" class="product">
                <img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20221216_283%2F1671153488789d3g4j_JPEG%2Fmovie_image.jpg" width="225" height="250">
                <div class="product-name">
                    더 퍼스트 슬램덩크
                </div>
     </a>
     
     <a href="${path}/cafe/review8.jsp" class="product">
                <img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230403_204%2F1680507641170NKvOl_JPEG%2Fmovie_image.jpg" width="225" height="250">
                <div class="product-name">
                    드림
                </div>
     </a>
     
     <a href="${path}/cafe/review9.jsp" class="product">
                <img src="https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230419_143%2F168187149954769TL2_JPEG%2Fmovie_image.jpg" width="225" height="250">
                <div class="product-name">
                    옥수역귀신
                </div>
     </a>
     
     <div class="footer">
          Copyright ⓒ 2023  Luyis Cinema All Rights Reserved.
        </div>
	</div>
	
</div>

</body>
</html>