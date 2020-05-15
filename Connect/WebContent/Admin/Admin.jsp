<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
	<div class="col-md-6">
		<a href="../Admin/skiptime.jsp" class="btn btn-primary"> Zaman
			Atla </a> &nbsp; <a href="../Admin/addnewbooks.jsp"
			class="btn btn-primary"> Yeni Kitap Ekle</a>
	</div>
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>Kullanici</th>
				<th>Kitap Adi</th>
				<th>Baslangic Zamani</th>
				<th>Bitis Zamani</th>
				<th>Book Id</th>
			</tr>
		</thead>

		<tbody>
			<%
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/veritabani?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
						"root", "admin");
				Statement stat = con.createStatement();
				String query = "SELECT users.user_id,users.username, books.bookName, books.startDate, books.endDate, books.book_id FROM users LEFT JOIN books ON users.user_id = books.user_id";
				ResultSet res = stat.executeQuery(query);
				while (res.next()) {
			%>
			<tr>
				<td><%=res.getString("users.user_id")%></td>
				<td><%=res.getString("users.username")%></td>
				<td><%=res.getString("books.bookName")%></td>
				<td><%=res.getString("books.startDate")%></td>
				<td><%=res.getString("books.endDate")%></td>
				<td><%=res.getString("books.book_id")%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
	<div class="col-md-6">
		<br>
		<br>
		<br> <a href="../Login/Login.jsp" class="btn btn-primary">
			Cikis </a>
	</div>
</body>
</html>