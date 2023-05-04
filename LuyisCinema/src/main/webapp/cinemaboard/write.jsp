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
function check() {
	document.form1.action="${path}/cinemaboard_servlet/insert.do";
	document.form1.submit();
}

</script>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Bungee&family=Hanalei&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Delicious+Handrawn&display=swap')
	;

body {
	background-color: #E0E0E0;
	background-size: cover;
	font-family: 'Delicious Handrawn', cursive;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: none;
}

a:active {
	color: black;
	text-decoration: none;
}

.navbar {
	height: 70px;
	padding-left: 30px;
	padding-right: 30px;
	text-align: center;
}

.navbar #logo {
	font-size: 30px;
}

.navbar img {
	vertical-align: top;
	border: blanchedalmond 5px solid;
}

.navbar #menu {
	float: right;
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.navbar #menu li {
	float: left;
	margin-left: 30px;
	line-height: 60px;
}

.navbar #menu li a {
	color: #545454;
	font-size: 20px;
	text-decoration: none;
}

.clearfix {
	clear: both;
}
table {
  border-collapse: separate;
  border-spacing: 0 15px;
}
</style>
</head>
<body>
<div class="navbar">
		<div style="text-align: center;">
			<a href="${path}/cafe_servlet/list.do" id="logo">Luyis Cinema</a>
		</div>
		<%-- <h2>${sessionScope.message}</h2> --%>
		<ul id="menu">
			<li><a>${sessionScope.userid}님이 접속중입니다.</a></li>
			<%--  <li><a href="${path}/cafe/main.jsp">home</a></li> 수정전 --%>
			<li><a href="${path}/cafe_servlet/list.do">home</a></li>
			<li><a href="#">instargram</a></li>
			<li><a href="${path}/cinemaboard_servlet/list.do">게시판</a></li>
			<li><a><button type="button" id="btnLogout"
						style="border-radius: 6px; font: status-bar;">로그아웃</button></a></li>
		</ul>
	</div>
<div  style="text-align: center;">
<h2 style="margin-top: 40px;">게시글 작성</h2>
<form name="form1" id="form1" method="post"style="display: inline-block;">
 <table border="1" width="700px;" style="margin-top: 40px;">
 
  <tr >
   <td>작성자</td>
   <td><input name="name" id="name" size="40"style="padding: 5px;"></td>
  </tr>
  
  <tr>
   <td>제목</td>
   <td><input name="title" id="title" size="40"style="padding: 5px;"></td>
  </tr>
  
  <tr>
   <td>비밀번호</td>
   <td><input type="password" name="passwd" id="passwd" size="40"style="padding: 5px;"></td>
  </tr>
  
  <tr align="center">
  <td>내용</td>
   <td><textarea rows="5" cols="55" name="content" id="content"style="padding: 5px;"></textarea> </td>
  </tr>
  
  <tr align="center">
   <td colspan="2">
    <input type="button" value="확인" onclick="check()"> 
    <input type="reset" value="취소" onclick="location.href='${path}/cinemaboard_servlet/list.do'">
   </td>
  </tr>
  
 </table>
</form>
</div>

</body>
</html>