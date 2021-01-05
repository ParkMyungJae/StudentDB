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
	String inputPW = request.getParameter("inputPW");
	String password = request.getParameter("password");

	//1. DAO 객체 가져오기
	//2. getConnection 하기
	//3. sql -> 동적
	//4. preparestatment 객체 생성 -> set 셋팅
	//5. --select 인경우 - > resultset 객체 생성 - > executeQuery
	//5. --select문이 아닌경우 --> updateQuery

	StudentDAO instance = StudentDAO.getInstance();

	if (inputPW.equals(password)) {
		Connection conn = instance.getConnection();
		String sql = "delete from STUDENT_TBL WHERE stuNo = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, stuNo);
		pstmt.executeUpdate();
	%>
	<script>
		alert("회원삭제가 완료되었습니다.");
		location.href = "selectStudent.jsp";
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>