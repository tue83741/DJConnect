<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Oops.aspx.cs" Inherits="DJ_Connect.ErrorPages.Oops" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>An Error Has Occurred</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- w3css -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"/>

    <!-- Bootstrap - Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- Custom CSS -->
    <link href="../CSS/MainStyles.css" rel="stylesheet" />
    <link href="../CSS/Stylez.css" rel="stylesheet" />

    <!-- Filters -->
    <script src="Scripts/stay-alive.js"></script>

    <!-- jQuery Validate -->
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
    <script src="../Scripts/validate.js"></script>
<style>         
    /*body{margin:75px 100px 50px;background-color:white}*/
    a{color:#a2d6a2}
    a:hover{color:#899197}
    h6{font-weight:bold;color:#899197;margin-top:20px;margin-bottom:10px}
    .text-ginormous{font-size:100px;color:#a41e35}
</style>
</head>

<body background="../img/blk.jpg">
    <div class="container">
        <div class="jumbotron jumbo-stylez" style="padding:0; background: none">
            <div class="container" style="margin-bottom: 25px">
                
                <blockquote class="blockquote " style="border-left:none; padding-top:20px; color:white; margin-bottom:0px">
                    <img src="../img/SliceLogo_Transparent.png" alt="Slice Logo" style="height:75px; width:150px; display:inline; float: left"/>
                    <p class="mb-0 text-right" style="display: inline; float: right; padding-top: 15px">“One good thing about music, when it hits you, you feel no pain.”<br /> - Bob Marley</p>
                </blockquote>
            </div>
            <div class="container">
                <img id="viynl" src="../img/vinylpicgreen.png" alt="vinylpic" style="height:75px; width:200px; float:right"/>
            </div>
            <nav class="navbar navbar-inverse card-stylez" style="margin-bottom:0; font-family:'Comic Sans MS'">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span> 
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar" style="font-family:'Comic Sans MS'">
                        <ul class="nav navbar-nav">
                            <li id="home" class="active"><a href="ClientLandingPage.aspx">Home</a></li>
                            <li id="eventRecords"><a href="EventRecords.aspx">Event Records</a></li>
                            <li id="book"><a href="EventRequest.aspx">Booking</a></li> 
                            <li id="mixes"><a href="#">Mixes</a></li>
                            <li id="contact"><a href="#">Contact</a></li> 
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <a href="https://Facebook.com/ThisIsDjSlice"><img src="../img/FBIcon.png" class="imgStyle"/></a>
                            <a href="https://Facebook.com/ThisIsDjSlice"><img src="../img/InstaIcon.png" class="imgStyle"/></a>
                            <a href="https://Facebook.com/ThisIsDjSlice"><img src="../img/TwitterIcon.png" class="imgStyle"/></a>
                            <a href="https://www.youtube.com/watch?v=lRfOmZK5Y1o"><img src="../img/YouTubeIcon.png" class="imgStyle"/></a>
                        </ul>
                    </div>
                </div>
                </nav>
            </div>
        </div>

         <div class="container">
            <div class="jumbotron slide-it" style="padding:0; background: none; border-radius:0">
                <div style="background: white; height: 500px; width: 100%;">
                    <div class="container row" style="padding-top: 75px;">
                        <div class="col-sm-offset-2 col-sm-4 col-xs-12">
                        <h1 class="text-jumbo text-ginormous">Oops!</h1>
                        <h2>Something went wrong.</h2>
                        <h6>An unexpected error has occurred.</h6>
                        <ul class="list-unstyled">
                            <li>You can either:</li>
                            <a  runat="server" onclick="homeClick">Return to the home page</a>
                            <li><a href="../LoginPage.aspx">Go to the login page</a></li>
                        </ul>
                        </div>
                        <div class="col-sm-6 col-xs-12 text-center">
                            <img src="https://media1.tenor.com/images/6d9353352b9e9e11aa4239c4660385a6/tenor.gif?itemid=4034476" alt="Kitty Mix" style="border-radius: 5px; margin-top: 50px; max-width: 100%; max-height: 100%"/>
                        </div>
                        </div>
                </div>
                <footer id="footer1" class="footerStylez" style="position:static">
                    <div class="footer">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <p style="font-size: 10px">Copyright © 2016 S l i c e. All Rights Reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
</body>
</html>
