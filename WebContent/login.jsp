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

body{
	margin: 0;
    height: 100%;
    background: #FDF3FF;
}
.mainLogo {
	width: 200px;
    height: 80px;
	margin: auto;
	margin-top: 120px;
	align-items: center;
	justify-content: center;
	background-image: url("<%=root%>/imgs/mainLogo.png");
	text-indent: -999px;
/* 	background-color: MediumPurple; */
}
.main {
    width: 250px;
    height: 300px;
    margin: auto;
    margin-top: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    border: 1px solid lightgrey;
    border-radius: 15px;
    background:white;
}

.logo {
    margin-top: 0px;
    margin-bottom: 40px;
    margin-left: 50px;
    color: SlateBlue;
}

#login {
    width: 100%;
    background-color: MediumPurple;
    border-color: transparent;
    color: white;
}

#login:hover{
	cursor: pointer;
}

.account {
    display: block;
    margin-bottom: 10px;
    padding: 10px;
    border: 1px solid lightgray;
    border-radius: 8px;
}

#alert {
    border-color: transparent;
}

</style>
</head>
<body>
	<div class="mainLogo" onclick="location.href='<%=root%>/';" style="cursor: pointer;">
	</div>
	<div class="main">
        <div class="container">
		    <h1 class="logo">로그인</h1>
        	<form method="post" action="loginAction.jsp">
	            <input type="text" placeholder="ID" id="userID" name="userID" class="account">
	            <input type="password" placeholder="Password" id="userPassword" name="userPassword" class="account">
	            <button type="submit" value="login" id="login" class="account">login</button>
	            <p id="alert" class="account"> </p>
        	</form>
        </div>
    </div>   
<!--     <script src="script.js"></script> -->
</body>
</html>