<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	<form action="insertStudentPro.jsp">
		학번 : <input type="text" name="stuNo" required><br>
		<br> 비밀번호 : <input type="text" name="password" required><br>
		<br> 이름 : <input type="text" name="name" required><br>
		<br> 학년 : <input type="text" name="grade" required><br>
		<br> 국어점수 : <input type="text" name="kor" required><br>
		<br> 수학점수 : <input type="text" name="math" required><br>
		<br> 영어점수 : <input type="text" name="eng" required><br>
		<br> <input type="submit" value="추가하기">
	</form>
<%@ include file="footer.jsp" %>