<!-- * @author RAHUL and SHREYA (INTERNSHIP PROJECT)-->

<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>home</title>
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
<link rel="stylesheet" href="style.css">

</head>
<body style="background-color: #1D1D20;">








  <% 
  String countq = "select count(*) from customer";
 PreparedStatement  pst_count=database.connection.getConnection().prepareStatement(countq);
       ResultSet rs = pst_count.executeQuery();
       rs.next();
             int count = rs.getInt(1);
 
 
 %>
 

 





























<br><br><br>



<form class="flex items-center ml-4">   
  <label for="voice-search" class="sr-only">Search</label>
  <div class="relative w-96">
      <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
          <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path></svg>
      </div>
      <input type="text" id="voice-search" name="search_box" class=" border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" style="background-color: #2E2E33;" placeholder="Search Customer " required="">
  </div>
  <button type="submit" name="search" style="background-color: #3ABAB4;" class="inline-flex items-center py-2.5 px-3 ml-2 text-sm font-medium text-white bg-blue-700 rounded-lg border  border-none  ">
      <svg aria-hidden="true" class="mr-2 -ml-1 w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg>Search
  </button>
</form>
<br><br>


    
 
    
<% if(request.getParameter("search")!=null){%>
   <h4 class="ml-4 ">SEARCH RESULT</h4>       
   <div class="card-group mb-4" style="border-bottom: 2px solid grey;">
       
<!--SEARCH CUSTOMER-->

<% 
//  Getting data from data base  

String search=request.getParameter("search_box");
String a="select * from customer where  name=? or phone=?";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
pst.setString(1,search);
pst.setString(2, search);
ResultSet x=pst.executeQuery();

while(x.next()){%>


  <form  action="details.jsp"method="get">             
    <button value="submit"  name="btn" class="shadow-xl ml-4 mb-4 mt-4  flex flex-col  bg-white rounded  shadow-md md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-700" style="background-color: #2E2E33;">
      <input type="hidden" name="id" value="<%=x.getInt("id")%>" >
      <input type="hidden" name="customer" value="<%=x.getString("name")%>" >
      <div class="flex flex-col justify-between p-4 leading-normal">
          <h5 class="mb-2 text-left  font-bold tracking-tight text-gray-900 dark:text-white" ><%=x.getString("name").toUpperCase()%></h5>
          <p class="mb-3 text-left font-normal text-gray-700 dark:text-gray-400" style="font-size: 12px;">Customer Registered On <%=x.getString("date")%><br> Customer Phone number <%=x.getString("phone")%>   </p>
    
      </div><br>
    </button>
    </form>
<% }%>  
        


  <%  
    //BY CLICKING ON CLOSE BUTTON ITS REMOVE ALL THE SEARCH RESULT   
   }else if(request.getParameter("close")!=null){

}
   %>

     </div>
 
    

    
    

<!--GETTING CUSTOMERS DATA  -->



  
        
<div class="grid grid-cols-3 gap-4 ml-4 mr-4">
                        
<%                 
                    
