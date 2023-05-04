<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
<script src="../include/jquery-3.6.3.min.js"></script>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
$(function() {
	$("#cinema").click(function() {
		location.href="${path}/cafe_servlet/cinema.do";
	});
}); 
 
</script>

<link rel="stylesheet" href="${path}/cafe/css/main.css">

</head>
<body>
<h2><a>Luyis Cinema</a></h2>

<div id="container">
 <div>
 <button id="cinema" type="button" >Cinema</button>
 </div>
  
 <div>
 <button   onclick="location.href='https://www.instagram.com'">Instargram</button>
 </div>
</div>
  
  <footer class="bg-#909090 mt-4 p-5 text-center" style="color: black; ">
      Copyright ⓒ 2023  Luyis Cinema All Rights Reserved.
  </footer>

</body>
</html>