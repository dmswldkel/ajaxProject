package user;

import java.sql.SQLException;
import java.util.List;

public class DaoTest {
	static User target=new User();
	static UserDAO dao=new UserDAO();

	public static void main(String[] args) throws SQLException {
		getListTest();
	}
	
	public static void getListTest() throws SQLException {
		List<User> list=dao.getList();
		System.out.println(list!=null);
		System.out.println(list.size()>0);		
	}

}



