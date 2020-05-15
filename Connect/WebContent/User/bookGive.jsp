<%@page import="com.sun.xml.internal.bind.v2.TODO"%>
<%@page import="Controller.ReadImage"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	ReadImage readImage = new ReadImage();

	String isbn = readImage.oku();
	String uname = request.getParameter("uname");
	String user_id = null;
	/* out.println(uname + isbn); */

	/* TODO 
	VERME İŞLEMİ DATABASE FONKSİYONUNDA YAPILACAK. */
	if (uname != null && isbn != null) {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/veritabani?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
				"root", "admin");
		Statement stat = con.createStatement();
		String query = "SELECT user_id FROM users WHERE username LIKE '" + uname + "'";
		ResultSet res = stat.executeQuery(query);
		if (res.next()) { /// Eğer userId varsa buraya gir
			user_id = res.getString("user_id");
			String query2 = "UPDATE books SET endDate = NULL WHERE bookIsbn LIKE '" + isbn
					+ "' AND user_id LIKE '" + user_id + "'";
			//ResultSet res2 = stat.executeQuery(query2);
			stat.execute(query2);
			String query3 = "UPDATE books SET startDate = NULL WHERE bookIsbn LIKE '" + isbn
					+ "' AND user_id LIKE '" + user_id + "'";
			//ResultSet res3 = stat.executeQuery(query3);
			stat.execute(query3);
			String query4 = "UPDATE books SET user_id = NULL WHERE bookIsbn LIKE '" + isbn
					+ "' AND user_id LIKE '" + user_id + "'";
			//ResultSet res4 = stat.executeQuery(query4);
			stat.execute(query4);
			readImage.clearTxt();

		}

		response.sendRedirect("../User/User.jsp?uname=" + uname + "&bookName=&isbn=");

	}
%>

