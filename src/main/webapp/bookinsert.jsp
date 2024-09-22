<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%
    int bid = (int) ((Math.random() * 9999) + 1);
    String bname = request.getParameter("name");
    String bauth = request.getParameter("auth");
    int baqua = Integer.parseInt(request.getParameter("quan"));

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
        String sql = "INSERT INTO books (id, name, author, quantity) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bid);
        pstmt.setString(2, bname);
        pstmt.setString(3, bauth);
        pstmt.setInt(4, baqua);
        int n = pstmt.executeUpdate();
        if(n > 0)
    	{
    		response.sendRedirect("booksuccess.html");
    	}
    	else
    	{
    		response.sendRedirect("bookfail.html");
    	}
        conn.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
