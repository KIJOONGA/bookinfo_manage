package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import impl.BookInfoServiceImpl;
import service.BookInfoService;

/**
 * 
 * 图书删除控制器
 * 
 * @author KIJOONGA
 *
 */

@SuppressWarnings("serial")
@WebServlet("/bookInfoDelete")
public class BookInfoDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 根据id删除
		BookInfoService BookInfoService = new BookInfoServiceImpl();
		BookInfoService.deleteBookInfoById(Integer.parseInt(req.getParameter("id")));
		// req.getRequestDispatcher("bookInfoList").forward(req, resp);
		resp.sendRedirect("bookInfoList");
		
	}
}
