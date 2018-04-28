<%@page import="java.util.List"%>
<%@page import="pojo.BranchBean"%>
<%@page import="dao.DB"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="u" class="pojo.BranchBean"/>   
<jsp:setProperty property="*" name="u"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>TODO supply a title</title>
        <!-- Latest compiled and minified CSS -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> 
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        
        <div class="container"><br>
            <h1 class="text-success text-center"> Registration form</h1><br>
            <div class="col-lg-8 m-auto d-block">
                <form onsubmit="return validation()"  class="bg-light" >
                    <div class="form-group">
                        <label>Name: </label>
                        <input type="text" name="txt_name" class="form-control" id="txt_name" autocomplete="off">
                        <span id="name" class="text-danger font-weight-bold" > </span>
                    </div>

                    <div class="form-group">
                        <label>Email: </label>
                        <input type="email" name="txt_mail" class="form-control" id="txt_mail" autocomplete="off">
                        <span id="emails" class="text-danger font-weight-bold" > </span>
                    </div>
                    
                    <div class="form-group">
                        <label>Mobile No: </label>
                        <input type="text" name="txt_mob" class="form-control" id="txt_mob" autocomplete="off">
                        <span id="mob" class="text-danger font-weight-bold" > </span>
                    </div>
                    
                    <%
                    List<BranchBean> list=DB.getBranch();  
                    request.setAttribute("list",list); %>
                 
                <p>Branch</p>
                <select name="branch">
                    <c:forEach items="${listgetBranch}" var="u">
                    <option value="${u.getId()}">${u.getBranch_name()}</option>
                    </c:forEach>
                </select><br>

                    <div class="form-group">
                        <label>Password: </label>
                        <input type="password" name="txt_pass" class="form-control" id="txt_pass" autocomplete="off">
                        <span id="pass" class="text-danger font-weight-bold" > </span>
                    </div>

                    <div class="form-group">
                        <label>Confirm Password: </label>
                        <input type="password" name="txt_cnf" class="form-control" id="txt_cnf" autocomplete="off">
                        <span id="cnfpass" class="text-danger font-weight-bold" > </span>
                    </div>

                    <input type="submit" name="s" value="Login" class="btn btn-success">
                </form>
            </div> 
        </div>
         <%
            try {
                String button = request.getParameter("s");
                if (button != null) {
                    String txt_name = request.getParameter("txt_name");
                    String txt_mail = request.getParameter("txt_mail");
                    String txt_mob = request.getParameter("txt_mob");
                    String branch = request.getParameter("branch");
                    String txt_pass = request.getParameter("txt_pass");
                    String txt_cnf = request.getParameter("txt_cnf");
                    DB db = new DB();

                    boolean b = db.isRegister(txt_name, txt_mail, txt_mob, branch, txt_pass, txt_cnf);
                    if (b) {
                        out.println("Registration success.......");
                        out.println("<a href='../JSP/user.jsp'>Login</a>");
                    } else {
                        out.println("Registration failed.......");
                    }
                }

            } catch (Exception e) {
                out.println("Error is" + e);
            }
        %>
        <script type="text/javascript">
              function validation(){
                  var txt_name=document.getElementById('txt_name').value;
                  var txt_mail=document.getElementById('txt_mail').value;
                  var txt_mob=document.getElementById('txt_mob').value;
                  var txt_pass=document.getElementById('txt_pass').value;
                  var txt_cnf=document.getElementById('txt_cnf').value;
                  
                  if(txt_name == "")
                  {
                      document.getElementById('name').innerHTML = "** Please fill the Name field";
                      return false;
                  }
                  if((txt_name.length <= 2) || (txt_name.length > 20))
                  {
                     document.getElementById('name').innerHTML = "** Name length must be from 2 to 20";
                      return false; 
                  }
//                  if(!isNaN(txt_name))
//                  {
//                      document.getElementById('name').innerHTML = "** only characters are allowed";
//                      return false; 
//                  }
//                  
                   if(txt_mail == "")
                  {
                      document.getElementById('emails').innerHTML = "** Please fill the Emailid field";
                      return false;
                  }
                  
                   if(txt_mob == "")
                   {
                      document.getElementById('mob').innerHTML = "** Please fill the Mobile field";
                      return false;
                  }
//                  if(isNaN(txt_mob))
//                  {
//                       document.getElementById('mob').innerHTML = "** only digits are allowed";
//                      return false;
//                  }
                  if(txt_mob.length != 10)
                  {
                     document.getElementById('mob').innerHTML = "** Enter 10 digits mobile number";
                      return false; 
                  }
                  
                   if(txt_pass == "")
                  {
                     document.getElementById('pass').innerHTML = "** Please fill the Password field";
                      return false;
                  }
//                   if((txt_pass.length <= 2)) || (txt_pass.length > 20))
//                  {
//                     document.getElementById('pass').innerHTML = "** Password length must be from 5 to 20";
//                      return false; 
//                  }
//                  
                    if(txt_cnf == "")
                  {
                      document.getElementById('cnfpass').innerHTML = "** Please fill the Confirm Password field";
                      return false;
                  }
                  
                    if(txt_pass != txt_cnf)
                  {
                       document.getElementById('pass').innerHTML = "** Password are not matching";
                      return false; 
                  }
              }
            </script>
           
    </body>
</html>
