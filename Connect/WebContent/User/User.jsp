<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.Dbmanager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Page</title>
</head>
<body>
	<%
		final String name = request.getParameter("uname");
	%>
	<div>
		<form action="../User/User.jsp">
			<label><b>Kitap Adi</b></label> <input type="text"
				placeholder="Kitap adini giriniz" name="bookName" id="bookName">
			<label><b>ISBN</b></label> <input type="text"
				placeholder="ISBN giriniz" name="isbn" id="isbn">

			<button type="submit">Kitap Ara</button>

			<input type="text" name="uname" id="uname" value="<%=name%>" hidden>
		</form>

	</div>
	<table class="table">
		<thead>
			<tr>
				<th>Id</th>
				<th>Kitap Adi</th>
				<th>Isbn</th>
				<th>Baslangic Zamani</th>
				<th>Bitis Zamani</th>

			</tr>
		</thead>

		<tbody>
			<%
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/veritabani?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
						"root", "admin");
				Statement stat = con.createStatement();
				String query = null;
				String bookName = null;
				bookName = String.valueOf(request.getParameter("bookName"));
				String isbn = null;
				isbn = String.valueOf(request.getParameter("isbn"));

				if ((bookName != null && bookName.trim().length() > 0) || (isbn != null && isbn.trim().length() > 0)) {
					query = "SELECT * FROM books WHERE endDate IS NULL AND startDate IS NULL AND bookName = '" + bookName
							+ "' OR bookIsbn = '" + isbn + "' ";
				} else {
					query = "SELECT * FROM books WHERE endDate IS NULL AND startDate IS NULL";
				}
				ResultSet res2 = stat.executeQuery(query);
				if (res2.next()) {

				}
				ResultSet res = stat.executeQuery(query);
				while (res.next()) {
			%>
			<tr>
				<td><%=res.getString("books.book_id")%></td>
				<td><%=res.getString("books.bookName")%></td>
				<td><%=res.getString("books.bookIsbn")%></td>
				<td><%=res.getString("books.startDate")%></td>
				<td><%=res.getString("books.endDate")%></td>
				<td><a
					href="../User/getBooks.jsp?bookId=<%=res.getString("books.book_id")%>&uname=<%=name%>"
					class="btn btn-primary"> Kitap Al </a></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<div>

		<form action="../User/bookGiveWriteText.jsp?uname=<%=name%>"
			method="get" enctype="multipart/form-data">

			<p>
				Secilen Fotograf : <input type="file" name="file" size="45" /> <input
					type="submit" value="Yükle" />

			</p>
			<input type="text" name="uname" id="uname" value="<%=name%>" hidden>
		</form>


		<form action="../User/bookGive.jsp?uname=<%=name%>" method="post">

			<button type="submit">Kitap Ver</button>
		</form>

	</div>
	<div class="col-md-6">
		<br>
		<br>
		<br> <a href="../Login/Login.jsp" class="btn btn-primary">
			Cikis </a>

	</div>
</body>
</html>