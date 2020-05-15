
<%@page import="java.io.Console"%>
<%@page import="Controller.Dbmanager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Dbmanager db = new Dbmanager();
	String isControl = db.Search(request.getParameter("uname"), request.getParameter("psw"));
	pageContext.setAttribute("isControl", isControl);
%>

<%
	if (isControl.equals("admin")) {
%>
<jsp:include page="../Admin/Admin.jsp" />
<%
	} else if (isControl.equals("user")) {
%>
<jsp:include page="../User/User.jsp" />
<%
	} else {
		out.println("Giris basarisiz, Lutfen tekrar deneyiniz.");
%>
<jsp:include page="../Login/Login.jsp" />
<%
	}
%>
