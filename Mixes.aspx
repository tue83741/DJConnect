<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.Master" AutoEventWireup="true" CodeBehind="Mixes.aspx.cs" Inherits="DJ_Connect.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">
<div class="well well-sm card-stylez well-stylez slide-it" style="overflow:auto">  
    <!-- Left-side Content --> 
    <div class="left-side-stylez" style="float:left; position:relative; padding-left: 40px; padding-bottom: 40px">  
         <!-- YouTube Content -->
         <div class="row">
            <h2 class="mix-header-stylez">
                <a href="https://YouTube.com" target="_blank">
                    <img src="img/YouTubeHeaderLogo.png" alt="YouTube Logo" style="width: 200px; height: 35px" />
                </a>
            </h2>
            <div class="col-sm-12">
                <h3 class="mix-title-stylez" style="font-weight: 600;">Reggae Vibes<i class="em em-desert_island"></i></h3>
                <iframe class="youtube-video-stylez" width="100%" height="480" src="https://www.youtube.com/embed/lRfOmZK5Y1o" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            </div>

            <%--<div class="col-sm-12">
                <h3>4th of July '17 Mix</h3>
                <iframe width="100%" height="480" src="https://www.youtube.com/embed/5HahgSLU3u0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            </div>--%>
        </div>

        <!-- Mixcloud Content -->
        <div class="row">
            <h2 class="mix-header-stylez" style="padding-bottom: 10px;">
                <a href="https://Mixcloud.com" target="_blank">
                    <img src="img/MixcloudHeaderLogo.png" alt="Mixcloud Logo" style="width: 200px" />
                </a>
            </h2>
            <div class="col-sm-12">
                <h3 class="mix-title-stylez" style="font-weight: 600;">Reggae Vibes<i class="em em-desert_island"></i></h3>
                <iframe width="100%" height="120" src="https://www.mixcloud.com/widget/iframe/?hide_cover=1&light=1&feed=%2FtheLastSlice%2Fs-l-i-c-e-raggae-vibes-original-mix%2F" frameborder="0" ></iframe>
            </div>

            <div class="col-sm-12">
                <h3 class="mix-title-stylez" style="font-weight: 600;">Hip-Hop Medley <i class="em em-100" style="margin-left: 5px"></i></h3>
                <iframe width="100%" height="120" src="https://www.mixcloud.com/widget/iframe/?hide_cover=1&feed=%2FtheLastSlice%2Fs-l-i-c-e-hip-hop-medley%2F" frameborder="0" ></iframe>
            </div>
        </div>
    </div>

    <!-- Right-side Content -->
    <div class="featured-mix-stylez" style="float:right; position: relative; padding-top: 5px; padding-right: 20px">
        <h3 style="border-top: 1px dashed black; padding-top: 15px;">Featured Mix</h3>
        <iframe width="350px" height="200" src="https://www.mixcloud.com/widget/iframe/?light=1&feed=%2FtheLastSlice%2Fs-l-i-c-e-hip-hop-medley%2F" frameborder="0" style="border-bottom: 1px dashed black; padding-bottom: 15px;"></iframe>
    </div>

    <div class="twitter-widget-stylez" style="float:right; position:relative; padding-top: 20px; padding-right: 20px">
        <%--<div class="well" style="box-shadow: 0 4px 4px -3px #a2d6a2;">--%>
            <%--<a class="twitter-timeline" data-width="300" data-height="400" href="https://twitter.com/TwitterDev">Tweets by TwitterDev</a>--%> 
            <a class="twitter-timeline" data-height="660" data-link-color="#a2d6a2"  href="https://twitter.com/TwitterMusic?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor">Tweets by Slice</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
        <%--</div>--%>
   </div>  
   </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $("li").removeClass("active");
        $("#mixes").addClass("active");
        $(".slide-it").hide().slideDown(1500);
    });
</script>
</asp:Content>
