<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.BranchBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<% 
    String branch_name=request.getParameter("branch_name"); 
session.setAttribute("branch_name",branch_name);
int status=DB.addNewBranch(obj);
if(status>0){  
out.println("Subadmin successfully added...!!!"+status); 
%>
<jsp:forward page="addNewSubadmin.jsp"/>
<% 
}  
else  
{  
out.print("Something Went Wrong"+status);  
  
}  
%> 
