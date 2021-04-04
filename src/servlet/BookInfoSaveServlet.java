package servlet;

import java.io.IOException;

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
 * 新增图书控制器
 * 
 * @author KIJOONGA
 *
 */
@SuppressWarnings("serial")
@WebServlet("/bookInfoSave")
public class BookInfoSaveServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/book_info_save.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BookInfo entity = new BookInfo();
		String idString = new String(req.getParameter("id").getBytes("ISO-8859-1"),"UTF-8");
		String bookISBNString = new String(req.getParameter("bookISBN").getBytes("ISO-8859-1"),"UTF-8");
		String bookNameString = new String(req.getParameter("bookName").getBytes("ISO-8859-1"),"UTF-8");
		String authorString = new String(req.getParameter("author").getBytes("ISO-8859-1"),"UTF-8");
		String priceString = new String(req.getParameter("price").getBytes("ISO-8859-1"),"UTF-8");
		String typeIdString = new String(req.getParameter("typeId").getBytes("ISO-8859-1"),"UTF-8");
		String publisherString = new String(req.getParameter("publisher").getBytes("ISO-8859-1"),"UTF-8");
		
		if(priceString.equals(""))
			priceString = "-1";
		if(typeIdString.equals(""))
			typeIdString = "-1";
		
		entity.setId(Integer.parseInt(idString));
		entity.setBookISBN(bookISBNString);
		entity.setBookName(bookNameString);
		entity.setAuthor(authorString);
		entity.setPrice(Float.parseFloat(priceString));
		entity.setTypeId(Integer.parseInt(typeIdString));
		entity.setPublisher(publisherString);
		
		BookInfoService BookInfoService = new BookInfoServiceImpl();
		BookInfoService.saveBookInfo(entity);
		// req.getRequestDispatcher("bookInfoList").forward(req, resp);
		resp.sendRedirect("bookInfoList");
	}

}
