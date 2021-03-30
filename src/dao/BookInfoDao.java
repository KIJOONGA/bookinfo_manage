package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import domain.BookInfo;
import utils.ConnectionDB;

/**
 * 
 * 数据交互层
 * 
 * @author KIJOONGA
 *
 */

public class BookInfoDao {

	public static List<BookInfo> bookInfoList() {
		List<BookInfo> list = new ArrayList<>();
		Connection connection = ConnectionDB.getConnection();
		// select * from bookinfo;
		String sql = "select A.id, A.bookISBN, A.bookName, A.author, A.price, A.typeId, A.publisher from bookinfo A;";
		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				BookInfo entity = new BookInfo();
				entity.setId(resultSet.getInt("id"));
				entity.setBookISBN(resultSet.getString("bookISBN"));
				entity.setBookName(resultSet.getString("bookName"));
				entity.setAuthor(resultSet.getString("author"));
				entity.setPrice(resultSet.getFloat("price"));
				entity.setTypeId(resultSet.getInt("typeId"));
				entity.setPublisher(resultSet.getString("publisher"));
				list.add(entity);
			}
			resultSet.close();
			pStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static void saveBookInfo(BookInfo entity) {
		String sql = "INSERT INTO bookinfo (id, bookISBN, bookName, author, price, typeId, publisher) VALUES (?, ?, ?, ?, ?, ?, ?);";
		Connection connection = ConnectionDB.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, entity.getId());
			pStatement.setString(2, entity.getBookISBN());
			pStatement.setString(3, entity.getBookName());
			pStatement.setString(4, entity.getAuthor());
			pStatement.setFloat(5, entity.getPrice());
			pStatement.setInt(6, entity.getTypeId());
			pStatement.setString(7, entity.getPublisher());
			pStatement.executeUpdate();
			pStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static BookInfo getBookInfoById(int id) {

		String sql = "select A.id, A.bookISBN, A.bookName, A.author, A.price, A.typeId, A.publisher from bookinfo A where A.id = "
				+ id;
		Connection connection = ConnectionDB.getConnection();
		BookInfo entity = null;
		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			ResultSet resultSet = pStatement.executeQuery();
			while (resultSet.next()) {
				entity = new BookInfo();
				entity.setId(resultSet.getInt("id"));
				entity.setBookISBN(resultSet.getString("bookISBN"));
				entity.setBookName(resultSet.getString("bookName"));
				entity.setAuthor(resultSet.getString("author"));
				entity.setPrice(resultSet.getFloat("price"));
				entity.setTypeId(resultSet.getInt("typeId"));
				entity.setPublisher(resultSet.getString("publisher"));
			}
			resultSet.close();
			pStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return entity;

	}

	public static void updateBookInfoById(BookInfo entity) {
		String sql = "UPDATE bookinfo SET bookISBN = ?, bookName = ?, author = ?, price = ?, typeId = ?, publisher = ?  WHERE id = ?";
		Connection connection = ConnectionDB.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.setString(1, entity.getBookISBN());
			pStatement.setString(2, entity.getBookName());
			pStatement.setString(3, entity.getAuthor());
			pStatement.setFloat(4, entity.getPrice());
			pStatement.setInt(5, entity.getTypeId());
			pStatement.setString(6, entity.getPublisher());
			pStatement.setInt(7, entity.getId());
			pStatement.executeUpdate();
			pStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

	public static void deleteBookInfoById(int id) {
		String sql = "delete from bookinfo where id = " + id;
		Connection connection = ConnectionDB.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement(sql);
			pStatement.executeUpdate();
			pStatement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
