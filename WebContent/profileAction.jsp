<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- <jsp:useBean id="user" class="user.User" scope="page" /> --%>
<%-- <jsp:setProperty property="userPassword" name="user" /> --%>
<%-- <jsp:setProperty property="new_userPassword" name="user" /> --%>
<%-- <jsp:setProperty property="new_userPassword_confirm" name="user" /> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용 가능합니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		if (request.getParameter("userPassword") == null || request.getParameter("new_userPassword") == null
				|| request.getParameter("new_userPassword_confirm") == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(userID, request.getParameter("userPassword"), request.getParameter("new_userPassword"), request.getParameter("new_userPassword_confirm"));	
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류) 비번 변경 실패')");
				script.println("history.back()");
				script.println("</script>");
			} else if (result == -2) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('기존 비밀번호가 틀립니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else if (result == -3) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('새 비밀번호와 확인 비밀번호가 서로 다릅니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>