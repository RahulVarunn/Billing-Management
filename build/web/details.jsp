

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>home</title>
    
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/daisyui@2.22.0/dist/full.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous"> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>
    </head>
    
    
    
    <body style="background-color: #1D1D20;"  >
    
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
   
        
        
        

       

<br><center> <h4 class="mt-4 mb-4">CUSTOMER (Details & Receipt)</h4> </center><br>


      

        





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
        
String a="update Customer set total_amt=? ,total_paid=?,total_pending=? where id=?";

    PreparedStatement pst_insert=database.connection.getConnection().prepareStatement(a);
    pst_insert.setInt(1,(int)total);
    pst_insert.setInt(2,(int)paid);
    pst_insert.setInt(3,(int)pending);
    
    pst_insert.setInt(4, (int)session.getAttribute("id"));	
    pst_insert.executeUpdate();
    
  %>     
     
  


   
  <div class="flex" >
    
    <div class="grow mr-10  ml-4  "  style="background-color:#202023 ; ">
      <div class=" grid-rows-6 " >



        <%
    
        //GETING ADMIN DATA....NAME...SHOP NAME...ETC.
        
     a="select * from admin_details ";
    PreparedStatement  admin=database.connection.getConnection().prepareStatement(a);
    ResultSet admin_x=admin.executeQuery();
    if(admin_x.next()){%>
           
    



    <div  name="btn" class="shadow-xl  flex flex-col  bg-white rounded  shadow-md md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-700" style="background-color: #2E2E33;">
 
      <div class="flex flex-col justify-between p-4 leading-normal">
          <h5 class="mb-2 text-left  font-bold tracking-tight text-gray-900 dark:text-white" ><%= admin_x.getString("name").toUpperCase()%></h5>
          <p class="mb-3 text-left font-normal text-gray-700 dark:text-gray-400" style="font-size: 12px;"><%= admin_x.getString("address").toUpperCase()%> </p>
          <p class="mb-3 text-left font-normal text-gray-700 dark:text-gray-400" style="font-size: 12px;"><%=admin_x.getString("email")%>&nbsp;&nbsp; </p>
    
          
      </div><br>
    </div>  
     
    <%}%>    



        
    <%     
    
    //TAKING ALL THE CUSTOMER DATA
   
 a="select * from customer where id=? and name=?";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
pst.setInt(1,(int)session.getAttribute("id"));
pst.setString(2,(String) session.getAttribute("customer"));
ResultSet x=pst.executeQuery();
if(x.next()){
int id=x.getInt("id");%>
    


    
                
        


          <div  name="btn" class="shadow-xl  flex flex-col  bg-white rounded  shadow-md md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-700" style="background-color: #2E2E33;">
            <input type="hidden" name="id" value="<%=x.getInt("id")%>" >
            <input type="hidden" name="customer" value="<%=x.getString("name")%>" >
            <div class="flex flex-col justify-between p-4 leading-normal">
                <h5 class="mb-2 text-left  font-bold tracking-tight text-gray-900 dark:text-white" ><%= x.getString("name").toUpperCase()%></h5>
                <p class="mb-3 text-left font-normal text-gray-700 dark:text-gray-400" style="font-size: 12px;"><%= x.getString("address").toUpperCase()%></p>
                <p class="mb-3 text-left font-normal text-gray-700 dark:text-gray-400" style="font-size: 12px;"><%=x.getLong("phone")%></p>

                
          
            </div><br>
          </div>

          <%}%>  
     
        <div id="myPlot" class="mt-4" style="width:100%;max-width:97%"></div>





        <div class="inset-x-0 bottom-0" style="background-color:#202023 ; ">


    
 
 
        
          <div  class="shadow-xl  flex flex-col  bg-white rounded  shadow-md md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-700" style="background-color: #2E2E33;">
 
            <div class="flex  flex-col justify-between p-4 leading-normal">
                <h5 class="mb-2 text-left   tracking-tight text-gray-900 dark:text-white" >Due Amount : <%=pending%></p>
                <h5 class="mb-2 text-left   tracking-tight text-gray-900 dark:text-white" >Paid Amount : <%=paid%></h5>
                <h5 class="mb-2 text-left  font-bold tracking-tight text-gray-900 dark:text-white" >Total Amount : <%= total%></h5>
        
                
            </div><br>
          </div>  
                
                
                
                
                
                
                
            <div  class="shadow-xl  flex flex-col  bg-white rounded  shadow-md md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-700" style="background-color: #2E2E33;">
 
                <div class="flex  flex-col justify-between  p-4 leading-normal"style="width:100%;">
          <!-- The button to open modal -->
          <label for="my-modal-4" style="background-color: #1D1D20" class="w-full btn modal-button" >Open Scanner</label>

