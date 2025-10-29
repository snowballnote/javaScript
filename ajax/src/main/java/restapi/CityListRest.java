package restapi;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CityDao;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

@WebServlet("/restapi/cityList")
public class CityListRest extends HttpServlet {
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String country = request.getParameter("county");
      
      response.setContentType("application/json");
      PrintWriter out = response.getWriter();
      
      CityDao cityDao = new CityDao();
      List<String> list = null;
      try {
         list = cityDao.selectCityList(country);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      Gson gson = new Gson();
      String jsonStr = gson.toJson(list);
      out.write(jsonStr); // 응답
      out.flush(); // 버퍼 비움
      out.close(); // 자원 해지
   }

}