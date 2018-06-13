<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="DJ_Connect.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="well well-sm card-stylez well-stylez slide-it" style="padding: 50px; padding-top: 20px; overflow: auto">
            <div style="float:left; position: relative; padding-top: 5px; padding-right: 20px; width: 640px">
                <h1>About</h1>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore 
                    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore 
                    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore 
                    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore 
                    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </p>
            </div>

            <div style="float:right; position: relative; padding-top: 5px; padding-right: 20px">
                <img src="img/SliceLogo.jpg" alt="Slice Logo" style="margin-top: 35px; height:250px; width:350px; display:inline; border: 2px solid black; box-shadow: 0 2px 12px 0 lightgray, 0 -4px 18px 0 rgba(0,0,0,0.19)"/>
                <%--<h3 style="border-bottom: 1px dashed lightgrey; padding-bottom: 15px;">Featured Mix</h3>
                <iframe width="350px" height="200" src="https://www.mixcloud.com/widget/iframe/?light=1&feed=%2FtheLastSlice%2Fs-l-i-c-e-hip-hop-medley%2F" frameborder="0" style="border-bottom: 1px dashed lightgrey; padding-bottom: 15px;"></iframe>--%>
            </div>
        </div>

        
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("li").removeClass("active");
            $("#contact").addClass("active");
            $(".slide-it").hide().slideDown(1500);
        });
    </script>
</asp:Content>
