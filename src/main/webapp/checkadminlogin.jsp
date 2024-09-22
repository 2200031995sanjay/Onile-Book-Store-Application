<%@page import="com.mysql.cj.Session"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.lang.*"%>
<%

String email = request.getParameter("email");
String pwd = request.getParameter("pwd");


try 
{
	Connection con = null;
	System.out.println("Driver class loaded");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore ", "root", "root");
	System.out.println("connection Established");
	
	String qry = "select * from admin where email = ? and password = ?";
	PreparedStatement pstmt  = con.prepareStatement(qry);
	pstmt.setString(1, email);
	pstmt.setString(2, pwd);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next())
	{
				
		session.setMaxInactiveInterval(600);
		response.sendRedirect("registeredadminhomepage.html");
	}
	else
	{
		
		response.sendRedirect("adminloginfail.html");
		
	}
	
}
catch(Exception e){
	
}
%>