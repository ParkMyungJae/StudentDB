<%@page import="student.StudentVO"%>
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
String password = request.getParameter("password");
String name = request.getParameter("name");
int grade = Integer.parseInt(request.getParameter("grade"));
int kor = Integer.parseInt(request.getParameter("kor"));
int math = Integer.parseInt(request.getParameter("math"));
int eng = Integer.parseInt(request.getParameter("eng"));

StudentVO student = new StudentVO();
student.setStuNo(stuNo);
student.setPassword(password);
student.setStuName(name);
student.setGrade(grade);
student.setKor(kor);
student.setMath(math);
student.setEng(eng);

StudentDAO instance = StudentDAO.getInstance();

boolean check = instance.insertStudent(student);

if(check) {
	%>
	<script type="text/javascript">
		alert("학생추가 성공");
		location.href = "selectStudent.jsp";
	</script>
	<%
}else {
	%>
	<script type="text/javascript">
		alert("학생추가 실패");
		location.href = "selectStudent.jsp";
	</script>
	<%
}
%>
<jsp:forward page="selectStudent.jsp" />
</body>
</html>