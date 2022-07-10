

import java.io.IOException;

import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class admin_update extends HttpServlet {

  



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          HttpSession session=request.getSession();
      
        String name=request.getParameter("name");
         String email=request.getParameter("email");
        String password=request.getParameter("password");
        String web_id=request.getParameter("web_id");
        String shop_type=request.getParameter("shop_type");
        String phone=request.getParameter("phone");
        String office_name=request.getParameter("office_name");
        String address=request.getParameter("address");
        
        
     
        
   try{              

                         

String a="update admin_details set name=?,email=? ,admin_password=?,web_id=?,shop_type=?,phoneno=?,shop_name=?,address=? ";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
pst.setString(1, name);
pst.setString(2, email);
pst.setString(3, password);
pst.setString(4, web_id);
pst.setString(5, shop_type);
pst.setString(6, phone);
pst.setString(7, office_name);
pst.setString(8, address);


 pst.executeUpdate();
    session.setAttribute("warning", "ADMIN DATA hAS BEEN UPDATED!! ");

 response.sendRedirect("login.jsp");
 

 }
catch(Exception e){
       response.getWriter().println(e);
    }

 
     
        
        
        
        
        
        
        
       
    }

  
}
