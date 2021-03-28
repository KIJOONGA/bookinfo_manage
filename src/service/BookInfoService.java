package service;

import java.util.List;

import domain.BookInfo;

/**
 * 
 * 接口
 * 
 * @author KIJOONGA
 *
 */

public interface BookInfoService {

	/**
	 * 
	 * 查图书列表
	 * 
	 * @return
	 */

	List<BookInfo> BookInfoList();

	/**
	 * 新增图书
	 * 
	 * @param entity
	 */
	void saveBookInfo(BookInfo entity);

	/**
	 * 根据ID查询图书
	 * 
	 * @param id
	 */
	BookInfo getBookInfoById(int id);

	/**
	 * 根据ID更新图书
	 * 
	 * @param entity
	 */
	void updateBookInfoById(BookInfo entity);

	/**
	 * 根据ID删除图书
	 * 
	 * @param id
	 */
	void deleteBookInfoById(int id);

}
