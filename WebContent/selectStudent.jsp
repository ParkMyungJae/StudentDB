<%@page import="student.StudentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="student.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%
//DAO
ArrayList<StudentVO> list = new ArrayList<>();
StudentDAO instance = StudentDAO.getInstance();
%>

<h1>학생등록</h1>

<table>
	<tr>
		<td>학번</td>
		<td>비번</td>
		<td>이름</td>
		<td>학년</td>
		<td>국어</td>
		<td>수학</td>
		<td>영어</td>
		<td>편집</td>
	</tr>
	
	<%
	for(StudentVO student : list) {
	%>
	
	<tr>
		<td><%=student.getStuNo() %></td>
		<td><%=student.getPassword() %></td>
		<td><%=student.getStuName() %></td>
		<td><%=student.getGrade() %></td>
		<td><%=student.getKor() %></td>
		<td><%=student.getMath() %></td>
		<td><%=student.getEng() %></td>
		<td>
			<a href="updateStudent.jsp?stuNo=<%=student.getStuNo()%>">수정</a> &nbsp;
			<a href="deleteStudent.jsp?stuNo=<%=student.getStuNo()%>">삭제</a>
		</td>
	</tr>
	<%
	}
	%>
</table>
<hr>

<form action="selectStudentPro.jsp" method="GET">
	학번 : <input type="text" name="stuNo">
	<input type="submit" value="검색">
</form>
<%@ include file="footer.jsp" %>