<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "evaluation.EvaluationDTO" %>
<%@ page import = "evaluation.EvaluationDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.URLEncoder" %>
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
	margin-bottom: 50px;
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

#modal.modal-overlay {
    width: 100%;
    height: 100%;
    position: fixed;
    left: 0;
    top: 0;
    display: none;
    justify-content: center;
    align-items: center;
    background: rgba(0, 0, 0, 0.4);
    
    flex-direction: column;
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
    backdrop-filter: blur(1.5px);
    -webkit-backdrop-filter: blur(1.5px);
    border-radius: 10px;
    border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
    background: rgba( 204, 204, 255, 0.80 );
    box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
    backdrop-filter: blur( 13.5px );
    -webkit-backdrop-filter: blur( 13.5px );
    border-radius: 10px;
    border: 1px solid rgba( 255, 255, 255, 0.18 );
    width: 450px;
    height: 750px;
    position: relative;
    padding: 10px;
}

#modal .modal-header {
    padding-left: 10px;
    display: inline;
    text-shadow: 1px 1px 2px gray;
    color: white;
    
}
#modal .title h2 {
    display: inline;
}
#modal .modal-title{
	display: inline;
	font-size: 25px;
}
#modal .close-area {
    display: inline;
    float: right;
    cursor: pointer;
    text-shadow: 1px 1px 2px gray;
    color: white;
    text-align: center;
	font-size: 30px;
    padding: 5px;
    padding-top: 0px;
    padding-bottom: 0px;
    background-color: MediumPurple;
    border-color: MediumPurple;
}

#modal .modal-body {
    margin-top: 20px;
    padding: 0px 10px;
    text-shadow: 1px 1px 2px gray;
    color: white;
}

.modal-little-title {
	display: block;
	padding: 5px;
	font-size: 20px;
}
.modal-score {
	display: inline-block; 
	width: 66px;
	font-size: 20px;
	text-align: center;
}
.modal-score > label {
	padding-bottom: 5px;
	padding-top: 5px;
}

.modal-input-title {
	font-size: 17px;
	border-color: white;
	border-radius: 5px;
	padding: 5px;
	width: 410px;
}
.mddal-select-1 {
	font-size: 17px;
	border-radius: 5px;
	padding: 5px;
	border-color: white;
	width: 150px;
}
.modal-content-1 {
	height: 150px; 
	width: 400px; 
	border-color: white; 
	border-radius: 5px;
	padding: 10px;
	font-size: 15px;
}
.mddal-select-2 {
	font-size: 17px;
	border-radius: 5px;
	padding: 5px;
	border-color: white;
	width: 60px;
}
.modal-button {
	font-size: 17px;
	border-radius: 5px;
	padding: 5px;
	border-color: white;
	width: 120px;
	background: white;
	display: inline-block;
	cursor:pointer;
}
.btn-modal {
	font-size: 17px;
	border-radius: 5px;
	padding: 3px;
	border-color: #bea5ed;
	width: 100px;
	background: #bea5ed;
	display: inline-block;
	cursor:pointer;
	color: white;
}
.btn-modal:hover {
	background: #7e4dda;
}
.main-content-wrap{
	margin-top: 20px;
	background: white;
	border-radius: 10px;
}
.main-content-title {
	border-radius: 5px;
	padding: 15px;
    border: 1px solid lightgrey;
    height: 20px;
}
.main-content-content {
	border-radius: 5px;
	padding: 15px;
    border: 1px solid lightgrey;
    height: auto;
    margin-bottom: 10px;
}
.main-content-text1 {
	font-size: 20px;
	margin-bottom: 10px;
}
.main-content-text2{
	font-size: 15px;
	margin-bottom: 10px;
}
.main-content-menu {
	margin: 10px;
	margin-left: 0px;
	margin-right: 0px;
	font-size: 16px;
	border-radius: 5px;
	padding: 5px;
	border: 1px solid lightgrey;
	width: 120px;
	text-align: center;
	cursor:pointer;
}
.main-content-search {
	font-size: 16px;
	border-color: white;
	border-radius: 5px;
	padding: 5px;
	width: 300px;
}
.main-content-search-btn {
	font-size: 17px;
	border-radius: 5px;
	padding: 3px;
	border-color: #bea5ed;
	width: 70px;
	background: #bea5ed;
	display: inline-block;
	cursor:pointer;
	color: white;
}
.main-content-search-btn:hover {
	background: #7e4dda;
}
.main-content-search-btn2 {
	background: #bea5ed;
	width: 150px;
	padding: 8px;
	padding-left: 20px;
	padding-right: 20px;
	cursor:pointer;
	color: white;
	font-size: 20px;
	border-radius: 5px;
	text-decoration: none;
}
.main-content-ul{
	margin-top: 15px;
	font-size: 17px;
	border-radius: 5px;
	padding: 3px;
	width: 100%;
	display: inline-block;
	cursor:pointer;
	color: white;
	list-style: none;
	
}

