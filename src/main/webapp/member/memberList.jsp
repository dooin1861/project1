<%@page import="java.util.List"%>
<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

MemberDAO dao = new MemberDAO();
List<MemberDTO> list = dao.getMemberList();
String id = request.getParameter("id");
%>

<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>사원 리스트</title>

<head>
    <meta charset="UTF-8">
    <style>
        table     { width:500px; text-align:center; }
        th        { background-color:cyan; }
        
        .id      { width:150px; }
        .name    { width:100px; }
        .pw      { width:150px; }
        
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red;  }
    </style>
</head>
<body>

<table>

	<tr>
        <th class="id"    >사원ID    </th>
        <th class="pw"     >사원번호(비밀번호)    </th>
        <th class="name"    >사원명  </th>
        
        
    </tr>
<%
for (MemberDTO dto : list) {
%>
    <tr>
        <td><%=dto.getId() %></td>
        <td><%=dto.getPw() %></td>
        <td><%=dto.getName	() %></td>
       
       
    </tr>
<%
}
%>
    
</table>
<br>
<input type="button" value="전 화면으로 돌아가기" onclick="location.href='login_main.jsp'">

</body>
</html>