

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
<body style="background-color: #1D1D20;">


    <script> 
        var customer = [];
        var price = []; 
        var customer_paid = [];
        var customer_pending = [];
    
    </script> 
    
    
    <% 
  
    
    //get total pending price of a aproduct        
    String mt="select sum(total) from customers_details where payment_status=? ";
    PreparedStatement  pst_pending=database.connection.getConnection().prepareStatement(mt);
    pst_pending.setString(1, "pending");

    ResultSet total_pending=pst_pending.executeQuery(); 
    total_pending.next();
    int pending = (int)total_pending.getInt(1);  
 
      
   mt="select sum(total) from customers_details where payment_status=?  ";
    PreparedStatement  pst_paid=database.connection.getConnection().prepareStatement(mt);
    pst_paid.setString(1, "paid");

    ResultSet total_paid=pst_paid.executeQuery(); 
    total_paid.next();
    int paid = total_paid.getInt(1);  


    mt="select count(*) from customer ";
    PreparedStatement  pst_cus=database.connection.getConnection().prepareStatement(mt);
    ResultSet total_cus=pst_cus.executeQuery(); 
    total_cus.next();
    int ttl_cus = total_cus.getInt(1);  
 %> 


    
    <% 
    
    String a="select * from customer";
    PreparedStatement  pst1=database.connection.getConnection().prepareStatement(a);
    ResultSet customer=pst1.executeQuery();
    while(customer.next()){%>
    
       <script>customer.push("<%=customer.getString("name") %>"); </script>
       <script>price.push(<%=customer.getString("total_amt")%>); </script>
       <script>customer_paid.push(<%=customer.getString("total_paid")%>); </script>
       <script>customer_pending.push(<%=customer.getString("total_pending")%>); </script>
    
    <%}%>



<div class="container h-full">


<div class="flex items-stretch ">
<div class="py-4 fixed ">
<div class="grid grid-rows-6 grid-flow-col gap-4">
                   
<a href="home.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Back To Home</a>
<a href="#pie_total" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Customers</a>
<a href="info.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Sells </a>
<a href="info.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Products</a>
<a href="info.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Product</a>
<!-- <a href="info.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Information</a> -->

</div>

</div>

<div class="py-4  ">
    <div class="grid grid-rows-6 w-40 grid-flow-col gap-4">
                       

    
    </div>
    
    </div>

<div class="py-12">



      
      <div class="flex flex-row ">
        
        <div class="flex flex-col drop-shadow-xl justify-center rounded p-2 w-56 h-48   shadow-sm" style="background-color: #2E2E33;">
            <div>
          <center>
              <h6 class="mb-4 font-bold leading-5 text-2xl" ><%=pending%></h6>
              <p class="mb-3 text-sm font-semibold">
                PENDING AMOUNT
              </p>
            </center>
            </div>
          </div>
          
          
          <div class="flex flex-col justify-center drop-shadow-xl rounded p-3 w-60 h-48  ml-12 shadow-sm" style="background-color: #2E2E33;">
            <div>
          <center>
              <h6 class="mb-4 font-bold leading-5 text-2xl" ><%=paid%></h6>
              <p class="mb-3 text-sm font-semibold ">
                PAID AMOUNT
              </p>
            </center>
            </div>
          </div>


          <div class="flex flex-col justify-center p-3 w-60 h-48 rounded drop-shadow-xl ml-12 shadow-sm" style="background-color: #2E2E33;">
            <div>
          <center>
              <h6 class="mb-4 font-bold leading-5 text-2xl" ><%=pending+paid%></h6>
              <p class="mb-3 text-sm font-semibold">
                TOTAL AMOUNT
              </p>
            </center>
            </div>
          </div>

          <div class="flex flex-col justify-center p-3 w-60 h-48 rounded drop-shadow-xl ml-12 shadow-sm" style="background-color: #2E2E33;">
            <div>
          <center>
              <h6 class="mb-4 font-bold leading-5 text-2xl" ><%=ttl_cus%></h6>
              <p class="mb-3 text-sm font-semibold">
                CUSTOMERS
              </p>
            </center>
            </div>
          </div>

      </div>

      <div class="h-auto grid grid-cols-3 gap-4 content-start mt-12  " style=" background-color: #202023;">
        

        <div id="pie_total" style="width:auto ;max-width:97%;height: fit-content; "></div>
        <div id="pie_pend" style="width:auto;max-width:97%;height: fit-content;"></div>
        <div id="pie_paid" style="width:auto;max-width:97%;height: fit-content;"></div>   

        <div id="customergrp" style="width:auto;max-width:97%;height: fit-content;" > </div>
        <div id="customer_pending" style="width:auto;max-width:97%;height: fit-content;" > </div>
        <div id="customer_paid" style="width:auto;max-width:97%;height: fit-content;" > </div>



    
        


      </div>



      
      
      
       

                      
                            