<!-- Put this part before </body> tag -->
<input type="checkbox" id="my-modal-4" class="modal-toggle " style="background-color: #1D1D20"  />
<label for="my-modal-4" class="modal  cursor-pointer "  >
  <label class="modal-box w-auto relative pl-15 mb-3 pb-3 pr-15" for=""  style="background-color: #1D1D20" >
      <center>
          <h3 class="text-lg font-bold">Scan Here To Pay Your Bill</h3>
    <img src="image/scanner.png" height="250" width="250"></center>
  </label>
</label>
            </div>
                
                
                
                <br>
          </div>            
                
                
                
                
                
                
        
        </div>

        




      </div>
    </div>



    <div class="grow-0 mr-4 "  >




      <form action="adddetails" method="post" >
 
        
    
        
        
        <!--   TEXT BOXES AND BUTTON FOR ADDING PRODUCT     -->
        
        <div id="xyz">  
            
         <div class="input-group mb-3 " >


          <div>
            <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Product Name</label>
            <input type="text" name="prod_name"  placeholder="Product" class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33;">
        </div>
        <div>
          <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Product Price</label>
          <input type="number" name="prod_price" placeholder="Price" class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33;">
      </div>

      <div>
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Product Quantity</label>
        <input type="number" name="prod_quantity"  placeholder="Quantity" class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33;">
    </div>


    <div>
      <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Payment Status</label>

      <select id="inputGroupSelect01" name="payment" required class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33;">
        <option value="">Payment Status</option>
        <option value="Paid">Paid</option>
        <option value="Pending">Pending</option>
      </select>
        </div>


        <input type="hidden"  name="id"  value="<%=(int)session.getAttribute("id")%>"> 

  <div>
    <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">ADD </label>
    <button class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" type="submit"  >SUBMIT</button>
  </div>
          


        
         </div>   
            
        </div>  
        
        
        
                      
                      
        <!--     USING JAVASCRIPT TO CREATING DYNAMIC TEXT BOXES       -->
              
        <!-- <script type="text/javascript">
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
            return 
            
            
            
            
            
            ' <div class="input-group mb-3" >'+
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
        </script> -->
        
        
            </form>




  
  

    
    



<!--TABLE -->
        
 <%  
     
                      
 a="select * from customers_details where customer_id=?";
PreparedStatement  pst1=database.connection.getConnection().prepareStatement(a);
pst1.setInt(1,(int)session.getAttribute("id"));

ResultSet x1=pst1.executeQuery();%>


    <!-- <div role="status" class="p-4 space-y-4 max-w-md rounded border border-gray-200 divide-y divide-gray-200 shadow animate-pulse dark:divide-gray-700 md:p-6 dark:border-gray-700"> -->

      <div class="p-4   bg-white rounded-lg border shadow-md sm:p-8 dark:bg-gray-800 dark:border-gray-700" style="background-color: #2E2E33;">
        <div class="flex justify-between items-center mb-4">
            <h5 class="text-xl font-bold leading-none text-gray-900 dark:text-white">DETAILS</h5>
            <a href="#" class="text-sm font-medium text-blue-600 hover:underline dark:text-blue-500">
                View all
            </a>
       </div>
       <div class="flow-root">
            <ul role="list" class="divide-y divide-gray-200 dark:divide-gray-700">
