
<!--THIS JSP USED TO ADD CUSTOMER -->


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

      
    <%
     
       String name = request.getParameter("name");
  
       if(name!=null){
        String phone = request.getParameter("phone");
        String adr = request.getParameter("adr");
       
     java.util.Date date=new java.util.Date();
java.sql.Date Date_current=new java.sql.Date(date.getTime());
                  
String a="INSERT INTO customer(name,phone,address,date)"
        + " VALUES(?,?,?,?)";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
             pst.setString(1,name );   
             pst.setString(2, phone);
             pst.setString(3, adr); 
              pst.setDate(4, Date_current); 
            
             pst.executeUpdate();
            session.setAttribute("action", "CUSTOMER SUCESSFULLY ADDED");
            // ADDING ACTION SESSION TO PERFORM MODAL
             out.println("done! add another");
             session.setAttribute("action", "CUSTOMER SUCESSFULLY ADDED");
             response.sendRedirect("home.jsp");
    %>
             
                 
 
             
      <% }
       else{
                
                      session.setAttribute("action", "FAILED: CUSTOMER or PHONE.NO ALREADY ADDED!!");
                   response.sendRedirect("home.jsp");

           
       }
    %>    
        
    
    
    </body>
</html>
