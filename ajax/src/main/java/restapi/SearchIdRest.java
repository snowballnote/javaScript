package restapi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MemberDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

@WebServlet("/restapi/searchId")
public class SearchIdRest extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// html을 응답하는 용도 -> String or XML or JSON문자열 응답으로 변경
		response.setContentType("applicatation/json");
		PrintWriter out = response.getWriter();
		
		System.out.println("SearchIdRest /searchId요청발생");
		String searchId = request.getParameter("searchId");
		System.out.println("searchId==> " + searchId);
		
		// DAO 호출
		MemberDao memberDao = new MemberDao();
		String result = null;
		try {
			result = memberDao.selectSearchId(searchId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// JSON문자열 형태: {"result" : "사용불가"}, {"result" : "사용가능"}
		Map<String, String> map = new HashMap<String, String>();
		map.put("result", "사용불가"); // 사용가능
		// map --> "{\"result\" : \"사용불가\"}" 문자열
		// 자바의 객체를 JSON문자열로 변환해주는 API
		
		
		String outStr = "사용불가";
		if(result == null) { // 사용가능한 아이디
			outStr = "사용가능";
		}
		System.out.println(outStr);
		
		// outStr 자바 스트링 객체를 JSON문자열 객체로 변경해서 write
		Gson gson = new Gson();
		String jsonStr = gson.toJson(outStr); // 사용가능
		out.write(jsonStr);
		out.flush();
		out.close();
	}
}