String a="select * from customer";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
ResultSet x=pst.executeQuery();
while(x.next()){%>

  <% 
  
    
    //get total pending price of a aproduct     
    
    String mt="select sum(total) from customers_details where payment_status=? and customer_id=? ";
    PreparedStatement  pst_pending=database.connection.getConnection().prepareStatement(mt);
    pst_pending.setString(1, "Pending");
    pst_pending.setInt(2,x.getInt("id"));

    ResultSet total_pending=pst_pending.executeQuery(); 
    total_pending.next();
    int pending = (int)total_pending.getInt(1);  
 
      
   mt="select sum(total) from customers_details where payment_status=? and customer_id=? ";
    PreparedStatement  pst_paid=database.connection.getConnection().prepareStatement(mt);
    pst_paid.setString(1, "paid");
    pst_paid.setInt(2,x.getInt("id"));

    ResultSet total_paid=pst_paid.executeQuery(); 
    total_paid.next();
    int paid = total_paid.getInt(1);  
 %> 






<form  action="details.jsp"method="get">             
<button value="submit"  name="btn" class="shadow-xl  flex flex-col  bg-white rounded  shadow-md md:flex-row md:max-w-xl hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-900 dark:hover:bg-gray-700" style="background-color: #2E2E33;">
  <input type="hidden" name="id" value="<%=x.getInt("id")%>" >
  <input type="hidden" name="customer" value="<%=x.getString("name")%>" >
  <canvas id="myChart<%=x.getInt("id")%>" style="width:95%;max-width:230px; "></canvas>
  <div class="flex flex-col justify-between p-4 leading-normal">
      <h5 class="mb-2 text-left  font-bold tracking-tight text-gray-900 dark:text-white" ><%=x.getString("name").toUpperCase()%></h5>
      <p class="mb-3 text-left font-normal text-gray-700 dark:text-gray-400" style="font-size: 12px;">Customer Registered On <%=x.getString("date")%> Customer Phone number <%=x.getString("phone")%>   </p>

  </div><br>
</button>
</form>

               
              <script>
                var xValues = ["PENDING", "PAID"];
                var yValues = [<%=pending%>,<%=paid%>];
                var barColors = [
                  "#b91d47",
                  "#00aba9",
                  "#2b5797",
                  "#e8c3b9",
                  "#1e7145"
                ];
                
                new Chart("myChart<%=x.getInt("id")%>", {
                  type: "pie",
                  data: {
                    labels: xValues,
                    datasets: [{
                      backgroundColor: barColors,
                      data: yValues
                    }]
                  },
                  options: {
                    title: {
                      display: true,
                      text: "Customer "
                    }
                  }
                });
                </script>




<% }%>  
        
 </div>
<br><br><br>






<!-- The button to open modal -->

<!-- Put this part before </body> tag -->
<input type="checkbox" id="my-modal-3" class="modal-toggle" />
<div class="modal">



  <div class="p-4 w-full max-w-sm bg-white backdrop-blur-sm rounded-lg border border-gray-200 shadow-md sm:p-6 md:p-8 dark:bg-gray-800 dark:border-gray-700 modal-box relative" style="background-color:#1D1D20 ;">
    <label for="my-modal-3" class="btn btn-sm btn-circle absolute right-2 top-2">✕</label>

    <form class="space-y-6"  action="add_customer.jsp"  method="post">
        <h5 class="text-xl font-medium text-gray-900 dark:text-white">Add New Customer</h5>
        <div>
            <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Customer Name</label>
            <input type="text" name="name" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="ABC XYZ" required="" style="background-color: #2E2E33;">
        </div>
        <div>
          <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Customer Phone Number</label>
          <input type="number" name="phone" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="999XXXXX0" required="" style="background-color: #2E2E33;">
      </div>

      <div>
        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Customer Address</label>
        <input type="text" name="adr" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="Building Name Plot no....." required="" style="background-color: #2E2E33;">
    </div>
<!-- 
        <div class="flex items-start">
            <div class="flex items-start">
                <div class="flex items-center h-5">
                    <input id="remember" type="checkbox" value="" class="w-4 h-4 bg-gray-50 rounded border border-gray-300 focus:ring-3 focus:ring-blue-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-blue-600 dark:ring-offset-gray-800" required="">
                </div>
                <label for="remember" class="ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">Remember me</label>
            </div>
            <a href="#" class="ml-auto text-sm text-blue-700 hover:underline dark:text-blue-500">Lost Password?</a>
        </div> -->
        <button type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"  style="background-color: #3ABAB4;">Add Customer</button>
        <!-- <div class="text-sm font-medium text-gray-500 dark:text-gray-300">
            Not registered? <a href="#" class="text-blue-700 hover:underline dark:text-blue-500">Create account</a>
        </div> -->
    </>
</div>
</div>





  








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







