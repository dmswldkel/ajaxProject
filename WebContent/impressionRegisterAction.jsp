<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO" %>
<%@ page import="evaluation.EvaluationDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		
		String contentName=null;
		String contentYear=null;
		String genreDivide=null;
		String contentDivide=null;
		String evaluationTitle=null;
		String evaluationContent=null;
		String totalScore=null;
		String performanceScore=null;
		String storyScore=null;
		String ostScore=null;
		String directionScore=null;
		String visualBeautyScore=null;
		
		if(request.getParameter("contentName") != null) {
			contentName = request.getParameter("contentName");
		}
		if(request.getParameter("contentYear") != null) {
			contentYear = request.getParameter("contentYear");
		}
		if(request.getParameter("genreDivide") != null) {
			genreDivide = request.getParameter("genreDivide");
		}
		if(request.getParameter("contentDivide") != null) {
			contentDivide = request.getParameter("contentDivide");
		}
		if(request.getParameter("evaluationTitle") != null) {
			evaluationTitle = request.getParameter("evaluationTitle");
		}
		if(request.getParameter("evaluationContent") != null) {
			evaluationContent = request.getParameter("evaluationContent");
		}
		if(request.getParameter("totalScore") != null) {
			totalScore = request.getParameter("totalScore");
		}
		if(request.getParameter("performanceScore") != null) {
			performanceScore = request.getParameter("performanceScore");
		}
		if(request.getParameter("storyScore") != null) {
			storyScore = request.getParameter("storyScore");
		}
		if(request.getParameter("ostScore") != null) {
			ostScore = request.getParameter("ostScore");
		}
		if(request.getParameter("directionScore") != null) {
			directionScore = request.getParameter("directionScore");
		}
		if(request.getParameter("visualBeautyScore") != null) {
			visualBeautyScore = request.getParameter("visualBeautyScore");
		}
		
		if (contentName == null || contentYear == null || genreDivide == null
			|| contentDivide == null || evaluationTitle == null || evaluationContent == null 
			|| totalScore == null || performanceScore == null || storyScore == null 
			|| ostScore == null || directionScore == null || visualBeautyScore == null
			|| evaluationTitle.equals("") || evaluationContent.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력되지 않은 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} 
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		int result = evaluationDAO.write(new EvaluationDTO(0, userID, contentName, contentYear,
				genreDivide, contentDivide, evaluationTitle, evaluationContent, totalScore, performanceScore, 
				storyScore, ostScore, directionScore, visualBeautyScore, 0));	
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('감상 등록 실패')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'ggamsang.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>