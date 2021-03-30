package impl;

import java.util.List;

import dao.BookInfoDao;
import domain.BookInfo;
import service.BookInfoService;

/**
 * 用户接口
 * @author KIJOONGA
 *
 */

public class BookInfoServiceImpl implements BookInfoService {

	@Override
	public List<BookInfo> BookInfoList() {
		return BookInfoDao.bookInfoList();
	}

	@Override
	public void saveBookInfo(BookInfo entity) {
		BookInfoDao.saveBookInfo(entity);
		
	}

	@Override
	public BookInfo getBookInfoById(int id) {
		return BookInfoDao.getBookInfoById(id);
		
	}

	@Override
	public void updateBookInfoById(BookInfo entity) {
		BookInfoDao.updateBookInfoById(entity);

	}

	@Override
	public void deleteBookInfoById(int id) {
		BookInfoDao.deleteBookInfoById(id);
		
	}


}
