

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>home</title>
    
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
    </head>
    
    
    
    <body  >
    
        <div id="print">      
     
 
   <%if(session.getAttribute("prod")!=null){%>           
            
 <div  class=" fixed-top toast align-items-center mt-3 start-50 translate-middle-x" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="true">
<div class="d-flex">
      <div class="toast-body  ">
                           <%=session.getAttribute("prod")%>

          <%if(session.getAttribute("prod")!=null){%>
              <%session.removeAttribute("prod");%>
          <%}%>
      </div>
</div>
</div>    
 <%}%>     
      
 <!--SCRIPT FOR TOAST-->

<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>     
        
        
<%
      
//    GETING CUSTOMER ID AND NAME AND SAVING INTO SESSIONS
    
    if(request.getParameter("btn")!=null){
    session.setAttribute("id",Integer.parseInt(request.getParameter("id")));
    session.setAttribute("customer",request.getParameter("customer"));} 
    
  
%>

    
<% 
    //get total pending price of a aproduct        
    String mt="select sum(total) from customers_details where payment_status=? and customer_id=? ";
    PreparedStatement  pst_pending=database.connection.getConnection().prepareStatement(mt);
    pst_pending.setString(1, "pending");
    pst_pending.setInt(2,(int)session.getAttribute("id"));

    ResultSet total_pending=pst_pending.executeQuery(); 
    total_pending.next();
    int pending = (int)total_pending.getInt(1);  

       //get total paid price of a aproduct      
 
      
   mt="select sum(total) from customers_details where payment_status=? and customer_id=? ";
    PreparedStatement  pst_paid=database.connection.getConnection().prepareStatement(mt);
    pst_paid.setString(1, "paid");
    pst_paid.setInt(2,(int)session.getAttribute("id"));

    ResultSet total_paid=pst_paid.executeQuery(); 
    total_paid.next();
    int paid = total_paid.getInt(1);  
 %>  
    


       
    <div class="container-fluid  " style="background-color: #222; color: white">
   
        
        
        
<%
    
    //GETING ADMIN DATA....NAME...SHOP NAME...ETC.
    
String a="select * from admin_details ";
PreparedStatement  admin=database.connection.getConnection().prepareStatement(a);
ResultSet admin_x=admin.executeQuery();
if(admin_x.next()){%>
       

<div class="col-sm-6" style="font-size: 10px">
<br><br>
<h5 ><%= admin_x.getString("shop_type").toUpperCase()+" :"%></h5>                     

<h6 ><%= admin_x.getString("shop_name").toUpperCase()%></h6>                     
<h6 ><%= admin_x.getString("name").toUpperCase()%></h6>                     
<h6><%= admin_x.getString("address").toUpperCase()%></h6>
<h6>Phone: <%=admin_x.getLong("phoneno")%></h6>
<h6  >Email: <%=admin_x.getString("email")%></h6>
<br>
</div>
 
<%}%>    
</div>
       

<br><center> <h4 class="mt-4 mb-4">CUSTOMER (Details & Receipt)</h4> </center><br>


      
   <%     
    
       //TAKING ALL THE CUSTOMER DATA
      
  a="select * from customer where id=? and name=?";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
pst.setInt(1,(int)session.getAttribute("id"));
pst.setString(2,(String) session.getAttribute("customer"));
ResultSet x=pst.executeQuery();
if(x.next()){
int id=x.getInt("id");%>
       
<div class="mb-5 ms-3">
<h3 class="text-dark mb-1"><%= x.getString("name").toUpperCase()%></h3>                     
<div><%= x.getString("address").toUpperCase()%></div>
<div>Phone: <%=x.getLong("phone")%></div>
</div>

<%}%>      
        
    <form action="adddetails" method="post">
 
        
    
        
        
<!--   TEXT BOXES AND BUTTON FOR ADDING PRODUCT     -->

