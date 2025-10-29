package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CountryDao {
	public List<String> selectCountryList() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc", "root", "java1234");
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		String sql = "select name from country";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		
		List<String> list = new ArrayList<String>();
		while(rs.next()) {
			list.add(rs.getString(1));
		}
		
		rs.close();
		stmt.close();
		conn.close();
		return list;
	}
}
