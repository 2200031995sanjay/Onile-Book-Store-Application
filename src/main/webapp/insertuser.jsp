<%@page import="java.sql.*"%>
<% 
String uname = request.getParameter("name");
int   ucont = Integer.parseInt(request.getParameter("con"));
int   uage = Integer.parseInt(request.getParameter("age"));
String uemail = request.getParameter("email");
String upwd = request.getParameter("pwd");

try
{
	Connection con = null;
	System.out.println("Driver class loaded");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
	System.out.println("connection Established");
	
	PreparedStatement pstmt = con.prepareStatement("insert into user values(?,?,?,?,?)");
	pstmt.setString(1, uname);
	pstmt.setInt(2, ucont);
	pstmt.setInt(3, uage);
	pstmt.setString(4, uemail);
	pstmt.setString(5, upwd);
	int n = pstmt.executeUpdate();
	if(n > 0)
	{
		response.sendRedirect("registereduserhomepage.html");
	}
	else
	{
		response.sendRedirect("userregistartionfail.html");
	}
	
}
catch(Exception e)
{
	out.println(e);
}

%>
