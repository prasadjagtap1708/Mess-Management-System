<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.AddNewSubadminBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
String email=request.getParameter("email"); 
session.setAttribute("email",email);    
boolean status=DB.validateSub(obj);
if(status){  
out.println("You r successfully logged in"); 
%>  
<jsp:forward page="subadmin_index.jsp"></jsp:forward> 
<%
}  
else  
{  
out.print("Sorry, username or password error");  
%>  
<jsp:include page="subadmin.jsp"></jsp:include>  
<%  
}  
%> 