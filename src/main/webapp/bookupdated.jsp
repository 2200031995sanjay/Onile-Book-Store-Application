<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<!DOCTYPE html>
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
          <li><a href="bookinsertion.html">Insert</a></li>
          <li ><a  href="adminlogout.jsp">Logout</a></li>
        </ul>
        <label for="check" class="btn bars"><i class="fas fa-bars"></i></label>
      </div>
    </div>
  </nav>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
   <div align="center">
    <form method="post" action="bookupdated.jsp">
      <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
      <table align="center">
        <tr>
          <td><b>Enter Quantity</b></td>
          <td>
            <input type="text" name="quan" required>
          </td>
        </tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr align="center">
          <td>
            <input type="submit" value="Update" required>
          </td>
          <td>
            <input type="reset" value="Clear" required>
          </td>
        </tr>
      </table>
    </form>
  </div>    
</body>
</html>

<%
    String quanParam = request.getParameter("quan");
    String idParam = request.getParameter("id");

    if (quanParam != null && idParam != null) {
        try {
            int quan = Integer.parseInt(quanParam);
            int bid = Integer.parseInt(idParam);

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
            String sql = "update books set quantity=? where id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, quan);
            pstmt.setInt(2, bid);

            int n = pstmt.executeUpdate();
            if (n > 0) {
                response.sendRedirect("bookUpdatingsuccess.html");
            } else {
                response.sendRedirect("bookUpdatingfail.html");
            }
            conn.close();
        } catch (Exception e) {
            out.println(e);
        }
    } else {
    	%>
    	<br>
    	<br>
    	<br>
    	<center><h3>Please Enter valid input</h3></center>
    	<%
        
    }
%>
