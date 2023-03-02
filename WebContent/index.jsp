<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>깜상</title>
<%
String root=request.getContextPath();
%>
<style type="text/css">

*{
	margin: 0px;padding: 0px;
}
body {
	margin: 0;
    height: 100%;
    background: #FDF3FF;
}
.container{
	width: 937px; margin: 0px auto;
}
#header{
	overflow: hidden;
}
#header>h1{
	width: 937px;
	height: 209px;
	background-image: url("<%=root%>/imgs/title.png");
	text-indent: -999px;
	float: left;
}
#menu{
	background-color: MediumPurple;
}
#menu>ul{
	list-style: none;
	overflow: hidden;
	width: 750px;
	margin: 0px auto;
}
#menu>ul>li{
	float: left;
	width: 150px;
}
#menu>ul>li>a{
	display: block;
	height: 50px;
	box-sizing: border-box;
	color:white;
	text-align: center;
	line-height: 50px;
	text-decoration: none;
}
#menu>ul>li>a:hover{
	background-color: SlateBlue;
}
#footer{
	background-color: #C8BFE7;
	width: 100%;
	height: 50px;
	margin-top: 300px;
	padding-top: 50px;
	padding-bottom: 50px;
	line-height: 50px;
	text-align: center;
}
#content{
	width: 100%;
	height: 50px;
	padding-top: 50px;
	padding-bottom: 50px;
	line-height: 50px;
	text-align: center;
}

</style>

</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<div class="container">
		<div id="header">
			<h1>깜상</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="<%=root%>/">메인</a></li>
				<li><a href="<%=root%>/ggamsang.jsp">깜상집</a></li>
				<li><a href="<%=root%>/board.jsp">자유게시판</a></li>
				<%
					if(userID == null) {
				%>
				<li><a href="<%=root%>/login.jsp">로그인</a></li>
				<li><a href="<%=root%>/join.jsp">회원가입</a></li>
				<%
					} else { 	
				%>
				<li><a href="<%=root%>/logoutAction.jsp">로그아웃</a></li>
				<li><a href="<%=root%>/profile.jsp">내 정보</a></li>
				<%
					}
				%>
			</ul>
		</div>
		<div id="content">
			<h2>어서오세요. 깜상입니다! 환영합니다!</h2>
			<h2>어서오세요. 깜상입니다! 환영합니다!</h2>
			<h2>어서오세요. 깜상입니다! 환영합니다!</h2>
			<h2>어서오세요. 깜상입니다! 환영합니다!</h2>
			<h2>어서오세요. 깜상입니다! 환영합니다!</h2>
			<p>
			이곳은 자신이 감상한 음악, 드라마, 영화, 애니메이션을 보면서 느낌점과 이야기를 나누는 곳 입니다.
			</p>
		</div>
		<div id="footer">
			Copyright by EunJi co.ltd. All rights reserved.
		</div>
	</div>
</body>
</html>