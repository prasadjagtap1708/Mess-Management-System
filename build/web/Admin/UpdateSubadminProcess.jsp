
<%@page import="dao.DB"%>
<jsp:useBean id="obj" class="pojo.AddNewSubadminBean"/>   
<jsp:setProperty property="*" name="obj"/> 

<%  
int status=DB.subadminUpdate(obj); 
if(status>0){  
out.println("<script type='text/javascript' src='../js/jquery-latest.js'></script><script src='../js/sweetalert.min.js'></script><link href='../js/sweetalert.css' rel='stylesheet' type='text/css'/><script>$( document ).ready(function() {swal({title: 'Successfully Updated',text: 'success',type: 'success',}, function(isConfirm) {document.location.href='index.jsp'});});</script>");
//out.println("<script LANGUAGE='JavaScript'>window.alert('Successfully Shortlisted Profile');</script>updated");
}
else{
System.out.println("Error");
}
%> 
