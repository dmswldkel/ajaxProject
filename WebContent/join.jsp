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

html {
    height: 100%;
}

body {
    margin: 0;
    height: 100%;
    background: #FDF3FF;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}
#logo {
    width: 240px;
    height: 44px;
    cursor: pointer;
}
.mainLogo {
	width: 150px;
    height: 60px;
	margin: auto;
	margin-top: 50px;
	align-items: center;
	justify-content: center;
	background-image: url("<%=root%>/imgs/mainLogo.png");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	text-indent: -999px;
}

#header {
/*     padding-top: 30px; */
    padding-bottom: 20px;
    text-align: center;
}
#wrapper {
	width: 600px;
    height: 800px;
    margin: auto;
    justify-content: center;
    align-items: center;
    display: flex;
    position: relative;
    background: white;
    border-radius: 50px;
}

#content {
/*     position: absolute; */
/*     left: 50%; */
/*     transform: translate(-50%); */
    width: 460px;
}


/* 입력폼 */


h3 {
    margin: 19px 0 8px;
    font-size: 14px;
    font-weight: 700;
}


.box {
    display: block;
    width: 100%;
    height: 51px;
    border: solid 1px #dadada;
    padding: 10px 14px 10px 14px;
    box-sizing: border-box;
    background: #fff;
    position: relative;
}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
}

input {
    font-family: Dotum,'돋움',Helvetica,sans-serif;    
}

.box.int_id {
    padding-right: 110px;
}

.box.int_pass {
    padding-right: 40px;
}

.box.int_pass_check {
    padding-right: 40px;
}

.pswdImg {
    width: 18px;
    height: 20px;
    display: inline-block;
    position: absolute;
    top: 50%;
    right: 16px;
    margin-top: -10px;
    cursor: pointer;
}

#bir_wrap {
    display: table;
    width: 100%;
}

#bir_yy {
    display: table-cell;
    width: 147px;
    
}

#bir_mm {
    display: table-cell;
    width: 147px;
    vertical-align: middle;
}

#bir_dd {
    display: table-cell;
    width: 147px;
}

#bir_mm, #bir_dd {
    padding-left: 10px;
}

select {
    width: 100%;
    height: 29px;
    font-size: 15px;
    background: #fff url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100% 50% no-repeat;
    background-size: 20px 8px;
    -webkit-appearance: none;
    display: inline-block;
    text-align: start;
    border: none;
    cursor: default;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
}

/* 에러메세지 */

.error_next_box {
    margin-top: 9px;
    font-size: 12px;
    color: red;    
    display: none;
}

#alertTxt {
    position: absolute;
    top: 19px;
    right: 38px;
    font-size: 12px;
    color: red;
    display: none;
}

/* 버튼 */

.btn_area {
    margin: 30px 0 91px;
}

#btnJoin {
    width: 100%;
    padding: 21px 0 17px;
    border: 0;
    cursor: pointer;
    color: white;
    background-color: MediumPurple;
    font-size: 20px;
    font-weight: 400;
    font-family: Dotum,'돋움',Helvetica,sans-serif;
    border-radius: 15px;
}

</style>
</head>
<body>
	<div class="mainLogo" onclick="location.href='<%=root%>/';" style="cursor: pointer;"></div>
	<!-- wrapper -->
	<div id="wrapper">
	    <!-- content-->
	    <div id="content">
	    	<form method="post" action="joinAction.jsp">
	        <!-- ID -->
	        <div>
	            <h3 class="join_title">
	                <label for="id">아이디</label>
	            </h3>
	            <span class="box int_id">
	                <input type="text" id="userID" class="int" name="userID" maxlength="20">
	            </span>
	            <span class="error_next_box"></span>
	        </div>
	
	        <!-- PW -->
	        <div>
	            <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
	            <span class="box int_pass">
	                <input type="password" id="pswd1" class="int" name="userPassword" maxlength="20">
	                <span id="alertTxt">사용불가</span>
	            </span>
	            <span class="error_next_box"></span>
	        </div>
	
	        <!-- NAME -->
	        <div>
	            <h3 class="join_title"><label for="name">이름</label></h3>
	            <span class="box int_name">
	                <input type="text" id="name" class="int" name="userName" maxlength="20">
	            </span>
	            <span class="error_next_box"></span>
	        </div>
	
	        <!-- GENDER -->
	        <div>
	            <h3 class="join_title"><label for="gender">성별</label></h3>
	            <span class="box gender_code">
	                <select id="gender" name="userGender" class="sel">
	                    <option>성별</option>
	                    <option value="남자">남자</option>
	                    <option value="여자">여자</option>
	                </select>                            
	            </span>
	            <span class="error_next_box">필수 정보입니다.</span>
	        </div>
	
	        <!-- EMAIL -->
	        <div>
	            <h3 class="join_title"><label for="email">이메일<span class="optional">(선택)</span></label></h3>
	            <span class="box int_email">
	                <input type="text" id="email" class="int" name="userEmail" maxlength="100" placeholder="선택입력">
	            </span>
	            <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>    
	        </div>
	
	        <!-- JOIN BTN-->
	        <div class="btn_area">
	            <button type="submit" id="btnJoin">
	                <span>가입하기</span>
	            </button>
	        </div>
	    <!-- content-->
		    </form>
	    </div> 
	</div> 
</body>
</html>