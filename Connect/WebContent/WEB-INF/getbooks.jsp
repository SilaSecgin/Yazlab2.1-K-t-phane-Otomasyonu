<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <!--  TODO
    ALL :) -->
<%
		String uname = request.getParameter("uname");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/veritabani?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey",
				"root", "admin");
		Statement stat = con.createStatement();
		String query = "SELECT * FROM users WHERE usernames LIKE '" + uname + "'";
		ResultSet res = stat.executeQuery(query);
		String control = null;
		while (res.next()) {
			control = res.getString("user_id");
			out.println("dsa");
		}
%>