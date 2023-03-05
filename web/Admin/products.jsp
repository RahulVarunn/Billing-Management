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
    <body style="background-color: #222" class="h-screen">
        
  
        
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
            
    
    
    
                <ul class="nav pt-2 flex flex-col md:flex-row flex-wrap list-none " id="tabs-tab"
                role="tablist" style="background-color: #1D1D20;">

             




                <li class="nav-item" role="presentation">
                  <a href="#tabs-messages" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium" id="tabs-messages-tab" data-bs-toggle="pill" data-bs-target="#tabs-messages" role="tab"
                    aria-controls="tabs-messages" aria-selected="false">Customer</a>




                </li>


                <li class="nav-item" role="presentation">
                  <a href="#tabs-profile" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium" id="tabs-profile-tab" data-bs-toggle="pill" data-bs-target="#tabs-profile" role="tab"
                    aria-controls="tabs-profile" aria-selected="false">Product</a>
                </li>



<!-- 


  
                <li class="nav-item" role="presentation">
                  <a href="#tabs-contact" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium" id="tabs-contact-tab" data-bs-toggle="pill" data-bs-target="#tabs-contact" role="tab"
                    aria-controls="tabs-contact" aria-selected="false">Contact</a>
                </li> -->
              </ul>
    
              </div>
            </div>
          </div>
          <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
    
            <!-- Profile dropdown -->
            <div class="ml-3 relative">
              <div>
                <a href="login.jsp" class=" bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white"><i class="material-icons">logout</i></a>
    
            
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



       
         



     
     <div class="tab-pane fade" id="tabs-profile" role="tabpanel" aria-labelledby="tabs-profile-tab">






      <div class="p-4 ml-5 mr-5    shadow-md sm:p-8 " style="background-color: #2E2E33;" >
        <div class="flex justify-between items-center mb-4">
            <h5 class="text-xl font-bold leading-none text-gray-900 dark:text-white">PRODUCT DETAILS</h5>
           
       </div>
       <div class="flow-root">
            <ul role="list" class="divide-y divide-gray-200 dark:divide-gray-700">
              <% 
                
              URL url = new URL("http://localhost:8787/xyzz/webresources/billing.products");
    
              InputStream fis =url.openStream();
              JsonReader reader=Json.createReader(fis);
              JsonArray prod =reader.readArray();
        
      for (JsonObject result : prod.getValuesAs(JsonObject.class)) {%>   











 
              <li class="py-3 sm:py-4">
                  <div class="flex items-center space-x-4">
                 
                      <div class="flex-1 min-w-0">
                          <p class="text-sm font-medium text-gray-900 truncate dark:text-white" >
                            <%=result.get("productName")%>
                          </p>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 12px;">
                             Product Mrp:   : <%=result.get("productMrp")%>
                          </p>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 14px;">
                           Product Price : <%=result.getInt("productPrice")%>
                         </p>
                         <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 12px;">
                       </p>

                      </div>
                      <div class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white">

                        <div>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 13px; ">
                          </p>
                         <p class="text-sm  truncate dark:text-gray-400" style="font-size: 13px; color: white;">
                          <form action="../Admin/product_actions.jsp" method="post">
                            <input type="hidden"name="id" value="<%=result.getJsonNumber("productId")%>">
                   
                            <button type="submit" class="btn btn-sm mr-3 place-items-center" style="background-color:rgb(255, 85, 0) ; color: white;">REMOVE PRODUCT</button>
                            <!-- <button class="btn btn-warning btn-sm" >Edit</button>
                            <label  for="my-modal-3" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Add Customer</label>
                   
                   
                             -->
                        </form>
                        </p>

                        </div>
                        


               
                      </div>
                  </div>
              </li>
             

  






  
      
<% } 
%>  
</ul>
</div>
</div>














    
    
    








    </div>
     <div class="tab-pane fade show active " id="tabs-messages"  role="tabpanel" aria-labelledby="tabs-profile-tab">













     



    <!-- <div role="status" class="p-4 space-y-4 max-w-md rounded border border-gray-200 divide-y divide-gray-200 shadow animate-pulse dark:divide-gray-700 md:p-6 dark:border-gray-700"> -->

      <div class="p-4 ml-5 mr-5    shadow-md sm:p-8 " style="background-color: #2E2E33;" >
        <div class="flex justify-between items-center mb-4">
            <h5 class="text-xl font-bold leading-none text-gray-900 dark:text-white">CUSTOMER DETAILS</h5>
           
       </div>
       <div class="flow-root">
            <ul role="list" class="divide-y divide-gray-200 dark:divide-gray-700">
              <%
        
            
               url = new URL("http://localhost:8787/xyzz/webresources/billing.customer");
      
          fis =url.openStream();
          reader=Json.createReader(fis);
          prod =reader.readArray();
         
       for (JsonObject x1 : prod.getValuesAs(JsonObject.class)) {%>        











 
              <li class="py-3 sm:py-4">
                  <div class="flex items-center space-x-4">
                 
                      <div class="flex-1 min-w-0">
                          <p class="text-sm font-medium text-gray-900 truncate dark:text-white" >
                            <%=x1.get("name")%>
                          </p>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 12px;">
                             Phone no : <%=x1.get("phone")%> 
                          </p>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 12px;">
                            Address: <%=x1.get("address")%> 
                         </p>
                         <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 12px;">
                       </p>

                      </div>
                      <div class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white">

                        <div>
                          <p class="text-sm text-gray-500 truncate dark:text-gray-400" style="font-size: 13px; ">
                           paid Amount Till Now : <%=x1.get("totalPaid")%>
                          </p>
                         <p class="text-sm  truncate dark:text-gray-400" style="font-size: 13px; color: white;">
                          Pending Amount Till Now : <%=x1.get("totalPending")%>

                        </p>

                        </div>
                        


                        
                        <!-- <form  action="remove_product" method="post">
                          <input type="hidden" value="<%=x1.getInt("id")%>" name="prod_id"">
                          <button class="ml-5 btn btn-circle " type="submit" onclick="alert('do you want to delete!')">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" /></svg>
                          </button>
                          </form>   -->
                      </div>
                  </div>
              </li>
             

  






  
      
<% } 
%>  
</ul>
</div>
</div>

















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
