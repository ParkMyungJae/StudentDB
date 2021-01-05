<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="student.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
int stuNo = Integer.parseInt(request.getParameter("stuNo"));
int check = -1;

int grade;

StudentDAO instance = StudentDAO.getInstance();
Connection conn = instance.getConnection(); //오라클 DB 연동
String sql = "SELECT * FROM STUDENT_TBL WHERE stuNo = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setInt(1, stuNo);
ResultSet rs = pstmt.executeQuery();

if(rs.next()) {
	check = 1;
}

if(check == 1) {
%>
	<form action="updateStudentPro.jsp" method="POST">
		학번 : <%=stuNo %><br><br>
		<br> 비밀번호 : <input type="text" name="password" value="<%=rs.getString("password") %>"><br><br>
		<br> 이름 : <input type="text" name="name" value="<%=rs.getString("stuName") %>"><br><br>
		<br> 학년 : <input type="text" name="grade" value="<%=rs.getInt("grade") %>"><br><br>
		<br> 국어점수 : <input type="text" name="kor" value="<%=rs.getInt("kor") %>"><br><br>
		<br> 수학점수 : <input type="text" name="math" value="<%=rs.getInt("math") %>"><br><br>
		<br> 영어점수 : <input type="text" name="eng" value="<%=rs.getInt("eng") %>"><br><br>
		<input type="hidden" value="<%=stuNo%>" name="stuNo">
		<br> <input type="submit" value="수정하기">
	</form>
<%
}

%>
</body>
</html>