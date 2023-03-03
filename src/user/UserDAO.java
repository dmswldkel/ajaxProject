package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class UserDAO {
	java.util.logging.Logger log=Logger.getGlobal();
	
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public UserDAO() {
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
	
	public int login(String userID, String userPassword) {
//		String SQL="select userPassword from user where userID = ?";
//		try {
//			pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1,userID);
//			rs=pstmt.executeQuery();
//			if(rs.next()) {
//				if(rs.getString(1).equals(userPassword)) {
//					return 1; // 로그인 성공
//				}
//				else
//					return -1; // 비밀번호 불일치
//			}
//			return -1; // 아이디가 없음
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -2; // 데이터베이스 오류
		return 1;
	}
	
	public int join(User user) {
		String sql = "insert into user values (?, ?, ?, ?, ?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<User> getList() throws SQLException{
		String sql="select * from user";
		List<User> list=null;
		list=new ArrayList<User>();
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			while(rs.next()) {
				User bean=new User();
				bean.setUserID(rs.getString("userID"));
				bean.setUserPassword(rs.getString("userPassword"));
				bean.setUserName(rs.getString("userName"));
				bean.setUserGender(rs.getString("userGender"));
				log.info(bean.toString());
				list.add(bean);
			}
		} finally {
			try {
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				log.severe(e.toString());
			}
		}
		return list;
	}
		
	public int update(String userID, String userPassword, String new_userPassword, String new_userPassword_confirm) {
		String sql = "update user set userPassword = ? where userID = ?";
		try {
			if(login(userID, userPassword) != 1) {
				return -2; // 기존 비번 오류 
			}
			if(new_userPassword.equals(new_userPassword_confirm)) {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, new_userPassword);
				pstmt.setString(2, userID);
				return pstmt.executeUpdate();
			} else {
				return -3; // 새 비번 오류
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}
