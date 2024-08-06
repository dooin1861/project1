<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
     
String URL = "jdbc:mysql://localhost:3307/spring5fs";
Connection conn = null;
PreparedStatement pstmt = null;
Class.forName("com.mysql.cj.jdbc.Driver");
conn = DriverManager.getConnection(URL, "root", "mysql");


String sql = "";
String numTmp = "";

String delete = request.getParameter("num"); 


request.setCharacterEncoding("UTF-8");

if (delete != null) {
	sql = "delete from board where num = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, delete);
	int ret = pstmt.executeUpdate();
	
}
response.sendRedirect("list.jsp");

%>
