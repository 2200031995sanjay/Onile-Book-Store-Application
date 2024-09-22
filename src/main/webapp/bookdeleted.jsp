
 
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<!-- Website - www.codingnepalweb.com -->
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <title> BookStore</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   </head>
<body>
  <nav>
    <div class="menu">
      <input type="checkbox" id="check">
      <div class="logo"><a href="index.html">Openpages</a></div>
        <ul>
          <label class="btn cancel" for="check"><i class="fas fa-times"></i></label>
          <li><a href="registeredadminhomepage.html">Home</a></li>
          <li ><a  href="adminlogout.jsp">Logout</a></li>
          
        </ul>
        <label for="check" class="btn bars"><i class="fas fa-bars"></i></label>
      </div>
    </div>
  </nav>
  <div align="center">
  <% 
  
  int bid = Integer.parseInt(request.getParameter("id"));
try
{
	Connection con = null;
	System.out.println("Driver class loaded");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
	System.out.println("connection Established");
	
	PreparedStatement pstmt = con.prepareStatement("delete from books where id = ?");
	pstmt.setInt(1,bid);
	int n  = pstmt.executeUpdate();
	if(n > 0)
	{
		response.sendRedirect("deletionsuccess.html");
	}
	else
	{
		response.sendRedirect("deletionfailure.html");
	}
	
	
	
}
catch(Exception e)
{
	out.println(e);
	
}
%>
</div>
</body>
</html>
