<%@page import="java.util.List"%>
<%@page import="pojo.BranchBean"%>
<%@page import="dao.DB"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="u" class="pojo.BranchBean"/>   
<jsp:setProperty property="*" name="u"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>login form design</title>
        <link rel="stylesheet" type="text/css" href="style1.css">
        <style>
            body{
                margin:0;
                padding:0;
                
                background:url(12.jpg);
                 height: 100%;
                background-size:cover;
                background-position:center;
                font-family:sans-serif;
            }

            .loginbox{
                width: 320px;
                height: 575px;
               background: rgba(0,0,0,0.5);
                color: #fff;
                top: 55%;
                left: 50%;
                position: absolute;
                transform: translate(-50%,-50%);
                box-sizing: border-box;
                padding:70px 30px;
            }

            .avtar{
                width: 100px;
                height: 100px;
                border-radius: 50%;
                position: absolute;
                top: -50px;
                left: calc(50% - 50px);
            }
            h1{
                margin: 0;
                padding:0 0 20px;
                text-align: center;
                font-size: 22px;
            }

            .loginbox p{
                margin: 0;
                padding: 0;
                font-weight: bold;
            }

            .loginbox input{
                margin-bottom: 20px;
                width: 100%;
            }

            .loginbox input[type="text"],input[type="password"]{
                border: none;
                border-bottom: 1px solid #fff;
                background: transparent;
                outline: none;
                height: 40px;
                color: #fff;
                font-size:16px;
            }

            .loginbox input[type="submit"]
            {
                border: none;
                border-radius: 20px;
                background: #fb2525;
                outline: none;
                height: 40px;
                color: #fff;
                font-size:18px;
            }

            .loginbox input[type="submit"]:hover
            {
                cursor: pointer;
                background: #ffc107;
                color: #000;
            }

            .loginbox a
            {
                text-decoration:none;
                font-size:12px;
                color: darkgrey;
                line-height:20px;
            }

            .loginbox a:hover
            {
                color: #ffc107;
            }

        </style>
    </head>
    <body>
        <div class="loginbox">
            <img src="avtar.png" class="avtar">
            <h1>Registration</h1>
            <form>
                <p>Name:</p>
                <input type="text" name="name" placeholder="Enter Name"><br>
                <p>Email:</p>
                <input type="text" name="email" placeholder="Enter EmailId"><br>
                 <%
                    List<BranchBean> list=DB.getBranch();  
                    request.setAttribute("list",list); %>
                 
                <p>Branch</p>
                <select name="Branch">
                    <c:forEach items="${list}" var="u">
                    <option value="${u.getId()}">${u.getBranch_name()}</option>
                    </c:forEach>
                </select><br>
                <p>Contact:</p>
                <input type="text" name="contatNo" placeholder="Enter Number"><br>
                <p>Password:</p>
                <input type="text" name="password" placeholder="Enter password"><br>
                <p>Confirm Password:</p>
                <input type="password" name="cpassword" placeholder="Confirm Password"><br>
                <input type="submit" name="s" value="Login">
            </form>   
        </div>
        <%
            try {
                String button = request.getParameter("s");
                if (button != null) {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String Branch = request.getParameter("Branch");
                    String contatNo = request.getParameter("contatNo");
                    String password = request.getParameter("password");
                    String cpassword = request.getParameter("cpassword");
                    DB db = new DB();

                    boolean b = db.isRegister(name, email, Branch, contatNo, password, cpassword);
                    if (b) {
                        out.println("Registration success.......");
                        out.println("<a href='user.jsp'>Login</a>");
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
                  var name=document.getElementById('name').value;
                  var email=document.getElementById('email').value;
                  var contatNo=document.getElementById('contatNo').value;
                  var password=document.getElementById('password').value;
                  var cpassword=document.getElementById('cpassword').value;
                  
                  if(name == "")
                  {
                      document.getElementById('name').innerHTML = "** Please fill the Name field";
                      return false;
                  }
                  if((name.length <= 2) || (name.length > 20))
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
                   if(email == "")
                  {
                      document.getElementById('emails').innerHTML = "** Please fill the Emailid field";
                      return false;
                  }
                  
                   if(contatNo == "")
                   {
                      document.getElementById('mob').innerHTML = "** Please fill the Mobile field";
                      return false;
                  }
 //               if(isNaN(contatNo))        
 //               {
 //                   document.getElementById('mob').innerHTML = "** only digits are allowed";
 //                return false;
 //                 }
                  if(contatNo.length != 10)
                  {
                     document.getElementById('mob').innerHTML = "** Enter 10 digits mobile number";
                      return false; 
                  }
                  
                   if(password == "")
                  {
                     document.getElementById('pass').innerHTML = "** Please fill the Password field";
                      return false;
                  }
                  
                    if((password.length <= 2)) || (password.length > 20))
                 {
                     document.getElementById('pass').innerHTML = "** Password length must be from 5 to 20";
                      return false; 
                  }
                  
                    if(cpassword == "")
                  {
                      document.getElementById('cnfpass').innerHTML = "** Please fill the Confirm Password field";
                      return false;
                  }
                  
                    if(password != cpassword)
                  {
                       document.getElementById('pass').innerHTML = "** Password are not matching";
                      return false; 
                  }
              }
            </script>
    <body>
</html>