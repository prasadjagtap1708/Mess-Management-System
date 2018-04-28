<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.AddNewSubadminBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
 
int status=DB.addNewSubadminMethod(obj);
if(status>0){  
out.println("Subadmin successfully added...!!!"+status); 
%>
<jsp:forward page="index.jsp"/>
<% 
}  
else  
{  
out.print("Something Went Wrong"+status);  
System.out.println(status);
  
}  
%> 
