<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!-- 	useBean life - scope -->
<!-- 	scope -->
<!-- 	 	1.page - 해당페이지내에서 유지 -->
<!-- 		2.request - 동일request 내에서 유지 -->
<!-- 		3.session - 세션 유지 기간동안(서버에서) -->
<!-- 		4.application - 서버를 열어서 닫기 전까지 -->
    <jsp:useBean id="user" class="user.User" scope="page" />
    <jsp:setProperty property="userID" name="user" />
    <jsp:setProperty property="userPassword" name="user" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>깜상</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());	
		if(result == 1){
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
// 		else if(result == 0){
// 			PrintWriter script = response.getWriter();
// 			script.println("<script>");
// 			script.println("alert('비밀번호가 일치하지 않습니다.')");
// 			script.println("history.back()");
// 			script.println("</script>");
// 		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>