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
try
{
	Connection con = null;
	System.out.println("Driver class loaded");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
	System.out.println("connection Established");
	
	PreparedStatement pstmt = con.prepareStatement("select * from books");
	ResultSet rs = pstmt.executeQuery();
	%>
	<h3 align = "center"> Available Books Information</h3><br>
	<table align="center" border=1>
	<tr bgcolor = "white">
	<td>ID</td>
	<td>Book Name</td>
	<td>Author</td>
	<td>Available Quantity</td>
    </tr>
    <%
    while(rs.next())
    {
    	%>
    	 <tr>
      <td><%=rs.getInt(1)%></td>
      <td><%=rs.getString(2)%></td>
      <td><%=rs.getString(3)%></td>
      <td><%=rs.getInt(4)%></td>
      
      </tr>
    	
    	
    	<% 
    	
    }
    
    %>
    </table>

	
	<%
	
}
catch(Exception e)
{
	out.println(e);
	
}
%>
</div>
</body>
</html>