<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uname = request.getParameter("name");
	
/* 	String sql = "INSERT INTO user(id,password,name) VALUES";
	sql += "('" + uid + "', '" + upass + "','" + uname + "')"; */
	
	String sql = "INSERT INTO user(id,password,name) VALUES(?,?,?)";
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/mysns","root","0000");
	
	
	/* Statement stmt = conn.createStatement(); 
		int count = stmt.executeUpdate(sql);*/
		
	PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, uid);
		stmt.setString(2, upass);
		stmt.setString(3, uname);
	int count = stmt.executeUpdate();


	if (count == 1) {
		out.print("회원 가입 완료");
	} else {
		out.print("오류 발생");
	}
	stmt.close(); conn.close();
	
%>