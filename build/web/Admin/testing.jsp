<%-- 
    Document   : testing
    Created on : 25 Aug, 2022, 7:47:50 PM
    Author     : RAHUL
--%>

<%@page import="javax.json.JsonReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.InputStream"%>
<%@page import="javax.json.Json"%>
<%@page import="javax.json.JsonArray"%>
<%@page import="javax.json.JsonObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
        
            
        URL url = new URL("http://localhost:8787/xyzz/webresources/billing.customer");

   InputStream fis =url.openStream();
   JsonReader reader=Json.createReader(fis);
   JsonArray prod =reader.readArray();
   
 for (JsonObject result : prod.getValuesAs(JsonObject.class)) {%>
 
 <%=result.getString("name")%>
  <%=result.getInt("totalAmt")%>
 <%=result.get("totalPaid")%>
  <%=result.get("totalPaid")%>


 <%}%>
        
    </body>
</html>
