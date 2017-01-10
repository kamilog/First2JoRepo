<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jdbc.util.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String email=null;
	String phone=null;
	String code="fail";
	try{
		con=JdbcUtil.getConn();
		String sql="select * from myusers where id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			email=rs.getString("email");
			phone=rs.getString("phone");
			code="success";
		}
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		JdbcUtil.close(rs, pstmt, con);
	}

	response.setContentType("text/json;charset=utf-8");
	PrintWriter pw=response.getWriter();
%>