<div id="xyz">  
    
 <div class="input-group mb-3" >
     <input type="text" class="form-control" name="prod_name" placeholder="Product Name" aria-label="Example text with button addon" aria-describedby="button-addon1" required>   
  <input type="number" class="form-control" name="prod_price" placeholder="Product Price" aria-label="Example text with button addon" aria-describedby="button-addon1" required>
  <input type="number" class="form-control" name="prod_quantity" placeholder="Product Quantity" aria-label="Example text with button addon" aria-describedby="button-addon1" required>
  <input type="hidden"  name="id"  value="<%=(int)session.getAttribute("id")%>">
  
  <select class="form-select" id="inputGroupSelect01" name="payment" required>
    <option value="">Payment Status</option>
    <option value="Paid">Paid</option>
    <option value="Pending">Pending</option>
  </select>
  <button class="btn btn-outline-secondary" type="button" id="btnAdd">ADD</button>
   

 </div>   
    
</div>  

  <center>     <button class="btn btn-outline-dark mb-4" type="submit"  >SUBMIT</button></center>


              
              
<!--     USING JAVASCRIPT TO CREATING DYNAMIC TEXT BOXES       -->
      
<script type="text/javascript">
$(function () {
    $("#btnAdd").bind("click", function () {
        var div = $("<div />");
        div.html(GetDynamicTextBox(""));
        $("#xyz").append(div);
    });
    
    $("body").on("click", ".remove", function () {
        $(this).closest("div").remove();
    });
});
function GetDynamicTextBox() {
    return ' <div class="input-group mb-3" >'+
'<input type="text" class="form-control" name="prod_name" placeholder="Product Name" aria-label="Example text with button addon" aria-describedby="button-addon1" required>   &nbsp;'+
' <input type="text" class="form-control" name="prod_price" placeholder="Product Price" aria-label="Example text with button addon" aria-describedby="button-addon1" required>'+
 '  <input type="text" class="form-control" name="prod_quantity" placeholder="Product Price" aria-label="Example text with button addon" aria-describedby="button-addon1" required>'+
   '<select class="form-select" id="inputGroupSelect01" name="payment" required>'+
    '<option selected>Payment Status</option>'+
    '<option value="Paid">Paid</option>'+
    '<option value="Pending">Pending</option>'+
  '</select>'+        
                
    '<input type="button" value="Remove" class="remove btn btn-outline-danger" />'+
    
    
    
    '</div>'
    
    
}
</script>


    </form>




  <%
      
      
      // TAKING SUM OF PRODUCT AMOUNT 
      
    String amt="select sum(total) from customers_details where customer_id=?";
    PreparedStatement  pst_amt=database.connection.getConnection().prepareStatement(amt);
    pst_amt.setInt(1, (int)session.getAttribute("id"));			
    pst_amt.execute();
    ResultSet total_amount=pst_amt.executeQuery(); 
    total_amount.next();
        int total = total_amount.getInt(1);  

        
//      TAKING DATA FROM CUSTOMER_DETAILS AND ADDING TO CUSTOMER TABLE  FOR USING GRAPH 
        
a="update Customer set total_amt=? ,total_paid=?,total_pending=? where id=?";

    PreparedStatement pst_insert=database.connection.getConnection().prepareStatement(a);
    pst_insert.setInt(1,(int)total);
    pst_insert.setInt(2,(int)paid);
    pst_insert.setInt(3,(int)pending);
    
    pst_insert.setInt(4, (int)session.getAttribute("id"));	
    pst_insert.executeUpdate();
    
  %>     
        
   
<!--TABLE -->
        
 <%  
     
                      
 a="select * from customers_details where customer_id=?";
PreparedStatement  pst1=database.connection.getConnection().prepareStatement(a);
pst1.setInt(1,(int)session.getAttribute("id"));

ResultSet x1=pst1.executeQuery();%>

<div>
<table class="table table-borderless shadow  "  >
    <thead>    
    <tr> 
        <th scope="col"><br></th> 
    </tr>  
      
    <tr>
      <th scope="col">PRODUCT_NAME</th>
      <th scope="col">PRODUCT_PRICE</th>
      <th scope="col">PRODUCT_QUANTITY</th>
      <th scope="col">TOTAL PRICE</th>     
      <th scope="col">PAYMENT STATUS</th>
      <th scope="col">DATE & TIME</th>
      <th scope="col">ACTION</th>
    </tr>

    <th scope="col"><br></th>
    </thead>
    
    <tbody>

