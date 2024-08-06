<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>

<%
    if ((String)session.getAttribute("userId") != null) {          
        // 로그인 상태일 때의 출력 
%>
        <form action="logout.jsp" method="post">  
            <%=(String)session.getAttribute("userName")%>님 로그인중 <br><br>
            <input type="submit" value="로그아웃"><br><br>
            <input type="button" value="회원정보 수정" 
                   onclick="window.open('member_update_form.jsp', 'popup', 
                                        'width=400, height=200')"> <br><br>
            <input type="button" value="사원 리스트" onclick="location.href='memberList.jsp'">
            <br><br>
            <input type="button" value="홈페이지로 돌아가기" onclick="location.href='index2.jsp'">
        </form>
<%  
    } else {                       
        // 로그인되지 않은 상태일 때의 출력
%>
        <form action="login.jsp" method="post"> 
            사원ID:   <input type="text"    name="id">&nbsp;&nbsp; <br>
            비밀번호: <input type="password" name="pw"> <br>
            <input type="submit" value="로그인">
          <!--  <input type="button" value="회원가입" 
                   onclick="window.open('member_join_form.jsp', 'popup', 
                                        'width=400, height=200')"> -->
            <input type="button" value="홈페이지로 돌아가기" onclick="location.href='index.jsp'">
        </form>
<%
    }
%>

</body>
</html>