<div class="px-4 py-16 mx-auto sm:max-w-xl md:max-w-full bg-gray-900 lg:max-w-screen-xl md:px-24 lg:px-8 lg:py-20" style="background-color: #202023;">
  <div class="max-w-xl mb-10 md:mx-auto sm:text-center lg:max-w-2xl md:mb-12">
    <div>
      <p class="inline-block px-3 py-px mb-4 text-xs font-semibold tracking-wider text-teal-900 uppercase rounded-full bg-teal-accent-400">
        Graphs
      </p>
    </div>
    <h2 class="max-w-lg mb-6 font-sans text-3xl font-bold leading-none tracking-tight text-gray-900 sm:text-4xl md:mx-auto" style="color: #3ABAB4;">
      <span class="relative inline-block">
        <svg viewBox="0 0 52 24" fill="currentColor" class="absolute top-0 left-0 z-0 hidden w-32 -mt-8 -ml-20 text-blue-gray-100 lg:w-32 lg:-ml-28 lg:-mt-10 sm:block">
          <defs>
            <pattern id="18302e52-9e2a-4c8e-9550-0cbb21b38e55" x="0" y="0" width=".135" height=".30">
              <circle cx="1" cy="1" r=".7"></circle>
            </pattern>
          </defs>
          <rect fill="url(#18302e52-9e2a-4c8e-9550-0cbb21b38e55)" width="52" height="24"></rect>
        </svg>
        <span class="relative">Whenever</span>
      </span>
       you see a successful business, someone once made a courageous decision.    </h2>
    <p class="text-base text-gray-700 md:text-lg">
       Here Is Your Statistic , No of customer , profits and losses
    </p>
  </div>
  <div class="grid gap-4 row-gap-5 sm:grid-cols-2 lg:grid-cols-4">

    <div class="flex flex-col drop-shadow-xl justify-center rounded p-3 w-60 h-48   shadow-sm" style="background-color: #2E2E33;">
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
</div>




























  <!-- Modal -->

  
  









<!-- DATA -->


<!--ADD USER-->





<!--TOAST-->

<% 
      if(session.getAttribute("action")!=null ){%>


  <div id="toast-success" class="backdrop-blur-sm fixed  z-40 right-5 bottom-5 flex items-center p-4 mb-4 w-full max-w-xs text-gray-500 bg-white rounded-lg shadow dark:text-gray-400 dark:bg-gray-900" role="alert">
    <div class="inline-flex flex-shrink-0 justify-center items-center w-8 h-8 text-green-500 bg-green-100 rounded-lg dark:bg-green-800 dark:text-green-200">
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path></svg>
        <span class="sr-only">Check icon</span>
    </div>
    <div class="ml-3 text-sm font-normal"><%=session.getAttribute("action") %>   

      <%session.removeAttribute("action");%>
    </div>
    <button type="button" class="ml-auto -mx-1.5 -my-1.5 bg-white text-gray-400 hover:text-gray-900 rounded-lg focus:ring-2 focus:ring-gray-300 p-1.5 hover:bg-gray-100 inline-flex h-8 w-8 dark:text-gray-500 dark:hover:text-white dark:bg-gray-800 dark:hover:bg-gray-700" data-dismiss-target="#toast-success" aria-label="Close">
        <span class="sr-only">Close</span>
        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
    </button>
  </div>

  
<% } %>









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
            <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
          <!--
            Icon when menu is open.

            Heroicon name: outline/x

            Menu open: "block", Menu closed: "hidden"
          -->
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
            <h1  class="inline-flex items-center px-5 py-2.5 text-sm font-medium text-center text-white  rounded-lg focus:ring-4 focus:outline-none   " style="color: white;">
              Home
              <span class="inline-flex justify-center items-center ml-2 w-4 h-4 text-xs font-semibold text-blue-800 bg-blue-200 rounded-full">
                <%=ttl_cus%>
              </span>
            </h1>




            <!-- <a href="info.jsp" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Information</a> -->

            

            <label  for="my-modal-3" class="text-gray-300 hover:bg-gray-700 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Add Customer</label>
          </div>
        </div>
      </div>
      <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">

        <!-- Profile dropdown -->
        <div class="ml-3 relative">
          <div>
            <a href="login.jsp" class=" bg-gray-800 flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white" ><i class="material-icons">logout</i></a>

        
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











<script>
$(document).ready(function(){
  $('.toast').toast('show');
});
</script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
      

    </body>
       
</html>
