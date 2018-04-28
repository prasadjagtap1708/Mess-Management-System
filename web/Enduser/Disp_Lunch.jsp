<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.Lunchbean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
    
int status=DB.lunchMethod(obj);
if(status>0){  
out.println("Lunch successfully added...!!!"+status); 

}  
else  
{  
out.print("Something Went Wrong"+status);  
  
}  
%> 