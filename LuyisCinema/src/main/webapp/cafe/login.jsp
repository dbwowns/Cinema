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
$(function () {
	$("#signup").click(function() {
		location.href="${path}/cafe_servlet/signup.do";
	});
	$("#login").click(function() {
		location.href="${path}/cafe_servlet/loginpage.do";
	});
});
</script>

<c:if test="${param.message =='error'}">
 <script type="text/javascript">
  alert("아이디 또는 비밀번호가 일치하지 않습니다.");
 </script>
</c:if>

<c:if test="${param.message =='logout'}">
<script type="text/javascript">
  alert("로그아웃 되었습니다.");
</script>
</c:if>
<style type="text/css">
body{
 background-color :#E0E0E0;
 background-size :cover;
}


a:link {
  color : black;
  text-decoration: none;
}
a:visited {
  color : black;
  text-decoration: none;
}
a:hover {
  color : black;
  text-decoration: none;
}
a:active {
  color : black;
  text-decoration: none;
}


.navbar{
font-family: 'Delicious Handrawn', cursive;
    height: 70px;
    padding-left: 30px;
    padding-right: 30px;
    text-align: center;
}

.navbar #logo{
	font-size: 30px;
}
.navbar #menu{
    float: right;
    list-style-type: none;
    padding: 0;
    margin: 0;
}

.navbar #menu li{
    float: left;
    margin-left: 30px;
    line-height: 60px;
}

.navbar #menu li a{
    color: #545454;
    font-size: 20px;
    text-decoration: none;
}
</style>

<link rel="stylesheet" href="${path}/cafe/css/login.css">
</head>
<body>

<div class="navbar">
	<div style="text-align: center;"> <a href="${path}/cafe_servlet/cinema.do" id="logo">Luyis Cinema</a></div>
	<ul id="menu">
	 <li><a href="${path}/cafe/main.jsp">home</a></li>
	 <li><a  id="signup" >sign up</a></li>
	 <li><a id="login">login</a></li>
	 <li><a href="#">instargram</a></li>
	</ul>
</div>

<h2>로그인</h2>
<div class="div1">
<form  method="post" action="${path}/cafe_servlet/login.do" >
	<div class="div2">
		<div class="id_box"><b>아이디</b></div>
		<div><input type="text" name="userid" id="userid"><br/></div> 
		
		<div class="passwd_box"><b>비밀번호</b></div>
		<div> <input type="password" name="passwd" id="passwd"><br/></div>
		
		<div style="padding-top: 50px;"><input class="info" type="button" value="회원가입"  onclick="location.href='${path}/cafe_servlet/signup.do'"> |
			<input type="submit" value="로그인" class="login" id="login" > 
		</div>
	</div>
	</form>
	
</div>

</body>
</html>