<%while(x1.next()){%>   
        











 
              <li class="py-3 sm:py-4">
                  <div class="flex items-center space-x-4">
                 
                      <div class="flex-1 min-w-0">
                          <p class="text-sm font-medium text-gray-900 truncate dark:text-white" >
                            <%=x1.getString("product_name")%>
                          </p>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 12px;">
                             Quantity: <%=x1.getString("prod_quantity")%> Payment status: <%=x1.getString("payment_status")%>
                          </p>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 12px;">
                            Payment status: <%=x1.getString("payment_status")%> 
                         </p>
                         <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 12px;">
                          <%=x1.getTimestamp("date")%>
                       </p>

                      </div>
                      <div class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white">

                        <div>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 13px; ">
                           Product price: <%=x1.getString("product_price")%>
                          </p>
                         <p class="text-sm  truncate dark:text-gray-400" style="font-size: 13px; color: white;">
                          Total Price: <%=x1.getString("total")%>

                        </p>

                        </div>
                        


                        
                        <form  action="remove_product" method="post">
                          <input type="hidden" value="<%=x1.getInt("id")%>" name="prod_id"">
                          <button class="ml-5 btn btn-circle " type="submit" onclick="alert('do you want to delete!')">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
                          </button>
                          </form>  
                      </div>
                  </div>
              </li>
             

  






 
  <!-- <tr>
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

  </tr> -->
  
      
<% } 
%>  
</ul>
</div>
</div>

        
     
</div>
    

    
    
    
          
          
          
           
    
                          
                                
    
</div>
  
        
        









    
<nav class=" fixed top-0 left-0 right-0 inset-x-0 top-0  z-40" style="background-color: #1D1D20;">
  <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
    <div class="relative flex items-center justify-between h-16">
      <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
        <!-- Mobile menu button-->
        <button type="button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
          <span class="sr-only">Open main menu</span>
    
          <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
 
          <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
      <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
        <div class="flex-shrink-0 flex items-center"><h1 style="font-weight: bold;">ADMIN</h1>

        </div>
        <div class="hidden sm:block sm:ml-6">
          <div class="flex space-x-4">
            <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            <h1  class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white  rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none  dark:hover:bg-blue-700 " style="color: white;">
              Details
           
            </h1>




            <a href="home.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Home</a>
            

          </div>
        </div>
      </div>
      <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">

        <!-- Profile dropdown -->
        <div class="ml-3 relative">
          <div>
            <button class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium" id="download"> download Pdf</button> 

        
          </div>

<!--           
            Dropdown menu, show/hide based on menu state.

            Entering: "transition ease-out duration-100"
              From: "transform opacity-0 scale-95"
              To: "transform opacity-100 scale-100"
            Leaving: "transition ease-in duration-75"
              From: "transform opacity-100 scale-100"
              To: "transform opacity-0 scale-95"
          -->

        </div>
      </div>
    </div>
  </div>

  <!-- Mobile menu, show/hide based on menu state. -->
  <div class="sm:hidden" id="mobile-menu">
    <div class="px-2 pt-2 pb-3 space-y-1">
      <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
      <a href="#" class="bg-gray-900 text-white block px-3 py-2 rounded-md text-base font-medium" aria-current="page">Dashboard</a>

      <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Team</a>

      <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Projects</a>

      <a href="#" class="text-gray-300 hover:bg-gray-700 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Calendar</a>
    </div>
  </div>
</nav>
        
   
        
        
    <br>

            

<!--GRAPH( USING PIE GRAPH TO CHECKING PENDING AND PAID AMOUNT-->
 
    
 


<script>
var xArray = ["PENDING", "PAID"];
var yArray = [<%=pending%>,<%=paid%>];
var layout = {title:"CUSTOMER PAID & PENDING STATISTIC", paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
var data = [{labels:xArray, values:yArray, type:"pie",}];

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
           
    
                margin: 0,
                filename: name,
                image: { type: 'pdf' , quality:0.98},
                     html2canvas:  { dpi: 100, letterRendering: true },

                jsPDF: { unit: 'in', format: 'letter', orientation: 'landscape' }
            };
            html2pdf().from(print).set(opt).save();
        })
}
</script>








      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      
    </body>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</html>
