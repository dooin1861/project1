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

request.setCharacterEncoding("UTF-8");


%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table     { width:680px; text-align:center; }
        th        { background-color:cyan; }
        
        .num      { width: 80px; }
        .title    { width:230px; }
        .writer   { width:100px; }
        .regtime  { width:180px; }
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red;  }
    </style>
    <title> Word </title>
</head>
<body>
<table>
    <tr>
        <th>번호</th><th>글 제목</th>
        <th>글쓴이</th><th>작성일</th><th>조회수</th>

	</tr>
    
<%
String sql = "select * from board";
pstmt = conn.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

while(rs.next()) {
	int num = rs.getInt("num");
	String title = rs.getString("title");
	String writer = rs.getString("writer");
	String regtime = rs.getString("regtime");
	int hits = rs.getInt("hits");
%>

	<tr>
	<td><%=num %></td>
	<td><a href="view.jsp?num=<%=num %>"><%=title %></a></td>
	<td><%=writer %></td>
	<td><%=regtime %></td>
	<td><%=hits %></td>
	</tr>
	
<%
}
%>

</table>

	<br>
	<input type="button" value="글쓰기" onclick="location.href='write.jsp'">
	<input type="button" value="홈페이지로 돌아가기" onclick="location.href='index2.jsp'">
</body>
</html>