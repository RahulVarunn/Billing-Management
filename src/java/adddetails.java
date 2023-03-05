
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
           String product_name =request.getParameter("prod_name");
            String price =request.getParameter("prod_price"); 
           String quantity = request.getParameter("prod_quantity"); 
           String payment_status =request.getParameter("payment");


           
           java.util.Date date=new java.util.Date();
Timestamp Time=new java.sql.Timestamp(date.getTime());       
           
//    product_name	product_price	product_mrp	
  
                  
    String b="INSERT INTO customers_details(product_name,product_price,prod_quantity,customer_id,payment_status,total,date)"
        + " VALUES(?,?,?,?,?,?,?)";
    PreparedStatement  pst=database.connection.getConnection().prepareStatement(b);
    
    
             pst.setString(1, product_name);   
             pst.setLong(2, Long.parseLong(price));
             pst.setLong(3, Long.parseLong(quantity));
             pst.setInt(4, id);
             pst.setString(5, payment_status);  
            pst.setLong(6,(Long.parseLong(price)*Long.parseLong(quantity)) ); 
            pst.setTimestamp(7, Time);
            
             pst.executeUpdate();





       
    
    
        String a="INSERT INTO products(product_name,product_price,product_mrp)"
        + " VALUES(?,?,?)";
    PreparedStatement  prod=database.connection.getConnection().prepareStatement(a);
            prod.setString(1, product_name);   
             prod.setLong(2, Integer.parseInt(price));
             prod.setInt(3, 0);
             prod.executeUpdate();

    
    
           HttpSession session=request.getSession();
       session.setAttribute("prod", "PRODUCT SUCCESSFULLY ADDED");

    
       response.sendRedirect("details.jsp");

             
       
           
           
           
        }catch(Exception e){
                response.getWriter().println(e); 

                             }
        
 



     
    }}