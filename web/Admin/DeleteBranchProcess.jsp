<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.AddNewSubadminBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
int subadminid=Integer.parseInt(request.getParameter("subadminid")); 
int branchid=Integer.parseInt(request.getParameter("branchid")); 
int status=DB.deleteSubadmin(subadminid,branchid);
if(status>0){  
out.println("Subadmin successfully Deleted...!!!"+status); 
%>

<% 
}  
else  
{  
out.print("Something Went Wrong"+status);  
  
}  
%> 

 
