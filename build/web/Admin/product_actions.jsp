<%@page import="java.sql.PreparedStatement"%>
<%

if ("POST".equalsIgnoreCase(request.getMethod())) {
String a="delete from products where product_id=?";

    PreparedStatement pst_insert=database.connection.getConnection().prepareStatement(a);
    pst_insert.setInt(1,Integer.parseInt(request.getParameter("id")));

    
    pst_insert.executeUpdate();
    response.sendRedirect("../Admin/products.jsp");
}
else{
    
}
    

%>