</style>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
<script type="text/javascript">

$(function(){
	 
  $("#btn-modal-add").click(function(){        
      $("#modal").css('display','flex').hide().fadeIn();
      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
  });
  
  $("#close1").click(function(){
      modalClose1(); //모달 닫기 함수 호출
  });
  
  $("#close1-1").click(function(){
      modalClose1(); //모달 닫기 함수 호출
  });
  
  function modalClose1(){
      $("#modal").fadeOut(); //페이드아웃 효과
  }
  
});

var searchRequest = new XMLHttpRequest();
function searchFunction() {
	searchRequest.open("Post", "./EvaluationSearchServlet?ContentDivide=" + encodeURIComponent(document.getElementById('ContentDivide'))
						+ "&searchType=" + encodeURIComponent(document.getElementById('searchType'))
						+ "&search=" + encodeURIComponent(document.getElementById('search'))
						+ "&pageNumber=" + encodeURIComponent(document.getElementById('pageNumber'))
			, true);
	searchRequest.onreadystatechange = searchProcess;
// 	searchRequest.send(null);
		console.log("실행됨11333");
}
function searchProcess() {
// 	request.setCharacterEncoding("UTF-8");
	var contentDivide = "전체";
	var searchType = "최신순";
	var search="";
	var pageNumber=0;

	

	var table = document.getElementById('ajaxTable');
// 	table.innerHTML = "";
		console.log("실행됨11");
	if(searchRequest.readyState == 4 && searchRequest.status == 200) {
		console.log("실행됨112");
		var object = eval('(' + searchRequest.responseText + ')');
		var result = object.result;
		for(var i = 0; i < result.length; i++) {
			var row = table.insertRow(0);
			for(var j = 0; j < result[i].length; j++) {
				var cell = row.insertCell(j);
				cell.innerHTML = result[i][j].value;
			}
		}
	}
}

