<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="likey.LikeyDTO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
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
		
		request.setCharacterEncoding("UTF-8");
		String evaluationID = null;
		if(request.getParameter("evaluationID") != null) {
			evaluationID = request.getParameter("evaluationID");
		}
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		if(userID.equals(evaluationDAO.getUserID(evaluationID))) {
			int result = new EvaluationDAO().delete(evaluationID);
			if (result == 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제가 완료되었습니다.')");
				script.println("location.href = 'ggamsang.jsp'");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('데이터베이스 오류 발생.')");
				script.println("history.back();");
				script.println("</script>");
			}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('자신이 쓴 글만 삭제 가능합니다.')");
			script.println("history.back();");
			script.println("</script>");
		}
	%>
</body>
</html>