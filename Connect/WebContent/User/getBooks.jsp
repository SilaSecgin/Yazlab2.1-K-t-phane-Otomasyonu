<%@page import="Controller.Dbmanager"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.sun.xml.internal.bind.v2.TODO"%>
<%@page import="Controller.ReadImage"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	String bookId = request.getParameter("bookId");
	String uname = request.getParameter("uname");
	String userId = null;
	int getDate = 0;
	int count = 0;

	Dbmanager dbmanager = new Dbmanager();
	if (bookId != null && uname != null) {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/veritabani?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
				"root", "admin");

		Statement stat = con.createStatement();
		String query = "SELECT user_id FROM users WHERE username LIKE '" + uname + "'";
		ResultSet res = stat.executeQuery(query);
		if (res.next()) {
			userId = res.getString("user_id");
			String query2 = "SELECT COUNT(endDate) FROM books WHERE now() > endDate AND user_id = '" + userId
					+ "'";
			ResultSet res2 = stat.executeQuery(query2);
			if (res2.next()) {
				getDate = res2.getInt("COUNT(endDate)");
				if (getDate == 0) {
					String query3 = "SELECT COUNT(book_id) FROM books WHERE user_id = '" + userId + "'";
					ResultSet res3 = stat.executeQuery(query3);
					if (res3.next()) {
						count = res3.getInt("COUNT(book_id)");
						if (count < 3) {
							long iDay = Long.parseLong("1");
							iDay = iDay * 86400000; // Bir gün * toplam bir günün milisecondı
							iDay = iDay + (86400000 * 6);
							Timestamp stamp = new Timestamp(System.currentTimeMillis() + iDay);
							String currentTimestamp = stamp.toString().substring(0, 19);
							String query4 = "UPDATE books SET endDate = '" + currentTimestamp
									+ "' WHERE book_id = " + bookId + "";
							stat.execute(query4);

							Timestamp stamp2 = new Timestamp(System.currentTimeMillis());
							String currentTimestamp2 = stamp2.toString().substring(0, 19);
							String query5 = "UPDATE books SET startDate = '" + currentTimestamp2
									+ "' WHERE book_id = " + bookId + "";
							stat.execute(query5);

							String query6 = "UPDATE books SET user_id = '" + userId + "' WHERE book_id = "
									+ bookId + "";
							stat.execute(query6);
						} else {
							dbmanager.consoleWrite("En fazla 3 kitap alabilirsiniz..");
						}
					}
				} else {
					dbmanager.consoleWrite("Günü geçmiş kitabınızı teslim ediniz..");
				}
			}
		}
	}

	response.sendRedirect("../User/User.jsp?uname=" + uname + "&bookName=&isbn=");
%>
