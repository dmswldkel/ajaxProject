package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bbs.Bbs;
import bbs.BbsDAO;

public class boardController extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	       resp.setContentType("application/json");
	       resp.setCharacterEncoding("UTF-8");
	       System.out.println("실행됨");
	       int page;
	       if(req.getParameter("page")==null) page=1;
	       else{page= Integer.parseInt(req.getParameter("page"));}
	       PrintWriter out=resp.getWriter();
	       BbsDAO bbsDao = new BbsDAO();
	          try {
	             List<Bbs> list = (List<Bbs>) bbsDao.getFeed(page);
	             int maxCnt = bbsDao.getMaxCnt();
	             out.println("{\"feed\":[");
	             for(int i=0; i <list.size();i++) {
	            	 Bbs bean = list.get(i);
	                if(i!=0)out.print(",");
	                out.println("{\"bbsID\":"+bean.getBbsID()
	                  +",\"bbsTitle\":\""+bean.getBbsTitle()
	                  +"\",\"userID\":\""+bean.getUserID()
	                  +"\",\"bbsDate\":\""+bean.getBbsDate()
	                  +"\",\"page\":"+page
	                  +",\"maxCnt\":"+maxCnt+"}");
	             }
	             out.println("]}");
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	          out.close();
	    }
}
