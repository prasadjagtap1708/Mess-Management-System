<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.UserLoginBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
 String username=request.getParameter("username"); 
session.setAttribute("username",username);   
boolean status=DB.validateU(obj);
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
<jsp:include page="user.jsp"></jsp:include>  
<%  
}  
%>  