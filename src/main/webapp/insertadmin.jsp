<%@page import="java.sql.*"%>
<% 
String aname = request.getParameter("name");
String aemail = request.getParameter("email");
String apwd = request.getParameter("pwd");

try
{
	Connection con = null;
	System.out.println("Driver class loaded");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
	System.out.println("connection Established");
	
	PreparedStatement pstmt = con.prepareStatement("insert into admin values(?,?,?)");
	pstmt.setString(1, aname);
	pstmt.setString(2, aemail);
	pstmt.setString(3, apwd);
	int n = pstmt.executeUpdate();
	if(n > 0)
	{
		response.sendRedirect("registeredadminhomepage.html");
	}
	else
	{
		response.sendRedirect("adminregistartionfail.html");
	}
	
}
catch(Exception e)
{
	out.println(e);
}

%>
