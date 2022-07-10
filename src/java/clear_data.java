
// used to clear...customer details
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;



public class clear_data extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession session=request.getSession();
 try{              

                         
String a="TRUNCATE TABLE customer";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
pst.executeUpdate();

 a="TRUNCATE TABLE customers_details";
PreparedStatement  pst_=database.connection.getConnection().prepareStatement(a);
int x=pst_.executeUpdate();

if(x<0){
      session.setAttribute("warning", "DATA HAS BEEN SUCCESSFULLY DELETED!! ");
 
}


response.sendRedirect("login.jsp");
 }
catch(Exception e){
       response.getWriter().println(e);
    }

 

}
}