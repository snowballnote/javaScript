<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:xe"
				, "system"
				, "java1234");
		String sql = "select sysdate from dual";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		rs.next();
		System.out.println("오늘 날짜: "+ rs.getString(1));
	} catch(ClassNotFoundException cne) {
		System.out.println("Class.forName 예외발생");
		cne.printStackTrace();
	} catch(SQLException se) {
		System.out.println("SQLException 예외발생");
		se.printStackTrace();
	} finally {
		rs.close();
		stmt.close();
		conn.close();
	}
%>
</body>
</html>
