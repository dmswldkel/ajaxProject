<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="likey.LikeyDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null || ip.length() ==0){
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() ==0){
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() ==0){
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	%>
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
		
		request.setCharacterEncoding("UTF-8");
		String evaluationID = null;
		if(request.getParameter("evaluationID") != null) {
			evaluationID = request.getParameter("evaluationID");
		}
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		LikeyDAO likeyDAO = new LikeyDAO();
		int result = likeyDAO.like(userID, evaluationID, getClientIP(request));
		if (result == 1) {
			result = evaluationDAO.like(evaluationID);
			if (result == 1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('추천이 완료되었습니다.')");
				script.println("location.href = 'ggamsang.jsp'");
				script.println("</script>");
				script.close();
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
			script.println("alert('이미 추천을 누른 글입니다.')");
			script.println("history.back();");
			script.println("</script>");
		}
	%>
</body>
</html>