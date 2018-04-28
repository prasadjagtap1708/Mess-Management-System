<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<%@page import="pojo.*"%>
<%@page import="dao.DB"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="u" class="pojo.UserPojo"/>   
<jsp:setProperty property="*" name="u"/>
<!doctype html>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->

<%String username = (String) session.getAttribute("username");
    out.println(username);
    List<UserPojo> list = DB.getUserByEmail(username);
    request.setAttribute("list", list);
%>


<html lang="en-gb" class="no-js">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!--[if lt IE 9]> 
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
        <title>Neu Profile - Single page website</title>
        <meta name="description" content="">
        <meta name="author" content="WebThemez">
        <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <!--[if lte IE 8]>
        <script type="text/javascript" src="http://explorercanvas.googlecode.com/svn/trunk/excanvas.js"></script>
        <![endif]-->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/isotope.css" media="screen" />
        <link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />
        <link rel="stylesheet" type="text/css" href="css/da-slider.css" />
        <!-- Owl Carousel Assets -->
        <link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css" />
        <!-- Font Awesome -->
        <link href="font/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>


    <body>
        
        <c:forEach items="${list}" var="u">            <p>${u.getrId()}</p>

        <header class="header">
            <div class="container">
                <nav class="navbar navbar-inverse" role="navigation">
                    <div class="navbar-header">
                        <button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a href="#" class="navbar-brand scroll-top logo"><b>Hii Jyo</b></a>
                    </div>
                    <!--/.navbar-header-->
                    <div id="main-nav" class="collapse navbar-collapse">
                        <ul class="nav navbar-nav" id="mainNav">
                            <li class="active"><a href="#home" class="scroll-link">Home</a></li>
                            <li><a href="#aboutUs" class="scroll-link">About Us</a></li>
                            <li><a href="#skills" class="scroll-link">Our Menu</a></li>
                            <li><a href="#Gallery" class="scroll-link">Gallery</a></li>
                        </ul>
                    </div>
                    <!--/.navbar-collapse-->
                </nav>
                <!--/.navbar-->
            </div>
            <!--/.container-->
        </header>
        <!--/.header-->
        <div id="#top"></div>
        <section id="home">
            <div class="banner-container">
                <img src="images/img-00a.jpg" alt="banner" />
                <div class="container banner-content">
                    <div id="da-slider" class="da-slider">
                        <div class="da-slide">
                            <h2>ANNAPURNA</h2>
                            <p>"Your diet is a bank account.Good food choices are good investments."</p>
                            <div class="da-img"></div>
                        </div>
                        <div class="da-slide">
                            <h2>ANNAPURNA</h2>
                            <p>"The secret of success in life is to eat what you like."</p>
                            <div class="da-img"></div>
                        </div>
                        <div class="da-slide">
                            <h2>ANNAPURNA</h2>
                            <p>"If you don’t lick your fingers, enjoy only half"</p>
                            <div class="da-img"></div>
                        </div>
                        <div class="da-slide">
                            <h2>ANNAPURNA</h2>
                            <p>"Food is symbolic of love when words are inadequate."</p>
                            <div class="da-img"></div>
                        </div>
                        <!--  <nav class="da-arrows">
                        <span class="da-arrows-prev"></span>
                        <span class="da-arrows-next"></span>
                        </nav> -->
                    </div>
                </div>
            </div>
        </section>
        <section id="introText">
            <div class="container">
                <div class="text-center">
                    <h1>ANNAPURNA</h1>
                    <p>Where taste meets the myth.</p>
                    <p>Deliciousness jumping into the mouth.</p>
                </div>
            </div>

        </section>
        <!--About-->
        <section id="aboutUs" class="secPad">
            <div class="container">
                <div class="heading text-center">
                    <!-- Heading -->
                    <h2>About Us</h2>
                    <p>Mess Management System is designed for better interaction between Management and Members. Mess Management System handles all the requirements for easy Mess Management.
                        This WebPage will help the Mess Center to structuralize the activities and maintain data transparecy where needed and properly store data for regular operations and future analysis.</p>
                </div>
            </div>
        </section>

        <!--Quote-->
        <section id="quote" class="bg-parlex">
            <div class="parlex-back">
                <div class="container secPad text-center">
                    <h2>“Pull up a chair. Take a taste. Come join us."</h2>
                    <h3>"Life is so endlessly delicious.”</h3>
                </div>
                <!--/.container-->
            </div>
        </section>

        <!--Skills-->
        <section id="skills" class="secPad white">
            <div class="container">
                <div class="heading text-center">
                    <!-- Heading -->
                    <h2>OUR MENU</h2>
                    <p>Select your menu.... Choice is Yours!!!!!</p>
                    <h2>BreakFast</h2>
                    <form action="Disp_Bkfast.jsp" >
                        <select name="breakfast">
                            <option value= "-1" >Select type</option>
                            <%
                                try {
                                    String Query = "select * from breakfast";
                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
                                    Statement stm = conn.createStatement();
                                    ResultSet rs = stm.executeQuery(Query);
                                    while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("B_type")%>"><%=rs.getString("B_type")%></option>
                            <%
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    out.println("Error" + ex.getMessage());
                                }
                            %>
                        </select>
                        <br><br>
                        <input type="text" value="${u.getrId()}" name="id">
                        <input type="submit"  value="Submit">
                    </form>
                    <br>
                    <br>			
                    <h2>Lunch</h2>
                    <br>
                    <form action="Disp_Lunch.jsp">
                        <div class="row">
                            <div class="col-sm-4">Roti

                                <select name="lunch_roti">
                                    <option value= "-1" >Select type</option>
                                    <%
                                        try {
                                            String Query = "select * from lroti";
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
                                            Statement stm = conn.createStatement();
                                            ResultSet rs = stm.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("LR_type")%>"><%=rs.getString("LR_type")%></option>
                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                            out.println("Error" + ex.getMessage());
                                        }
                                    %>
                                </select>
                            </div>			

                            <div class="col-sm-4" >Sabji	
                                <select name="lunch_sabji">
                                    <option value= "-1" >Select type</option>
                                    <%
                                        try {
                                            String Query = "select * from lsabji";
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
                                            Statement stm = conn.createStatement();
                                            ResultSet rs = stm.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("LS_type")%>"><%=rs.getString("LS_type")%></option>
                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                            out.println("Error" + ex.getMessage());
                                        }
                                    %>
                                </select>
                            </div>				

                            <div class="col-sm-4">Rice			
                                <select name="lunch_rice">
                                    <option value= "-1" >Select type</option>
                                    <%
                                        try {
                                            String Query = "select * from lrice";
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
                                            Statement stm = conn.createStatement();
                                            ResultSet rs = stm.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("LRi_type")%>"><%=rs.getString("LRi_type")%></option>
                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                            out.println("Error" + ex.getMessage());
                                        }
                                    %>
                                </select>
                            </div>	
                        </div>
                              <br><br>
                        <input type="text" value="${u.getrId()}" name="id">
                       <input type="submit"  value="Submit">
                      </form>          
                        <br>
                        <br>	

                        <h2>Dinner</h2>
                        <br>
                        <form action="Disp_Dinner.jsp">
                        <div class="row">
                            <div class="col-sm-3">Roti
                                <select name="dinner_roti">
                                    <option value= "-1" >Select type</option>
                                    <%
                                        try {
                                            String Query = "select * from droti";
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
                                            Statement stm = conn.createStatement();
                                            ResultSet rs = stm.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("DR_type")%>"><%=rs.getString("DR_type")%></option>
                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                            out.println("Error" + ex.getMessage());
                                        }
                                    %>
                                </select>
                            </div>			

                            <div class="col-sm-3" >Sabji	
                                <select name="dinner_sabji">
                                    <option value= "-1" >Select type</option>
                                    <%
                                        try {
                                            String Query = "select * from dsabji";
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
                                            Statement stm = conn.createStatement();
                                            ResultSet rs = stm.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("DS_type")%>"><%=rs.getString("DS_type")%></option>
                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                            out.println("Error" + ex.getMessage());
                                        }
                                    %>
                                </select>
                            </div>				

                            <div class="col-sm-3">Rice			
                                <select name="dinner_rice">
                                    <option value= "-1" >Select type</option>
                                    <%
                                        try {
                                            String Query = "select * from drice";
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
                                            Statement stm = conn.createStatement();
                                            ResultSet rs = stm.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("DRi_type")%>"><%=rs.getString("DRi_type")%></option>
                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                            out.println("Error" + ex.getMessage());
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="col-sm-3">Desert			
                                <select name="dinner_desert">
                                    <option value= "-1" >Select type</option>
                                    <%
                                        try {
                                            String Query = "select * from desert";
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root", "");
                                            Statement stm = conn.createStatement();
                                            ResultSet rs = stm.executeQuery(Query);
                                            while (rs.next()) {
                                    %>
                                    <option value="<%=rs.getString("Dd_type")%>"><%=rs.getString("Dd_type")%></option>
                                    <%
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                            out.println("Error" + ex.getMessage());
                                        }
                                    %>
                                </select>
                            </div>		
                        </div>
                       <br><br>
                        <input type="text" value="${u.getrId()}" name="id">
                       <input type="submit"  value="Submit">
                      </form>       
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <h2> <strong>Todays menu</strong></h2>

                    </div>

                </div>
            </div>        
        </section>

        <!--services-->
        <section id="pricingtop" class="pricingtop">
            <div class="overlay">
                <div class="container">
                    <div class="main_pricingtop"></div>
                </div> 
            </div>
        </section> 


        <!--Gallery---->
        <section id="Gallery" class="page-section section appear clearfix secPad">
            <div class="container">

                <div class="heading text-center">
                    <!-- Heading -->
                    <h2>Gallery</h2>
                    <p>“The main aim of the mess is to provide clean and fresh food to the employees of the organization.</p>
                    <p>Thus, there  arises  a  need  to  create entire  Mess Management an automated system."</p>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="portfolio-items isotopeWrapper clearfix" id="3">
                                <article class="col-sm-4 isotopeItem webdesign">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img1.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img1.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="col-sm-4 isotopeItem photography">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img2.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img2.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="col-sm-4 isotopeItem photography">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img3.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img3.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="col-sm-4 isotopeItem print">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img4.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img4.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="col-sm-4 isotopeItem photography">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img5.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img5.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="col-sm-4 isotopeItem webdesign">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img6.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img6.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                <article class="col-sm-4 isotopeItem print">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img7.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img7.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>

                                <article class="col-sm-4 isotopeItem photography">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img8.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img8.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>

                                <article class="col-sm-4 isotopeItem print">
                                    <div class="portfolio-item">
                                        <img src="images/portfolio/img9.jpg" alt="" />
                                        <div class="portfolio-desc align-center">
                                            <div class="folio-info">
                                                <a href="images/portfolio/img9.jpg" class="fancybox">
                                                    <h5></h5>
                                                    <i class="fa fa-arrows-alt fa-2x"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>

                        </div>


                    </div>
                </div>

            </div>
        </section>


        <!--/.page-section-->

        <a href="#top" class="topHome"><i class="fa fa-chevron-up fa-2x"></i></a>

        <!--[if lte IE 8]><script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script><![endif]-->
        <script src="js/modernizr-latest.js"></script>
        <script src="js/jquery-1.8.2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery.isotope.min.js" type="text/javascript"></script>
        <script src="js/fancybox/jquery.fancybox.pack.js" type="text/javascript"></script>
        <script src="js/jquery.nav.js" type="text/javascript"></script>
        <script src="js/jquery.cslider.js" type="text/javascript"></script>
        <script src="js/custom.js" type="text/javascript"></script>
        <script src="js/owl-carousel/owl.carousel.js"></script>
        </c:forEach>
    </body>
</html>
