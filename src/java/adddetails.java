
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;



public class adddetails extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    response.setContentType("text/html");  
    PrintWriter out=response.getWriter();

        try{
        
       
           int id = Integer.parseInt( request.getParameter("id"));
           String product_name[] =request.getParameterValues("prod_name");
            String price[] =request.getParameterValues("prod_price"); 
           String quantity[] = request.getParameterValues("prod_quantity"); 
           String payment_status[] =request.getParameterValues("payment");


           
           java.util.Date date=new java.util.Date();
Timestamp Time=new java.sql.Timestamp(date.getTime());       
           
      
                  
    String a="INSERT INTO customers_details(product_name,product_price,prod_quantity,customer_id,payment_status,total,date)"
        + " VALUES(?,?,?,?,?,?,?)";
    PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
    
    
    for(int i=0;i<product_name.length;i++){  
             pst.setString(1, product_name[i]);   
             pst.setLong(2, Long.parseLong(price[i]));
             pst.setLong(3, Long.parseLong(quantity[i]));
             pst.setInt(4, id);
             pst.setString(5, payment_status[i]);  
            pst.setLong(6,(Long.parseLong(price[i])*Long.parseLong(quantity[i])) ); 
            pst.setTimestamp(7, Time);
            
             pst.executeUpdate();





    }        
    
           HttpSession session=request.getSession();
       session.setAttribute("prod", "PRODUCT SUCCESSFULLY ADDED");

    
       response.sendRedirect("details.jsp");

             
       
           
           
           
        }catch(Exception e){
                response.getWriter().println(e); 

                             }
        
 



     
    }}