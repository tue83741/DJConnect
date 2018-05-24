<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.Master" AutoEventWireup="true" CodeBehind="ClientLandingPage.aspx.cs" Inherits="DJ_Connect.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="jumbotron slide-it" style="padding:0; background: none; border-radius:0">
            <img src="img/SliceBanner.jpg" alt="Slice Logo" style="height:500px; width:100%"/>
            <footer id="footer" class="footerStylez" style="position:static">
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

    <script type="text/javascript">
        $(document).ready(function () {
            $("li").removeClass("active");
            $("#home").addClass("active");
            $(".slide-it").hide().slideDown(1500);
        });
    </script>
</asp:Content>

