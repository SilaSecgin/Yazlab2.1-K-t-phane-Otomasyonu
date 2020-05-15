<%@page import="Controller.ReadImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	ReadImage readImage = new ReadImage();

	String line = readImage.oku();

	session.setAttribute("line", line);

	response.sendRedirect("../Admin/addnewbooks.jsp?line=" + line);
%>
