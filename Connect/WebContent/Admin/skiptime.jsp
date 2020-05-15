<%@page import="Controller.Dbmanager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.sun.xml.internal.bind.v2.TODO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Zaman Atla</title>
</head>

<body>
	<form action="" method="post">

		<div class="container">
			<label for="bookId"><b>Kitap Id</b></label> <input type="text"
				placeholder="Enter endDate" name="bookId" id="bookId" required>
		</div>

		<div class="container">
			<label for="day"><b>Atlanacak Gun Sayisi</b></label> <input
				type="text" placeholder="Enter endDate" name="day" id="day" required>
		</div>

		<div>
			<button type="submit">Zaman Atla</button>
		</div>

	</form>
</body>
</html>
<%
	String day = request.getParameter("day");
	String bookId = request.getParameter("bookId");
	Dbmanager dbmanager = new Dbmanager();
	if (bookId != null && day != null) {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/veritabani?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
				"root", "admin");
		Statement stat = con.createStatement();
		String query = "SELECT book_id FROM books WHERE book_id LIKE '" + bookId + "'";
		ResultSet res = stat.executeQuery(query);
		if (res.next()) { /// Eğer bookId varsa buraya gir
			String query3 = "SELECT endDate FROM books WHERE book_id LIKE '" + bookId + "'";
			ResultSet res2 = stat.executeQuery(query3);
			if (res2.next()) { /// Eğer endDate varsa buraya gir
				String test = res2.getString("endDate");
				long iDay = Long.parseLong(day);
				iDay = iDay * 86400000; // Bir gün * toplam bir günün milisecondı
				iDay = iDay + (86400000 * 7);
				Timestamp stamp = new Timestamp(System.currentTimeMillis() + iDay);

				String currentTimestamp = stamp.toString().substring(0, 19);

				String query2 = "UPDATE books SET endDate = '" + currentTimestamp + "' WHERE book_id = "
						+ bookId + "";
				stat.execute(query2);
				response.sendRedirect("../Admin/Admin.jsp");
			}
		}
	} else {
		dbmanager.consoleWrite("Kitap ismi ve kitap id boş geçilemez..");
	}
%>
