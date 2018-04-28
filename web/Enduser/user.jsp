<html>
<head>
<title>User Login</title>
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
		height: 420px;
		background: rgba(0,0,0,0.5);
		color: #fff;
		top: 50%;
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
             <h1>User Login</h1>
                <form action="Suc_Login.jsp" method="Get">
                       <p>Username:</p>
                       <input type="text" name="username" placeholder="Enter Username"><br>
			<p>Password:</p>
                       <input type="password" name="password" placeholder="Enter Password"><br>
			<input type="submit" name="" value="Login">
			<a href="registration.jsp">Register Here</a>
                </form>   
        </div>
<body>
</html>