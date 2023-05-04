<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.6.3.min.js"></script>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript">
	function cb_search() {
		document.form1.action = "${path}/cinemaboard_servlet/list.do";
		document.form1.submit();
	}
	
	$(function() {
		$("#btnLogout").click(function() {
			location.href="${path}/cafe_servlet/logout.do";
		});
	});
	
	function list(page) {
		location.href="${path}/cinemaboard_servlet/list.do?curPage="+page;
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
  margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
  text-align: center; /* 텍스트 가운데 정렬 */
  border-collapse: collapse; /* 테이블 셀 간격 제거 */
  width: 600px; /* 너비 설정 */
  border: 1px solid black; /* 테두리 설정 */
}

th, td {
  padding: 10px; /* 셀 안쪽 여백 설정 */
  border: 1px solid black; /* 테두리 설정 */
}

input[type="password"], input[type="submit"] {
  margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
  display: block; /* 줄바꿈 */
}

.btn {
		padding: 10px 15px;
		border-radius: 10px;
		margin-right: 15px;
		background-color: gray;
		color: white;
		font-size: 13px;
		font-weight: bold;
		text-decoration: none;
	}

.btn:hover {
		background-color: gray;
	}


</style>

</head>
<body>
	<div class="navbar">
		<div style="text-align: center;">
			<a href="${path}/cafe_servlet/cinema.do" id="logo">Luyis Cinema</a>
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

	<div style="text-align: center;">
		<h2 style="margin-top: 40px;">게시판</h2>
		${count}개의 글이 있습니다.
		<!-- 검색폼 -->
		<form name="form1" id="form1" method="post">
			<select name="searchkey" id="searchkey">
				<c:choose>
					<c:when test="${searchkey == 'name'}">
						<option value="name" selected>이름</option>
						<option value="content">내용</option>
						<option value="name_content">이름+내용</option>
					</c:when>
					<c:when test="${searchkey == 'content'}">
						<option value="name">이름</option>
						<option value="content" selected>내용</option>
						<option value="name_content">이름+내용</option>
					</c:when>
					<c:when test="${searchkey == 'name_content'}">
						<option value="name">이름</option>
						<option value="content">내용</option>
						<option value="name_content" selected>이름+내용</option>
					</c:when>
				</c:choose>
			</select> <input name="search" id="search" value="${search}"> <input
				type="button" value="조회" onclick="cb_search()" class="btn">
		</form> <!-- 여기까진 됨  -->
 
		<input type="button" value="글쓰기"
			onclick="location.href='${path}/cinemaboard/write.jsp'" class="btn" style="margin-bottom: 10px;"> 
		<input type="button" value="목록"
			onclick="location.href='${path}/cinemaboard_servlet/list.do'"class="btn"style="margin-bottom: 10px;">
			<!-- 여기까지 완료 -->

		<c:forEach var="dto" items="${list}">
			<form method="post"
				action="${path}/cinemaboard_servlet/passwd_check.do" >
				<!-- 편집을 위해서는 게시물 번호가 필요함 -->
				<input type="hidden" name="idx" value="${dto.idx}">
				<table border="1" width="600px">
					<tr>
						<td>이름</td>
						<td>${dto.name}</td>
						<td>날짜</td>
						<td>${dto.post_date}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3">${dto.title}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">${dto.content}</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						 <td colspan="3"><input type="password" name="passwd">
							<input type="submit" value="수정/삭제" class="btn" style="margin-top: 10px;">
						</td>
					</tr>
				</table>
			</form>
		</c:forEach>
		
		
		<!-- 페이지 네비게이션 출력 -->
		<table border="1" style="width: 100%; ">
	  <tr>
		  <td colspan="9" align="center">
		  <!-- onclick시 index.jsp의 자동 호출되었던 메모리에 기억하고 있는 function list(curPage)를 호출한다. -->
		   <c:if test="${page.curPage > 1}">
		    <a href="#" onclick="list('1')">[처음]</a>
		   </c:if>
		   <c:if test="${page.curBlock > 1}">
		    <a href="#" onclick="list('${page.prevPage}')">[이전]</a>
		   </c:if>
		   <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
		    <c:choose>
		     <c:when test="${num == page.curPage}">
		      <span style="color: red">${num}</span>
		     </c:when>
		     <c:otherwise>
		      <a href="#" onclick="list('${num}')">${num}</a>
		     </c:otherwise>
		    </c:choose>
		   </c:forEach>
		   <c:if test="${page.curBlock < page.totBlock}">
		    <a href="#" onclick="list('${page.nextPage}')">[다음]</a>
		   </c:if>
		   <c:if test="${page.curPage < page.totPage}">
		    <a href="#" onclick="list('${page.totPage}')">[끝]</a>
		   </c:if>
		  </td>
 		</tr>
 		</table>
	</div>


</body>
</html>