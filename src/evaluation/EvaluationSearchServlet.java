package evaluation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;
import user.UserDAO;

/**
 * Servlet implementation class EvaluationSearchServlet
 */
@WebServlet("/EvaluationSearchServlet")
public class EvaluationSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String ContentDivide = request.getParameter("ContentDivide");
		String searchType = request.getParameter("searchType");
		String search = request.getParameter("search");
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		response.getWriter().write(getJSON(ContentDivide, searchType, search, pageNumber));
	}
	
	public String getJSON(String ContentDivide, String searchType, String search, int pageNumber) {
		if(ContentDivide == null) ContentDivide = "";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		ArrayList<EvaluationDTO> List = evaluationDAO.getList(ContentDivide, searchType, search, pageNumber);
		for(int i = 0; i < List.size(); i++) {
			result.append("[{\"value\": \"" + List.get(i).getUserID() + "\"},");
			result.append("{\"value\": \"" + List.get(i).getContentName() + "\"},");
			result.append("{\"value\": \"" + List.get(i).getContentYear() + "\"},");
			result.append("{\"value\": \"" + List.get(i).getGenreDivide() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getContentDivide() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getEvaluationTitle() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getEvaluationContent()+ "\"}],");
			result.append("{\"value\": \"" + List.get(i).getTotalScore() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getPerformanceScore() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getStoryScore() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getOstScore() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getDirectionScore() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getVisualBeautyScore() + "\"}],");
			result.append("{\"value\": \"" + List.get(i).getLikeCount() + "\"}],");
		}
		result.append("]}");
		return result.toString();
	}

}
