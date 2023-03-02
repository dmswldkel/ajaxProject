package evaluation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EvaluationDAO {
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public EvaluationDAO() {
		String url="jdbc:mysql://localhost:3306/lecture";
		String user=System.getenv("MYSQL_USER");
		String password=System.getenv("MYSQL_PW");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			if(conn==null || conn.isClosed())
				conn=DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int write(EvaluationDTO evaluationDTO) {
		String sql="insert into evaluation values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, evaluationDTO.getUserID());
			pstmt.setString(2, evaluationDTO.getContentName());
			pstmt.setString(3, evaluationDTO.getContentYear());
			pstmt.setString(4, evaluationDTO.getGenreDivide());
			pstmt.setString(5, evaluationDTO.getContentDivide());
			pstmt.setString(6, evaluationDTO.getEvaluationTitle());
			pstmt.setString(7, evaluationDTO.getEvaluationContent());
			pstmt.setString(8, evaluationDTO.getTotalScore());
			pstmt.setString(9, evaluationDTO.getPerformanceScore());
			pstmt.setString(10, evaluationDTO.getStoryScore());
			pstmt.setString(11, evaluationDTO.getOstScore());
			pstmt.setString(12, evaluationDTO.getDirectionScore());
			pstmt.setString(13, evaluationDTO.getVisualBeautyScore());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1; // db 오류
	}
	
	public ArrayList<EvaluationDTO> getList (String ContentDivide, String searchType, String search, int pageNumber) {
		if(ContentDivide.equals("전체")) {
			ContentDivide = "";
		}
		ArrayList<EvaluationDTO> evaluationList = null;
		String sql = "";
		try {
			if(searchType.equals("최신순")) {
				sql = "select * from evaluation where ContentDivide like ? and concat(contentName, evaluationTitle, evaluationContent) like" + 
							"? order by evaluationID desc limit " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if (searchType.equals("추천순")) {
				sql = "select * from evaluation where ContentDivide like ? and concat(contentName, evaluationTitle, evaluationContent) like" + 
						"? order by likeCount desc limit " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + ContentDivide + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList = new ArrayList<EvaluationDTO>();
			while(rs.next()) {
					EvaluationDTO evaluation = new EvaluationDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getString(11),
						rs.getString(12),
						rs.getString(13),
						rs.getString(14),
						rs.getInt(15)
					);
					evaluationList.add(evaluation);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn != null) conn.close();
					if(pstmt != null) pstmt.close();
					if(rs != null) rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return evaluationList;
		}
	
	public int like(String evaluationID) {
		String sql="update evaluation set likeCount=likeCount+1 where evaluationID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1; // db 오류
	}
	
	public int delete(String evaluationID) {
		String sql="delete from evaluation where evaluationID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1; // db 오류
	}

	public String getUserID(String evaluationID) {
		String sql="select userID from evaluation where evaluationID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}