</div>
</div>




        </div>









        

        
        
        
        <!--TOTAL CUSTOMER BAR CHART-->
        
        <script>
        var data = [{
          x:price,
          y:customer,
          type:"bar",
          orientation:"h",
          
          marker: {color:"rgba(255,0,0,0.6)"}
          
        }];
        var layout = {title:"CUSTOMER TOTAL(GRAPH)", 
        
        paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'

};
        
        Plotly.newPlot("customergrp", data, layout);
        </script>
        
        <!--________________________TOTAL PENDING_______________________-->
        
        <script>
        var data = [{
          x:customer_pending,
          y:customer,
          type:"bar",
          orientation:"h",
          marker: {color:"rgba(255,0,0,0.6)"}
        }];
        var layout = {title:"CUSTOMER PENDING(GRAPH)",        
        paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
        Plotly.newPlot("customer_pending", data, layout);
        </script>
        
        <!--TOTAL PAID-->
        
        <script>
        var data = [{
          x:customer_paid,
          y:customer,
          type:"bar",
          orientation:"h",
          marker: {color:"rgba(255,0,0,0.6)"}
        }];
        var layout = {title:"CUSTOMER PAID(GRAPH)",     paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
        Plotly.newPlot("customer_paid", data, layout);
        </script>
        
        
        <!--___________________________________________________-->
        
        
        <script>
        
        var data = [{
          x:price,
          y:customer,
          type:"bar"
          
        }];
        var layout = {title:"CUSTOMER TOTAL",     paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
        Plotly.newPlot("plot_total", data, layout);
        </script>
        
        
        
        <script>
        var data = [{
          x:customer_pending,
          y:customer,
          type:"bar"
        }];
        var layout = {title:"CUSTOMER PENDING",     paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
        Plotly.newPlot("plot_pend", data, layout);
        </script>
        
        
        
        
        <script>
        var data = [{
          x:customer_paid,
          y:customer,
          type:"bar"
        }];
        var layout = {title:"CUSTOMER PAID",     paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
        Plotly.newPlot("plot_paid", data, layout);
        </script>
        
        <!--____________________________________-->
        
        
        
        <script>
        var data = [{
          values: price,
          labels: customer,
          type: 'pie'
        }];
        
        var layout = {title:"CUSTOMER TOTAL",       paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
        
        Plotly.newPlot('pie_total', data, layout);
        </script>
        
        <script>
        var data = [{
          values: customer_pending,
          labels: customer,
          type: 'pie'
        }];
        
        var layout = {title:"CUSTOMER PENDING",       paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
        
        Plotly.newPlot('pie_pend', data, layout);
        </script>
        
        <script>
        var data = [{
          values: customer_paid,
          labels: customer,
          type: 'pie'
        }];
        
        var layout = {title:"CUSTOMER PAID",       paper_bgcolor: 'rgba(0,0,0,0)',
  plot_bgcolor: 'rgba(0,0,0,0)'};
        
        Plotly.newPlot('pie_paid', data, layout);
        </script>




    </body>
</html>
