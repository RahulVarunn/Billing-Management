<!--ADMIN PaGE-->

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">       
    </head>
    <body style="background-color: #222">
        
  
        
     <%
         
     
  //VERIFING ADMIN PAGE
                         
String a="select * from admin_details";
PreparedStatement  pst=database.connection.getConnection().prepareStatement(a);
ResultSet x=pst.executeQuery();
if(x.next()){
    
    if( x.getString("admin_password").equals(request.getParameter("password")) || x.getString("web_id").equals(request.getParameter("password")) ){
       session.setAttribute("admin",x.getString("name") );%>
        

       
       <div  >   <center>  <h1 class="mt-2 mb-4" style="color: white">ADMIN SETUP</h1>   </center></div>
       
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
       
     </div>

     
     
        
  <%  }else{

    }

    }else{
    out.println("SERVER ERROR!!");
}   
     
     
     %>   
 
     
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>     
    </body>
</html>