<%while(x1.next()){%>   
        

 
  <tr>
    <td><%=x1.getString("product_name")%></td>
    <td><%=x1.getString("product_price")%></td>
        <td><%=x1.getString("prod_quantity")%></td>

    <td><%=x1.getString("total")%></td>

    <td><%=x1.getString("payment_status")%></td>
    <td><%=x1.getTimestamp("date")%></td>
    

    <td>     
    <form  action="remove_product" method="post">
    <input type="hidden" value="<%=x1.getInt("id")%>" name="prod_id"">
    <input type="submit" class="btn  mt-3  btn-sm ps-4 pe-4 btn-danger" name="delete"value="remove" onclick="alert('do you want to delete!')">
    </form>  
    </td>

  </tr>
  
      
<% } 


%>  
    
<td class="bg-dark"></td>  
<td class="bg-dark text-light">Total: <%=total%></td>  
<td class="bg-dark text-light">Paid: <%=paid%> </td>  
<td class="bg-dark text-light"> Pending: <%=pending%></td>  
<td class="bg-dark"></td>  
<td class="bg-dark"></td>  
<td class="bg-dark"></td>  



    

         
    
   </tbody>
</table>  
   
</div>
        
          </div>
      
        
        
        <br><br><br><!-- comment -->
                                <form action="adddetails" method="post">

        
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel" style="background-color: #222; color: white;" >
  
            <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasExampleLabel">Add  Customer</h5>
          </div>
          <div class="offcanvas-body mt-5 ">
   
              
              
              
              
              
              
              
              
              
            
              </div>
      
              <div  style=" border-top: 5px solid  #1adad0;">
                <center>       
                <input type="hidden" name="id" value="<%=x.getInt("id")%>">  
  <button type="submit" class="mt-4 mb-4 btn   btn-light  btn-sm ps-4 pe-4 "  value="ADD">SUBMIT</button>
                  <button type="button" class="mt-4 mb-4 btn ms-3 btn-light  btn-sm ps-4 pe-4 " data-bs-dismiss="offcanvas" aria-label="Close">CLOSE</button>
        
                </center>  

              </div>

        </div>  </form>



  <div class="col-md-12 text-right mb-3">
            </div>
  
  

        <br>

    <div class="fixed-bottom shadow-lg "style="background-color:white; " >
    <h5 class="ps-4 pe-4 mt-3 float-start ">DETAILS</h5>
    <center> 
        <a class="btn  mt-3 btn-outline-dark btn-sm ps-4 pe-4 mb-3" value="submit" href="home.jsp" > BACK TO HOME!!</a>
        <button class="btn  mt-3 btn-outline-dark btn-sm ps-4 pe-4 mb-3" id="download"> DOWNLOAD PDF!!</button> 
    </center>
    </div>
        
   
        
        
    <br>

            

<!--GRAPH( USING PIE GRAPH TO CHECKING PENDING AND PAID AMOUNT-->
 
    
 

<div id="myPlot" style="width:100%;max-width:97%"></div>

<script>
var xArray = ["PENDING", "PAID"];
var yArray = [<%=pending%>,<%=paid%>];
var layout = {title:"CUSTOMER PAID & PENDING STATISTIC"};
var data = [{labels:xArray, values:yArray, type:"pie"}];

Plotly.newPlot("myPlot", data, layout);
</script>
    
    
    
<br><br><br>
    
<!--PRINT -->

<%
    
      java.util.Date date=new java.util.Date();
java.sql.Date Date_current=new java.sql.Date(date.getTime());  
    
    String name1=(String)session.getAttribute("customer")+" "+Date_current;



%>
<script>
    
    var name="<%=name1%>.pdf";
</script>   


<script>window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const print = this.document.getElementById("print");
            console.log(print);
            console.log(window);
            var opt = {
           
    
                margin: 0.4,
                filename: name,
                image: { type: 'jpeg' , quality:0.98},
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            html2pdf().from(print).set(opt).save();
        })
}
</script>








      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
    </body>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</html>
