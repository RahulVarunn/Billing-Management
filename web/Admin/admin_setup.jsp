textarea<%@page import="java.net.URL"%>
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
 <style>
    * {
        margin:0;
        padding:0;
        font-family: 'Open Sans', sans-serif;
    }
    .input {
        transition: border 0.2s ease-in-out;
        min-width: 280px
    }
    .input:focus+.label,
    .input:active+.label,
    .input.filled+.label {
        font-size: .75rem;
        transition: all 0.2s ease-out;
        top: -0.9rem;
        background-color: #fff;
        color: white;
        padding: 0 5px 0 5px;
        margin: 0 5px 0 5px;
    }
    .label {
        transition: all 0.2s ease-out;
        top: 0.4rem;
        left: 0;
    }
</style>
</head>
    <body style="background-color: #222">
        
  
        
     <%
         
     
  //VERIFING ADMIN PAGE
                         
String a="select * from admin_details";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
ResultSet x=pst.executeQuery();
if(x.next()){
    
   %>
        



    
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
                  <a href="#tabs-home" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium"
                   id="tabs-home-tab" data-bs-toggle="pill" data-bs-target="#tabs-home" role="tab" aria-controls="tabs-home"
                    aria-selected="true">Home</a>
                </li>


                <li class="nav-item" role="presentation">
                  <a href="#tabs-profile" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium" id="tabs-profile-tab" data-bs-toggle="pill" data-bs-target="#tabs-profile" role="tab"
                    aria-controls="tabs-profile" aria-selected="false">Edit </a>
                </li>


         
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
    <div class="tab-pane fade " id="tabs-home" style="color: white;" role="tabpanel" aria-labelledby="tabs-profile-tab">




</div>


     
     <div  id="tabs-profile" role="tabpanel" class="tab-pane fade show active" aria-labelledby="tabs-profile-tab">







       
       <!-- <div  >   <center>  <h1 class="mt-2 mb-4" style="color: white">ADMIN SETUP</h1>   </center></div> -->
       
       <div class="container mt-3 pe-5 ps-5 pt-5 pb-5" >
       
       
       
       
  <form class="row g-3" action="../admin_update" method="post">


    <div class="col-md-3"> 
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Your  Name</label>
        <input type="text" name="name" class="form-control" id="inputEmail4" required    class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33; color: darkgrey;"  placeholder="<%=x.getString("name")%>">
    </div>

    <div class="col-md-3"> 
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Email Id</label>
        <input type="text" name="email" class="form-control" id="inputEmail4" required    class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33; color: darkgrey;"  placeholder="<%=x.getString("email")%>">
    </div>

    <div class="col-md-3"> 
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Password</label>
        <input type="text" name="password" class="form-control" id="inputEmail4" required    class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33; color: darkgrey;"  placeholder="<%=x.getString("admin_password")%>">
    </div>

    <div class="col-md-3"> 
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Website Id</label>
        <input type="text" name="web_id" class="form-control" id="inputEmail4" required    class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33; color: darkgrey;"  placeholder="<%=x.getString("web_id")%>">
    </div>

    <div class="col-md-3"> 
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">SHOP TYPE</label>
        <input type="text" name="shop_type" class="form-control" id="inputEmail4" required    class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33; color: darkgrey;"  placeholder="<%=x.getString("shop_type")%>">
    </div>



    <div class="col-md-3"> 
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Phone No</label>
        <input type="number" name="phone" class="form-control" id="inputEmail4" required    class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33; color: darkgrey;"  placeholder="<%=x.getString("phoneno")%>">
    </div>


    <div class="col-md-6"> 
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Shop/Office Name</label>
        <input type="text" name="office_name" class="form-control" id="inputEmail4" required    class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33; color: darkgrey;"  placeholder="<%=x.getString("shop_name")%>">
    </div>

  

    <div class="col-md-12"> 
        <label for="small-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">SHOP Address</label>
        <textarea type="textarea name="address" class="form-control"   rows="4" id="inputEmail4" required    class="block p-2 w-full text-gray-900 bg-gray-50   border-gray-300 sm:text-xs focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="border-radius: 0px;border: none; background-color: #2E2E33; color: darkgrey;"  placeholder="<%=x.getString("address")%>"></textarea>
    </div>
  


    

    

    

    
    

  
  

    <div class="form-check mt-5">
      <input class="form-check-input" type="checkbox" id="gridCheck" required>
      <label class="form-check-label" for="gridCheck">
          <h6 class=" " style="font-size: 15px;color:darkgrey ;">   ARE YOU SURE TO UPDATE YOUR DETAIL!!</h6>
      </label>
    </div>
  <div class="col-12 mt-5">


    
      <center> <button type="submit" style="background-color: #2E2E33;" class="btn btn-outline-dark ">UPDATE NOW</button>
      </center>
  </div>
</form>  
    
    
    <form action="../clear_data" method="post">
        <center>   
            
            <button type="submit" class="btn btn-outline-dark mt-4" onclick="alert('do you want to delete!')">CLEAR ALL CUSTOMER DATA</button>
               <h6 class="text-danger mt-3" style="font-size: 14px;">Warning: It Will delete your All Customer data </h6>


     
        </center></form>
       </div>     
       
     </div>










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
