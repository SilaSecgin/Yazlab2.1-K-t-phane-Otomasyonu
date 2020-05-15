<%@page import="Controller.ReadImage"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	ReadImage readImage = new ReadImage();
	String path = request.getParameter("file");
	readImage.txtConvert(path);
%>
<jsp:include page="../Admin/addnewbooks.jsp" />