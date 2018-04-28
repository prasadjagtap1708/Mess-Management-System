<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.AddNewManagerBean"/>  
  
<jsp:setProperty property="*" name="obj"/>  
  
<%  
    
int status=DB.addNewManagerMethod(obj);
if(status>0){  
//out.println("Manager successfully added...!!!"+status); 
out.println("<script type='text/javascript' src='../js/jquery-latest.js'></script><script src='../js/sweetalert.min.js'></script><link href='../js/sweetalert.css' rel='stylesheet' type='text/css'/><script>$( document ).ready(function() {swal({title: 'Manager Added Successfully...!!',text: 'success',type: 'success',}, function(isConfirm) {document.location.href='subadmin_index.jsp'});});</script>");

}  
else  
{  
out.print("Something Went Wrong"+status);  
  
}  
%> 

