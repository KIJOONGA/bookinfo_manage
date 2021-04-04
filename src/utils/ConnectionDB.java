package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 * 
 * 连接MySQL
 * 
 * @author KIJOONGA
 *
 */

public class ConnectionDB {

	private static String url = "jdbc:mysql://localhost:3306/book";
	private static String userName = "root";
	private static String password = "123456";
	private static Connection connection = null;
	
	public static Connection getConnection() {
		if (connection == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url, userName, password);
			} catch (ClassNotFoundException e) {
				System.out.println("驱动加载失败");
				e.printStackTrace();
			} catch (SQLException e) {
				System.out.println("MySQL连接失败");
				e.printStackTrace();
			}
		}
		return connection;
	}
	
	public static void main(String args[])throws Exception{
    	Connection connection=ConnectionDB.getConnection();
    	System.out.println(connection.getCatalog());
    }

}
