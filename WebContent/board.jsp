<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
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
  font-size: 16px;
  width: 100%;
  border-bottom: 1px solid #ccc;
  background-color: white;
  border: 0px;
}
.table a {
  color: #333;
  display: inline-block;
  vertical-align: middle;
}
.table a:hover {
  text-decoration: underline;
}
.table th {
  text-align: center;
  border-bottom: 2px solid #ccc;
}

.table .th-num {
  width: 100px;
  text-align: center;
}
.table .th-title {
  width: 500px;
}
.table .th-write {
  width: 160px;
}
.table .th-date {
  width: 200px;
}
.table th, .table td {
  padding: 10px 0;
}
.table tbody td {
  border-bottom: 1px solid #e7e7e7;
  text-align: center;
}
.table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}
.title {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
  text-decoration: none;
  float: left;
}
.title:hover {
  text-decoration: underline;
}
.btn {
  padding: 13px 30px;
  background-color: #8F6597;
  color: white;
  text-decoration: none;
  top: 30px;
/*   left: 45%; */
  float: right;
  position: relative;
  display :inline-block;
  margin:auto;
}
.board-btn {
  padding: 13px 30px;
  background-color: #8F6597;
  color: white;
  text-decoration: none;
  top: 30px;
/*   left: 45%; */
  position: relative;
  display :inline-block;
  margin:auto;
}
#footer{
	background-color: #C8BFE7;
	width: 100%;
	height: 50px;
	padding-top: 50px;
	padding-bottom: 50px;
	line-height: 50px;
	text-align: center;
}
.p {
	margin-left: 10px;
	text-decoration: none;
}

</style>

<script type="text/javascript" src="./js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="./js/menu.js"></script>
<script type="text/javascript">

var sucFunc = function(data){
	
    $('tbody > tr').remove();
    $('.page > a').remove();
    var page;
     data.feed.forEach(function(ele){
       maxCnt=ele.maxCnt;
       page=ele.page;
       $('<tr/>')
          .append($('<td/>').html('<a href="view.jsp?bbsID='+ele.bbsID+'">'+ele.bbsID+'</a>'))   
          .append($('<td/>').html('<a href="view.jsp?bbsID='+ele.bbsID+'">'+ele.bbsTitle+'</a>'))   
          .append($('<td/>').html('<a href="view.jsp?bbsID='+ele.bbsID+'">'+ele.userID+'</a>'))   
          .append($('<td/>').html('<a href="view.jsp?bbsID='+ele.bbsID+'">'+ele.bbsDate+'</a>'))
       .appendTo('tbody');
     });
    var start=5*parseInt((page-1)/5);
    var end=start+5;
    if(end>maxCnt)end=maxCnt;
    console.log(start+":start "+end+":end")
    if(start!=0){
       $('.page').append($('<a href="#" class="p" onclick="pageClick('+(start-2)+')"/>').text("《"));
    }
    for(var i=start; i<end; i++){
       $('.page').append($('<a href="#" class="p" onclick="pageClick('+i+')"/>').text(i+1));
    }
    if(end<maxCnt){
       $('.page').append($('<a href="#" class="p" onclick="pageClick('+end+')"/>').text("》"));
    }
 };
 
 function pageClick(page){
     page=page+1;
        $.ajax({
             url: 'board.do',
             type: 'get',
             contentType:'application/x-www-form-urlencoded; charset=UTF-8',
             data: {page:page},
             dataType: "json",
             success: sucFunc
         });
 };
     
$(function(){
	console.log("실행됨");
 $.ajax({
        url: 'board.do',
        type: 'get',
        contentType:'application/x-www-form-urlencoded; charset=UTF-8',
        dataType: "json",
        success: sucFunc
    })
 })
     
</script>

</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			
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
			<h3>자유게시판</h3>
			<div class="row">
				<table class="table" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th class="th-num">번호</th>
							<th class="th-title">제목</th>
							<th class="th-writer">작성자</th>
							<th class="th-date">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
// 							BbsDAO bbsDAO = new BbsDAO();
// 							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
// 							for(int i=0;i<list.size();i++){
						%>
<!-- 						<tr> -->
<%-- 							<td><%= list.get(i).getBbsID() %></td> --%>
<%-- 							<td><a class="title" href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")	 %></a></td> --%>
<%-- 							<td><%= list.get(i).getUserID() %></td> --%>
<%-- 							<td><%= list.get(i).getBbsDate().substring(0,16)%></td> --%>
<!-- 						</tr> -->
<%-- 						<% } %> --%>
					</tbody>
				</table>
				<%
// 					if(pageNumber != 1) {
				%>
<%-- 					<a href="board.jsp?pageNumber=<%=pageNumber - 1 %>" class="board-btn" >이전</a> --%>
				<% 
// 					} 
// 					if (bbsDAO.nextPage(pageNumber+1)) {
				%>
<%-- 					<a href="board.jsp?pageNumber=<%=pageNumber + 1 %>" class="board-btn" >다음</a> --%>
				<%
// 					}
				%>
				<a class="btn" href="write.jsp">글쓰기</a>
				<div style="text-align: center;" id="page" class="page">
				<%
// 					int pageCount = bbsDAO.getPageCount();
// 					for (int i = 1; i <= pageCount; i++) {
				%>
<%-- 				  	<a href="#" onclick="loadPage(<%= i %>)" style="text-align: center;"><%= i %></a> --%>
<%-- 				<% } %> --%>
				</div>
			</div>
		</div>
		<div id="footer">
			Copyright by EunJi co.ltd. All rights reserved.
		</div>
	</div>
</body>
</html>
