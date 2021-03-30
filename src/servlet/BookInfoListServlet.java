package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.BookInfo;
import impl.BookInfoServiceImpl;
import service.BookInfoService;

/**
 * 
 * 图书列表控制器
 * 
 * @author KIJOONGA
 *
 */

@SuppressWarnings("serial")
@WebServlet("/bookInfoList")
public class BookInfoListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 得到图书列表
		BookInfoService bookInfoService = new BookInfoServiceImpl();
		List<BookInfo> list = bookInfoService.BookInfoList();
		req.setAttribute("bookInfoList", list);
		req.getRequestDispatcher("/book_info_list.jsp").forward(req, resp);
	}

}
