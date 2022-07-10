
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//used to remove product 

public class remove_product extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
          try{    
     
              HttpSession session=request.getSession();
           String a="delete from customers_details where id=? and customer_id=?";  
            PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
                         pst.setInt(1,(int)Integer.parseInt(request.getParameter("prod_id")));

            pst.setInt(2,(int)session.getAttribute("id"));

             pst.executeUpdate();
                                         session.setAttribute("prod", "PRODUCT SUCEESSFULLY REMOVED!!");

              response.sendRedirect("details.jsp");

          
          }catch(Exception e){
        
    out.println(e);
}
    }
    


 

}
