<%@page import="Controller.Dbmanager"%>
<%@page import="Controller.ReadImage"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kitap Ekle</title>
</head>

<body>

	<form action="../Admin/convertText.jsp" method="get"
		enctype="multipart/form-data">

		<p>
			Secilen Fotograf : <input type="file" name="file" size="45" />
		</p>

		<input type="submit" value="Yükle" />
	</form>
	<form action="../Admin/writeText.jsp" method="get">

		<button type="submit">Yaz</button>
	</form>

	<form action="" method="post">
		<div class="container">
			<label for="bookname"><b>Kitap Adi</b></label> <input type="text"
				placeholder="Enter BookName" name="bookname" id="bookname" required>
		</div>
		<div class="container">
			<label for="isbn"><b>Isbn</b></label> <input type="text"
				placeholder="Enter Isbn" name="isbn" id="isbn"
				value="<%=session.getAttribute("line")%>" required>
		</div>
		<div>
			<button type="submit">Ekle</button>
		</div>

	</form>

</body>
</html>
<%
	Dbmanager dbmanager = new Dbmanager();
	String bookName = request.getParameter("bookname");
	String isbn = request.getParameter("isbn");
	if (bookName != null && isbn != null) {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/veritabani?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
				"root", "admin");
		Statement stat = con.createStatement();
		String query = "INSERT INTO books (bookName, bookIsbn) VALUES ('" + bookName + "', '" + isbn + "')";
		stat.execute(query);
		ReadImage readImage = new ReadImage();
		readImage.clearTxt();
		session.setAttribute("line", "");
		response.sendRedirect("../Admin/Admin.jsp");
	} else {
		dbmanager.consoleWrite("Kitap ismi veya isbn girilmemis..");
	}
%>
