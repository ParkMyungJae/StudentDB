package student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDAO {
	//DAO : 기능 구현하는 클래스
	
	private static StudentDAO instance = new StudentDAO();
	
	private StudentDAO() {}
	
	//studentVO == 데이터베이스에서 데이터를 가지고 오는 객체를 만들어주는 클래스
	//studentVO ==> 어떤 데이타 -> 테이블에서 한줄 == row == 행 == fpzhem
	//Arraylist<StudentVO> list ==> 여러 row 이루어진 결국 => 데이터베이스에 테이블로 구성되어진다.
	ArrayList<StudentVO> studentlist = new ArrayList<StudentVO>();
	
	public static StudentDAO getInstance() {
		return instance;
	}
	
	//DB
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//driver
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
		} catch (Exception e) {
			System.out.println("DB오류");
			e.printStackTrace();
		}finally {
			
		}
		
		return conn;
	}
	
	public ArrayList<StudentVO> getStudentList() {
		ArrayList<StudentVO> studentlist = new ArrayList<StudentVO>();
		
		try {
			conn = instance.getConnection();
			String sql = "SELECT * FROM STUDENT_TBL";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StudentVO student = new StudentVO();
				student.setStuNo(rs.getInt(1));
				student.setPassword(rs.getString(2));
				student.setStuName(rs.getString(3));
				student.setGrade(rs.getInt(4));
				student.setKor(rs.getInt(5));
				student.setMath(rs.getInt(6));
				student.setEng(rs.getInt(7));
				studentlist.add(student);
				student.toString();
			}
			System.out.println("학생 출력 완료");
			
		} catch (Exception e) {
			// try 안에 있는 코드와 오류를 잡아서
			System.out.println("getStudentList() 오류");
			e.printStackTrace();
			
		}finally {
			try {if(conn != null) {conn.close();} if(pstmt != null) {pstmt.close();} if(rs != null) {rs.close();}}
			catch (SQLException sqle) {sqle.printStackTrace();}
		}
		
		return studentlist;
	}
	
	//insertStudent : 외부 : form input 받아온 것을 오라클에 넣어주면 기능만 하면 된다.
	//리턴이 구지 필요하지 않지만 boolean 리턴을 해준다 --> insert 테이블에 성공적으로 삽입 : true
	
	public boolean insertStudent(StudentVO vo) {
		try {
			conn = instance.getConnection();
			String sql = "INSERT INTO STUDENT_TBL VALUES(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			// number setInt varchar2 => setString
			// insertStudent.jsp -> form input 정보 ->
			// insertStudentPro.jsp -> form input 정보 ->
			// studentDAO insertStudent 메서드의 외부인자 : studentVO 객체 받아오고
			// prepareStatment ? set 해서 값 넣을때 -> studentVO 객체에서 get 통해서 받아온다.
			pstmt.setInt(1, vo.getStuNo());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getStuName());
			pstmt.setInt(4, vo.getGrade());
			pstmt.setInt(5, vo.getKor());
			pstmt.setInt(6, vo.getMath());
			pstmt.setInt(7, vo.getEng());

			pstmt.executeUpdate();
			
			System.out.println("학생한명 추가 완료");
			return true;
		} catch (Exception e) {
			System.out.println("insertStudent() 오류");
			e.printStackTrace();
		}finally {
			try {if(conn != null) {conn.close();} if(pstmt != null) {pstmt.close();}}
			catch (SQLException sqle) {sqle.printStackTrace();}
		}
		
		return false;
	}
	
	//학생 한명 정보 출력
	public StudentVO getStudent(int stuNo) {
		StudentVO student = new StudentVO();
		
		try {
			conn = instance.getConnection();
			String sql = "SELECT * FROM STUDENT_TBL WHERE stuNo = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, stuNo);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				student.setStuNo(rs.getInt(1));
				student.setPassword(rs.getString(2));
				student.setStuName(rs.getString(3));
				student.setGrade(rs.getInt(4));
				student.setKor(rs.getInt(5));
				student.setMath(rs.getInt(6));
				student.setEng(rs.getInt(7));
				student.toString();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		return student;
	}
}
