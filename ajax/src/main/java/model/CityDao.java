package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CityDao {
	   public List<String> selectCityList(String country) throws Exception {
	      Class.forName("com.mysql.cj.jdbc.Driver");
	      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc"
	                                 ,"root"
	                                 ,"java1234");
	      PreparedStatement stmt = null;
	      ResultSet rs = null;
	      String sql = "select cityname from city where country=?";
	      
	      stmt = conn.prepareStatement(sql);
	      stmt.setString(1, country);
	      
	      rs = stmt.executeQuery();

	      List<String> list = new ArrayList<String>();
	      while(rs.next()) {
	         list.add(rs.getString(1));   
	      }
	      
	      return list;
	   }
	}