</script>

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String contentDivide = "전체";
		String searchType = "최신순";
		String search="";
		int pageNumber=0;
		if(request.getParameter("contentDivide") != null) {
			contentDivide = request.getParameter("contentDivide");
		}
		if(request.getParameter("searchType") != null) {
			searchType = request.getParameter("searchType");
		}
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		if(request.getParameter("pageNumber") != null) {
			try{
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}catch (Exception e){
				System.out.println("검색 페이지 번호 오류");
			}
		}
		
		
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
			<div style="display: inline;">
				<form method="get" action="./ggamsang.jsp" >
					<select name="contentDivide" class="main-content-menu" id="contentDivide">
						<option value="전체" selected="selected">전체</option>
						<option value="음악" <% if(contentDivide.equals("음악")) out.println("selected"); %>>음악</option>
						<option value="드라마" <% if(contentDivide.equals("드라마")) out.println("selected"); %>>드라마</option>
						<option value="영화" <% if(contentDivide.equals("영화")) out.println("selected"); %>>영화</option>
						<option value="애니메이션" <% if(contentDivide.equals("애니메이션")) out.println("selected"); %>>애니메이션</option>
					</select>
					<select name="searchType" class="main-content-menu" id="searchType">
						<option value="최신순">최신순</option>
						<option value="추천순" <% if(searchType.equals("추천순")) out.println("selected"); %>>추천순</option>
					</select>
					<input type="text" name="search" class="main-content-search" id="search" onkeyup="searchFunction();" placeholder="내용을 입력하세요.">
					<button type="submit" class="main-content-search-btn">검색</button>
					<button type="button" class="btn-modal" id="btn-modal-add">등록하기</button>
				</form>
			</div>
		<%
			ArrayList<EvaluationDTO> evaluationList = new ArrayList<EvaluationDTO>();
			evaluationList = new EvaluationDAO().getList(contentDivide, searchType, search, pageNumber);
			if(evaluationList != null)
				for(int i = 0; i < evaluationList.size(); i++) {
					if(i==5) break;
					EvaluationDTO evaluation = evaluationList.get(i);
		%>
			<div class="main-content-wrap">
				<div class="main-content-title">
					<div class="" style="float: left;" ><%= evaluation.getContentName() %>&nbsp;&nbsp;<small><%= evaluation.getContentYear() %>&nbsp;<%= evaluation.getContentDivide() %>&nbsp; (장르:<%= evaluation.getGenreDivide() %>)</small></div>
					<div class="" style="float: right;">
						종합<span style="color: red;"><%= evaluation.getTotalScore() %></span>
					</div>
				</div>
				<div class="main-content-content">
					<h5 class="main-content-text1">
						<%= evaluation.getEvaluationTitle() %>
					</h5>
					<p class="main-content-text2"><%= evaluation.getEvaluationContent() %></p>
					<div class="" style="margin-bottom: 35px;">
						<div class="" style="float: left;">
							연기<span style="color: red;">&nbsp;<%= evaluation.getPerformanceScore() %>&nbsp;</span>
							스토리<span style="color: red;">&nbsp;<%= evaluation.getStoryScore() %>&nbsp;</span>
							OST<span style="color: red;">&nbsp;<%= evaluation.getOstScore() %>&nbsp;</span>
							연출<span style="color: red;">&nbsp;<%= evaluation.getDirectionScore() %>&nbsp;</span>
							영상미<span style="color: red;">&nbsp;<%= evaluation.getVisualBeautyScore() %>&nbsp;</span>
							<span style="color: green;">(추천: <%= evaluation.getLikeCount() %>)</span>
						</div>
						<div class="" style="float: right;">
							<a style="text-decoration: none; color: #5553ce" onclick="return confirm('추천하시겠습니까?')" href="./likeyAction.jsp?evaluationID=<%= evaluation.getEvaluationID() %>">추천</a>
							<a style="text-decoration: none; color: #5553ce" onclick="return confirm('삭제하시겠습니까?')" href="./likeyDeleteAction.jsp?evaluationID=<%= evaluation.getEvaluationID() %>">삭제</a>
						</div>
					</div>
				</div>
			</div>
		<% 
			} 
		%>
		</div>
		<ul class="main-content-ul">
			<li style="float: left;">
		<%
			if (pageNumber <= 0) {
		%>
			<a class="main-content-search-btn2">이전</a>
		<%
			} else {
		%>
			<a  class="main-content-search-btn2" href="./ggamsang.jsp?contentDivide=<%= URLEncoder.encode(contentDivide, "UTF-8") %>&searchType=
			<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8") %>&pageNumber=
			<%= pageNumber - 1 %>">이전</a>
		<%
			}
		%>
			</li>
			<li style="float: right;">
		<%
			if(evaluationList.size() < 6) {
		%>
			<a class="main-content-search-btn2">다음</a>
		<%
			} else {
		%>
			<a class="main-content-search-btn2" href="./ggamsang.jsp?contentDivide=<%= URLEncoder.encode(contentDivide, "UTF-8") %>&searchType=
			<%= URLEncoder.encode(searchType, "UTF-8") %>&search=<%= URLEncoder.encode(search, "UTF-8") %>&pageNumber=
			<%= pageNumber + 1 %>">다음</a>
		<%
			}
		%>
			</li>
		</ul>
		
		<div id="modal" class="modal-overlay">
			<div class="modal-window">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">감상 등록</h5>
						<button id="close1" type="button" class="close-area">
							<span>&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form action="./impressionRegisterAction.jsp" method="post">
							<div class="">
								<div class="">
									<label class="modal-little-title">제목</label>
									<input type="text" name="contentName" maxlength="20" placeholder="음악은 제목-가수" class="modal-input-title">
								</div>
							</div>
							<div class="">
								<div class="">
									<label class="modal-little-title">출시 연도</label>
									<select name="contentYear" class="mddal-select-1">
										<option value="2000년 이전">2000년 이전</option>
										<option value="2000년">2001년</option>
										<option value="2002년">2002년</option>
										<option value="2003년">2003년</option>
										<option value="2004년">2004년</option>
										<option value="2005년">2005년</option>
										<option value="2006년">2006년</option>
										<option value="2007년">2007년</option>
										<option value="2008년">2008년</option>
										<option value="2009년">2009년</option>
										<option value="2010년">2010년</option>
										<option value="2011년">2011년</option>
										<option value="2012년">2012년</option>
										<option value="2013년">2013년</option>
										<option value="2014년">2014년</option>
										<option value="2015년">2015년</option>
										<option value="2016년">2016년</option>
										<option value="2017년">2017년</option>
										<option value="2018년">2018년</option>
										<option value="2019년">2019년</option>
										<option value="2020년">2020년</option>
										<option value="2021년">2021년</option>
										<option value="2022년">2022년</option>
										<option value="2023년" selected>2023년</option>
									</select>
								</div>
								<div class="">
									<label class="modal-little-title">장르</label>
									<select name="genreDivide" class="mddal-select-1">
										<option value="해당없음" selected>해당없음</option>
										<option value="SF">SF</option>
										<option value="개그">개그</option>
										<option value="공포">공포</option>
										<option value="드라마">드라마</option>
										<option value="로맨스">로맨스</option>
										<option value="모험">모험</option>
										<option value="무협">무협</option>
										<option value="미스터리">미스터리</option>
										<option value="범죄">범죄</option>
										<option value="성인">성인</option>
										<option value="스릴러">스릴러</option>
										<option value="스포츠">스포츠</option>
										<option value="액션">액션</option>
										<option value="음식">음식</option>
										<option value="일상">일상</option>
										<option value="재난">재난</option>
										<option value="추리">추리</option>
										<option value="판타지">판타지</option>
										<option value="치유">치유</option>
									</select>
								</div>
								<div class="">
									<label class="modal-little-title">감상 구분</label>
									<select name="contentDivide" class="mddal-select-1">
										<option value="음악" selected>음악</option>
										<option value="드라마">드라마</option>
										<option value="영화">영화</option>
										<option value="애니메이션">애니메이션</option>
									</select>
								</div>
							</div>
							<div class="">
								<label class="modal-little-title">감상 제목</label>
								<input type="text" name="evaluationTitle" class="modal-input-title" maxlength="30">
							</div>
							<div class="">
								<label class="modal-little-title">내용</label>
								<textarea name="evaluationContent" class="modal-content-1" maxlength="2048"></textarea>
							</div>
							<div class="" style="padding-bottom: 20px">
								<div class="modal-score">
									<label class="modal-score">종합</label>
									<select name="totalScore" class="mddal-select-2">
										<option value="A" selected>A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="F">F</option>
									</select>
								</div>
								<div class="modal-score">
									<label class="modal-score">연기</label>
									<select name="performanceScore" class="mddal-select-2">
										<option value="A" selected>A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="F">F</option>
									</select>
								</div>
								<div class="modal-score">
									<label class="modal-score">연출</label>
									<select name="directionScore" class="mddal-select-2">
										<option value="A" selected>A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="F">F</option>
										<option value="해당없음">해당없음</option>
									</select>
								</div>
								<div class="modal-score">
									<label class="modal-score">OST</label>
									<select name="ostScore" class="mddal-select-2">
										<option value="A" selected>A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="F">F</option>
										<option value="해당없음">해당없음</option>
									</select>
								</div>
								<div class="modal-score">
									<label class="modal-score">스토리</label>
									<select name="storyScore" class="mddal-select-2">
										<option value="A" selected>A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="F">F</option>
										<option value="해당없음">해당없음</option>
									</select>
								</div>
								<div class="modal-score">
									<label class="modal-score">영상미</label>
									<select name="visualBeautyScore" class="mddal-select-2">
										<option value="A" selected>A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="F">F</option>
										<option value="해당없음">해당없음</option>
									</select>
								</div>
							</div>
							<div class="" style="text-align: center;">
								<button type="submit" class="modal-button" id="confirm">등록하기</button>
								<button type="button" class="modal-button" id="close1-1">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			Copyright by EunJi co.ltd. All rights reserved.
		</div>
	</div>
</body>
</html>