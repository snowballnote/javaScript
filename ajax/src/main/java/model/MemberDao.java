package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	public String selectSearchId(String searchId) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc","root","java1234");

		String sql = "SELECT id FROM member WHERE id=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, searchId);
		rs = stmt.executeQuery();

		String result = null;
			if (rs.next()) {
				result = rs.getString(1);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		return result;
	}	
}
