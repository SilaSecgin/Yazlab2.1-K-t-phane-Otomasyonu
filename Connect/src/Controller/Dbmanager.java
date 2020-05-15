package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dbmanager {
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/veritabani?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
					"root", "admin");
			return conn;
		} catch (ClassNotFoundException e1) {

			e1.printStackTrace();
			return null;
		}

		catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}

	public String Search(String username, String password) {

		Connection con = getConnection();

		String query = "SELECT * FROM users WHERE username='" + username + "' AND password= '" + password + "'";

		Statement stmt = null;
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String test = null;
		try {
			while (rs.next()) {

				System.out.println(rs.getString("username") + rs.getString("password") + rs.getString("isadmin"));
				test = rs.getString("isadmin");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (test != null) {
			return test;
		}
		return "False";

	}

	public String listAdmin() {

		Connection con = getConnection();

		String query = "SELECT users.user_id,users.username, books.bookName, books.startDate, books.endDate FROM users INNER JOIN books ON users.user_id = books.user_id";

		Statement stmt = null;
		try {
			stmt = con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery(query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			while (rs.next()) {

				System.out.println(rs.getString("username") + rs.getString("password") + rs.getString("isadmin"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "false";
	}

	public static void consoleWrite(String text) {
		System.out.println(text);
	}
}
