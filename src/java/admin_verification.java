// verify admin 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;



public class admin_verification extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                 
 try{              

                         
String a="select * from admin_details";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
ResultSet x=pst.executeQuery();
       HttpSession session=request.getSession();

if(x.next()){
    
    if( x.getString("admin_password").equals(request.getParameter("pass")) ){
       session.setAttribute("admin",x.getString("name") );
       session.removeAttribute("warning");
        response.sendRedirect("home.jsp");
        
        
    }else{
       session.setAttribute("warning", "INVALID PASSWORD!! TRY AGAIN");
        response.sendRedirect("login.jsp");

    }

    }else{
    
}
 }
catch(Exception e){
       response.getWriter().println(e);
    }

 

}
}