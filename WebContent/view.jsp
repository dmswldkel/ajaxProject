<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
#content {
	margin-top: 50px;
	margin-bottom: 400px;
/* 	background-color: white; */
}
#content h3 {
	font-size: 28px;
	color: #333333;
    font-weight: 400;
    text-align: center;
	margin-bottom: 50px;
}
.table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  background-color: white;
}
.table th {
  text-align: center;
}
.table th, .table td {
  padding: 14px 0;
}
.table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}
.btn {
  padding: 13px 30px;
  background-color: #8F6597;
  color: white;
  text-decoration: none;
  top: 30px;
  left: 45%;
  position: relative;
  display :inline-block;
  margin:auto;
  border-style: none;
}
.btn:hover{
	cursor: pointer;
}
.title {
	width: 600px;
	height: 30px;
	border-radius: 5px;
	padding-left: 10px;
}
.content {
	width: 600px;
	border-radius: 5px;
	padding-left: 10px;
	padding-top: 10px;
}
.board-btn {
  padding: 13px 30px;
  background-color: #8F6597;
  color: white;
  text-decoration: none;
  top: 30px;
  position: relative;
  display :inline-block;
  margin:auto;
}

</style>

</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
	<div class="container">
		<div id="header">
			<h1>깜상</h1>
		</div>
		<div id="menu">
			<ul>
				<li><a href="<%=root%>/">메인</a></li>
				<li><a href="<%=root%>/ggamsang.jgp">깜상집</a></li>
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
			<h3>자유게시판</h3>
			<div class="row">
				<table class="table" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" class="th-num">게시판 글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%">글 제목</td>
							<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%= bbs.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일자</td>
							<td colspan="2"><%= bbs.getBbsDate().substring(0,16) %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
					</tbody>
				</table>
				<a href="board.jsp" class="board-btn">목록</a>
				<%
					if(userID != null && userID.equals(bbs.getUserID())) {
				%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="board-btn">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="board-btn">삭제</a>
				<%
					}					
				%>
			</div>
		</div>
		<div id="footer">
			Copyright by EunJi co.ltd. All rights reserved.
		</div>
	</div>
</body>
</html>
