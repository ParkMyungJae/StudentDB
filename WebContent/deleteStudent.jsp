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
	String password = "";
	StudentDAO instance = StudentDAO.getInstance();
	Connection conn = instance.getConnection();
	String sql = "select * from STUDENT_TBL where stuNo=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, stuNo);
	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		password = rs.getString("password");
	} else {
	%>
	<script>
		alert("올바르지 않은 경로로 접근하였습니다.");
		history.back();
	</script>
	<%
		}
	%>

	<form action="deleteStudentPro.jsp" method="POST">
		비밀번호를 입력하세요 <input type="password" name="inputPW"> <input
			type="hidden" name="password" value="<%=password%>"> <input
			type="hidden" name="stuNo" value="<%=stuNo%>"> <input
			type="submit" value="확인">
	</form>
</body>
</html>