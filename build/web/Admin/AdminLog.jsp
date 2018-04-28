<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.AdminLoginBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
    
boolean status=DB.validate(obj);
if(status){  
out.println("You r successfully logged in"); 
%>  
<jsp:forward page="index.jsp"></jsp:forward> 
<%
}  
else  
{  
out.print("Sorry, username or password error");  
%>  
<jsp:include page="admin.jsp"></jsp:include>  
<%  
}  
%>  