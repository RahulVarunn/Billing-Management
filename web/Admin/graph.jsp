<%@page import="java.net.URL"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.json.Json"%>
<%@page import="javax.json.JsonReader"%>
<%@page import="javax.json.JsonArray"%>
<%@page import="javax.json.JsonObject"%>
<!--ADMIN PaGE-->

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">       
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
    <body style="background-color: #222">
        
  
        
     <%
         
     
  //VERIFING ADMIN PAGE
                         
String a="select * from admin_details";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
ResultSet x=pst.executeQuery();
if(x.next()){
    
   %>
        

       
       <!-- <div  >   <center>  <h1 class="mt-2 mb-4" style="color: white">ADMIN SETUP</h1>   </center></div>
       
       <div class="container mt-3 pe-5 ps-5 pt-5 pb-5" style="background-color: white;border-radius: 10px">
       
       
       
       
  <form class="row g-3" action="admin_update" method="post">
  <div class="col-md-3">
    <label for="inputEmail4" class="form-label">NAME</label>
    <input type="text" value="<%=x.getString("name")%>" name="name" class="form-control" id="inputEmail4" required>
  </div>
  
    <div class="col-md-3">
    <label for="inputEmail4" class="form-label">EMAIL</label>
    <input type="email" value="<%=x.getString("email")%>" name="email" class="form-control" id="inputEmail4"required>
  </div>
  
  
  <div class="col-md-3">
    <label for="inputPassword4" class="form-label">PASSWORD</label>
    <input type="text" value="<%=x.getString("admin_password")%>" name="password" class="form-control" id="inputPassword4" required>

  </div>
    <div class="col-md-3">
    <label for="inputPassword4" class="form-label">WEBSITE ID</label>
    <input type="text" value="<%=x.getString("web_id")%>" name="web_id" class="form-control" id="inputPassword4" required>

  </div>
    
  <div class="col-3">
    <label for="inputAddress" class="form-label">SHOP TYPE</label>
    <input type="text" name="shop_type" class="form-control" value="<%=x.getString("shop_type")%>" id="inputAddress" placeholder="1234 Main St" required>
  </div>
    
  <div class="col-3">
    <label for="inputAddress" class="form-label">PHONE NO</label>
    <input type="number" name="phone" class="form-control" value="<%=x.getString("phoneno")%>"  id="inputAddress" placeholder="1234 Main St" required>
  </div>
    
  
    <div class="col-6">
    <label for="inputAddress" class="form-label">SHOP/OFFICE NAME</label>
    <input type="text" name="office_name"  class="form-control" value="<%=x.getString("shop_name")%>"  id="inputAddress" placeholder="1234 Main St" required>
  </div>
    
    
  <div class="col-12">
    <label for="inputAddress2" class="form-label">ADDRESS</label>
    <input style="height: 100px" name="address" rows="6px" type="text" value="<%=x.getString("address")%>" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" required>
  
  </div>
  
  

    <div class="form-check mt-5">
      <input class="form-check-input" type="checkbox" id="gridCheck" required>
      <label class="form-check-label" for="gridCheck">
          <h6 class="text-danger " style="font-size: 15px;">   ARE YOU SURE TO UPDATE YOUR DETAIL!!</h6>
      </label>
    </div>
  <div class="col-12 mt-5">
      <center> <button type="submit" class="btn btn-outline-dark ">UPDATE NOW</button>
          <a  href="login.jsp" class="btn ms-3 btn-outline-dark ">BACK TO LOGIN PAGE</a>
      </center>
  </div>
</form>  
    
    
    <form action="clear_data" method="post">
        <center>   
            
            <button type="submit" class="btn btn-outline-dark mt-4" onclick="alert('do you want to delete!')">CLEAR ALL CUSTOMER DATA</button>
               <h6 class="text-danger mt-3" style="font-size: 14px;">Warning: It Will delete your All Customer data </h6>


     
        </center></form>
       </div>     
       
     </div> -->

    
     <nav class=" fixed top-0 left-0 right-0 inset-x-0 top-0  z-40" style="background-color: #1D1D20;">
      <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
        <div class="relative flex items-center justify-between h-16">
          <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
            <!-- Mobile menu button-->
            <button type="button" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
              <span class="sr-only">Open main menu</span>
              <!--
                Icon when menu is closed.
    
                Heroicon name: outline/menu
    
                Menu open: "hidden", Menu closed: "block"
              -->
              <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16"></path>
              </svg>
              <!--
                Icon when menu is open.
    
                Heroicon name: outline/x
    
                Menu open: "block", Menu closed: "hidden"
              -->
              <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
              </svg>
            </button>
          </div>
          <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
            <div class="flex-shrink-0 flex items-center">
              
              <a href="../Admin/index.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
               
              >Back To Home</a>
    
            </div>
            <div class="hidden sm:block sm:ml-6">
              <div class="flex space-x-4">
                <!-- Current: "bg-gray-900 text-white", Default: "text-gray-300 hover:bg-gray-700 hover:text-white" -->
            
    
    
    
      
    
              </div>
            </div>
          </div>
          <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
    
            <!-- Profile dropdown -->
            <div class="ml-3 relative">
              <div>
                <a href="../login.jsp" class=" bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white"><i class="material-icons">logout</i></a>
    
            
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
     

<br><br><br><br>
<div>

   
   <div class="tab-content " id="tabs-tabContent">
    <div class="tab-pane fade show active" id="tabs-home" style="color: white;" role="tabpanel" aria-labelledby="tabs-profile-tab">






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
        
            
        URL url = new URL("http://localhost:8787/xyzz/webresources/billing.customer");

   InputStream fis =url.openStream();
   JsonReader reader=Json.createReader(fis);
   JsonArray prod =reader.readArray();
   
 for (JsonObject customer : prod.getValuesAs(JsonObject.class)) {%>
 




    
       <script>customer.push("<%=customer.get("name") %>"); </script>
       <script>price.push(<%=customer.get("totalAmt")%>); </script>
       <script>customer_paid.push(<%=customer.get("totalPaid")%>); </script>
       <script>customer_pending.push(<%=customer.get("totalPending")%>); </script>
    
    <%}%>



<div class="container h-full">


<div class="flex items-stretch ">



<div class="py-12 w-full" >



      
      <div class="flex flex-row ">
        
        <div class="flex flex-col drop-shadow-xl justify-center rounded p-2 w-56 h-48 ml-4  shadow-sm" style="background-color: #2E2E33;">
            <div>
          <center>
              <h6 class="mb-4 font-bold leading-5 text-2xl" ><%=pending%></h6>
              <p class="mb-3 text-sm font-semibold">
                PENDING AMOUNT
              </p>
            </center>
            </div>
          </div>
          
          
          <div class="flex flex-col justify-center drop-shadow-xl rounded p-3 w-60 h-48  ml-20 shadow-sm" style="background-color: #2E2E33;">
            <div>
          <center>
              <h6 class="mb-4 font-bold leading-5 text-2xl" ><%=paid%></h6>
              <p class="mb-3 text-sm font-semibold ">
                PAID AMOUNT
              </p>
            </center>
            </div>
          </div>


          <div class="flex flex-col justify-center p-3 w-60 h-48 rounded drop-shadow-xl ml-20 shadow-sm" style="background-color: #2E2E33;">
            <div>
          <center>
              <h6 class="mb-4 font-bold leading-5 text-2xl" ><%=pending+paid%></h6>
              <p class="mb-3 text-sm font-semibold">
                TOTAL AMOUNT
              </p>
            </center>
            </div>
          </div>

          <div class="flex flex-col justify-center p-3 w-60 h-48 rounded drop-shadow-xl ml-20 shadow-sm" style="background-color: #2E2E33;">
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

   </div>



       
         



     
     <div class="tab-pane fade" id="tabs-profile" role="tabpanel" aria-labelledby="tabs-profile-tab">
       Tab 2 content
     </div>
     <div class="tab-pane fade" id="tabs-messages" role="tabpanel" aria-labelledby="tabs-profile-tab">
       Tab 3 content
     </div>
     <div class="tab-pane fade" id="tabs-contact" role="tabpanel" aria-labelledby="tabs-contact-tab">
       Tab 4 content
     </div>
   </div>

  </div>
  










     
        
  <% 

    }else{
    out.println("SERVER ERROR!!");
}   
     
     
     %>   
 
     
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
    </body>
</html>
