
<%@page import="dao.DB"%>
<html>
    <head>
        <title>login form design</title>
        <link rel="stylesheet" type="text/css" href="style1.css">
        <style>
            body{
                margin:0;
                padding:0;
                
                background:url(5.jpg);
                 height: 100%;
                background-size:cover;
                background-position:center;
                font-family:sans-serif;
            }

            .loginbox{
                width: 320px;
                height: 575px;
                background: #000;
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
                <input type="text" name="txt_name" placeholder="Enter Name"><br>
                <p>Email:</p>
                <input type="text" name="txt_mail" placeholder="Enter EmailId"><br>
                <p>Contact:</p>
                <input type="text" name="txt_cno" placeholder="Enter Number"><br>
                <p>Username:</p>
                <input type="text" name="txt_uname" placeholder="Enter Username"><br>
                <p>Password:</p>
                <input type="password" name="txt_pass" placeholder="Enter Password"><br>
                <input type="submit" name="s" value="Login">
            </form>   
        </div>
        <%
            try {
                String button = request.getParameter("s");
                if (button != null) {
                    String txt_name = request.getParameter("txt_name");
                    String txt_mail = request.getParameter("txt_mail");
                    String txt_cno = request.getParameter("txt_cno");
                    String txt_uname = request.getParameter("txt_uname");
                    String txt_pass = request.getParameter("txt_pass");
                    DB db = new DB();

                    boolean b = db.isRegister(txt_name, txt_mail, txt_cno, txt_uname, txt_pass);
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
    <body>
</html>