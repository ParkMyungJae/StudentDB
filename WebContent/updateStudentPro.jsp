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
String password = request.getParameter("password");
String name = request.getParameter("name");
int grade = Integer.parseInt(request.getParameter("grade"));
int kor = Integer.parseInt(request.getParameter("kor"));
int math = Integer.parseInt(request.getParameter("math"));
int eng = Integer.parseInt(request.getParameter("eng"));

StudentDAO instance = StudentDAO.getInstance();
Connection conn = instance.getConnection();
String sql = "UPDATE STUDENT_TBL SET stuName = ?, password = ?, grade = ?, kor = ?, math = ?, eng = ? WHERE stuNo = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);

pstmt.setString(1, name);
pstmt.setString(2, password);
pstmt.setInt(3, grade);
pstmt.setInt(4, kor);
pstmt.setInt(5, math);
pstmt.setInt(6, eng);
pstmt.setInt(7, stuNo);

pstmt.executeUpdate();
%>
<jsp:forward page="selectStudent.jsp" />
</body>
</html>