<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.Dinnerbean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
    
int status=DB.dinnerMethod(obj);
if(status>0){  
out.println("Dinner successfully added...!!!"+status); 

}  
else  
{  
out.print("Something Went Wrong"+status);  
  
}  
%> 