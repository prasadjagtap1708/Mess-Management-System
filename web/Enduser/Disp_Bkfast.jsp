<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.Breakfastbean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
    
int status=DB.breakfastMethod(obj);
if(status>0){  
out.println("Breakfast successfully added...!!!"+status); 

}  
else  
{  
out.print("Something Went Wrong"+status);  
  
}  
%> 