package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CountryDao;


@WebServlet("/countryList")
public class CountryListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CountryDao countryDao = new CountryDao();
		try {
			List<String> list = countryDao.selectCountryList();
			System.out.println(list.size());
			request.setAttribute("list", list);
			request.getRequestDispatcher("/WEB-INF/view/countryList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}