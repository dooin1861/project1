<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>

<form action="member_join.jsp" method="get">
    <table>
        <tr>
            <td>사원 ID</td>
            <td><input type="text" name="id"></td>
        </tr>
        <tr>
            <td>비밀번호(사원번호)</td>
            <td><input type="password" name="pw"></td>
        </tr>
        <tr>
            <td>사원명</td>
            <td><input type="text" name="name"></td>
        </tr>
    </table>    
    <input type="submit" value="등록"> 
</form>

</body>
</html>
