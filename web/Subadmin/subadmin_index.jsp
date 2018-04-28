<%@page import="pojo.AddNewWaiterBean"%>
<%@page import="pojo.AddNewCookBean"%>
<%@page import="pojo.AddNewManagerBean"%>
<%@page import="pojo.AddNewSubadminBean"%>
<%@page import="java.util.List"%>
<%@page import="pojo.BranchBean"%>
<%@page import="dao.DB"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="u" class="pojo.BranchBean"/>   
<jsp:setProperty property="*" name="u"/>

<%String email = (String) session.getAttribute("email");
    out.println(email);
    List<AddNewSubadminBean> list = DB.getSubadminByEmail(email);
    request.setAttribute("list", list);
%>



<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Bootstrap Admin Theme</title>

        <!-- Bootstrap Core CSS -->
        <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <!--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>-->
                    <a class="navbar-brand" href="index.html">SB Admin v2.0</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">



                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                            </li>
                            <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="subadmin.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                        <!-- /.dropdown-user -->
                    </li>
                    <!-- /.dropdown -->
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li class="sidebar-search">
                                <div class="input-group custom-search-form">
                                    <input type="text" class="form-control" placeholder="Search...">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <!-- /input-group -->
                            </li>			
                            <li>
                                <a href="subadmin_index.jsp"><i class="fa fa-university fa-fw"></i>DashBoard</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-users fa-fw"></i>Subadmin<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="sub_manager.jsp">Manager</a>
                                    </li>
                                    <li>
                                        <a href="sub_cook.jsp">Cook</a>
                                    </li>
                                    <li>
                                        <a href="sub_waiter.jsp">Waiter</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="subadmin_panels-wells.html"><i class="fa fa-envelope fa-fw"></i>User Feedback</a>
                            </li>

                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">DashBoard</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <c:forEach items="${list}" var="u">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Branch Information
                                </div>
                                <div class="panel-body">
                                    <form role="form">
                                        <div class="row">
                                            <div class="col-lg-6">

                                                <div class="form-group">
                                                    <label>Subadmin id :</label>
                                                    <p class="form-control-static">${u.getId()}</p>
                                                </div>
                                                <div class="form-group">
                                                    <label>Subadmin Name:</label>
                                                    <p class="form-control-static">${u.getName()}</p>
                                                </div>
                                                <div class="form-group">
                                                    <label>Address :</label>
                                                    <p class="form-control-static">${u.getContact()}</p>

                                                </div>
                                                <c:set var="testjs" value="${u.getBranch_id()}"/>
                                                <%
                                                    String s = pageContext.getAttribute("testjs").toString();
                                                    session.setAttribute("id",s); 
                                                    System.out.println("tables=" + s);
                                                    List<AddNewManagerBean> list1 = DB.getManagerById(s);
                                                    request.setAttribute("list1", list1);
                                                %>

                                                <div class="form-group">
                                                    <label>Managers:<%int i=0;%><c:forEach items="${list1}" var="q"><%i++;%></c:forEach><%out.println(i);%></label>
                                                </div>

                                                <%
                                                    System.out.println("tables=" + s);
                                                    List<AddNewCookBean> list2 = DB.getCookById(s);
                                                    request.setAttribute("list2", list2);
                                                %>

                                                <div class="form-group">
                                                    <label>Cook:<%int i1=0;%><c:forEach items="${list2}" var="q"><%i1++;%></c:forEach><%out.println(i1);%></label>
                                                </div>
                                                
                                                <%
                                                    System.out.println("tables=" + s);
                                                    List<AddNewWaiterBean> list3 = DB.getWaiterById(s);
                                                    request.setAttribute("list3", list3);
                                                %>

                                                <div class="form-group">
                                                    <label>Waiters:<%int i2=0;%><c:forEach items="${list3}" var="q"><%i2++;%></c:forEach><%out.println(i2);%></label>
                                                </div>
                                                
                                                
                                                
                                            </div>

                                        </div>

                                    </form>
                                    <!-- /.col-lg-6 (nested) -->

                                    <!-- /.col-lg-6 (nested) -->
                                </div>
                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                   
                </div>

            </c:forEach>
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->


    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
