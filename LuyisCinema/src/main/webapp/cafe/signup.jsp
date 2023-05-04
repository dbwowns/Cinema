<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
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


$(function() {//페이지가 로딩 되자마자 자동으로 실행되는 함수
	$("#btnSave").click(function() {
		insert();
	});
});

 function insert() {
	 var userid = $("#userid").val();
	    var passwd = $("#passwd").val();
	    var name = $("#name").val();
	    var tel = $("#tel").val();
	    var email = $("#email").val();
	    
	    // 입력값이 null인 경우에 대한 예외처리
	    if (!userid) {
	        alert("아이디를 입력해주세요.");
	        return;
	    }
	    if (!passwd) {
	        alert("비밀번호를 입력해주세요.");
	        return;
	    }
	    if (!name) {
	        alert("이름을 입력해주세요.");
	        return;
	    }
	    if (!tel) {
	        alert("전화번호를 입력해주세요.");
	        return;
	    }
	    if (!email) {
	        alert("이메일을 입력해주세요.");
	        return;
	    }
	 
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd").val()
	+"&name="+$("#name").val()	
	+"&tel="+$("#tel").val()
	+"&email="+$("#email").val();
	$.ajax({
		type: "post",
		url : "/jsp02/cafe_servlet/join.do",
		data : param,
		success : function(){
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#tel").val("");
			$("#email").val("");
			alert("회원가입에 성공하셨습니다.")
			alert("로그인페이지로 이동합니다.")
			location.href="${path}/cafe_servlet/loginpage.do";
		}
	});
} 

</script>
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

<link rel="stylesheet" href="${path}/cafe/css/signup.css">
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

<h2>회원가입</h2>
<div class="div1">
<form  method="post">
	<div class="div2">
		<div class="id_box"><b>아이디</b></div>
		<div><input type="text" name="userid" id="userid"><br/></div> 
		
		<div class="passwd1_box"><b>비밀번호</b></div>
		<div> <input type="password" name="passwd" id="passwd"><br/></div>
		
		
		<div class="name_box"><b>이름</b></div> 
		<div> <input type="text" name="name" id="name"><br/></div>
		
		<div class="tel_box"><b>전화번호</b></div>
		<div ><input type="tel" name="tel" id="tel"></div>
		
		<div class="email_box"><b>이메일</b></div>
		<div><input type="email" name="email" id="email"> </div>
		
		<div style="padding-top: 50px;">
		<input class="info" type="button" value="회원가입" id="btnSave" > |
			<input type="button" value="로그인" class="login" id="login" onclick="location.href='${path}/cafe_servlet/loginpage.do'" > 
		</div>
	</div>
	
	</form>
</div>
</body>
</html>