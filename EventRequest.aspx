<%@ Page Title="" Language="C#" MasterPageFile="~/ClientMaster.Master" AutoEventWireup="true" CodeBehind="EventRequest.aspx.cs" Inherits="DJ_Connect.EventRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="form" class="container">

    <!-- User Input -->
    <div id="header" style="background:white">
        <h2 class="h2-stylez">Book an Event with </h2>
        <img id="headerLogo" src="img/SliceLogoBlack.png" alt="Slice Logo"/>
    </div>
    
    <div class="well well-sm card-stylez well-stylez">       
        <div class="row">
            
            <div class="col-md-10 col-md-offset-1">
                <div class="form-group">
                    <div id="feedback" class="row" style="padding-top: 30px; display:none" runat="server">
                        <div id="feedbackText" class="col-md-12" runat="server"></div>
                    </div>
                </div>

                <div class="inputs">
                <div class="form-group row has-feedback">   
                        <div class="col-md-6 col-sm-12">
                            <label for="firstname">Name</label> 
                            <asp:TextBox ID="FirstName"  name="firstname" type="text" placeholder="First Name" class="form-control input-md" runat="server"></asp:TextBox>   
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <label for="LastName"><br /></label> 
                            <asp:TextBox ID="LastName"  name="LastName" type="text" placeholder="Last Name" class="form-control input-md" runat="server"></asp:TextBox> 
                        </div>
                </div>
                
                <div class="form-group">
                   <label for="Email">Email</label> 
                    <asp:TextBox ID="Email"  name="email" type="email" placeholder="Email" class="form-control input-md" runat="server" ></asp:TextBox>   
                </div>
                    <%--<div class="form-group">
                    <label for="email">Testing</label> 
                    <input id="email2"  name="email" type="email" placeholder="TESTING" class="form-control input-md" />  
                    </div>--%>
                <div class="form-group">
                   <label for="Phone">Phone</label> 
                    <asp:TextBox ID="Phone"  name="phone" type="tel" placeholder="Phone" class="form-control input-md" runat="server"></asp:TextBox>   
                </div>
                <div class="form-group">
                   <label for="BookedDate">Date</label> 
                    <asp:TextBox ID="BookedDate"  name="BookedDate" type="date" placeholder="Date" class="form-control input-md" runat="server" ></asp:TextBox>   
                </div>
                <div class="form-group">
                   <label for="StartTime">Start:</label> 
                    <asp:TextBox ID="StartTime"  name="StartTime" type="time" placeholder="Start Time" class="form-control input-md" runat="server"></asp:TextBox>   
                </div>
                <div class="form-group">
                   <label for="EndTime">End:</label> 
                    <asp:TextBox ID="EndTime"  name="EndTime" type="time" placeholder="End Time" class="form-control input-md" runat="server"></asp:TextBox>   
                </div>
                <div class="form-group">
                   <label for="PartyType">Event</label> 
                    <asp:TextBox ID="EventType"  name="EventType" type="text" placeholder="Event" class="form-control input-md" runat="server"></asp:TextBox>   
                </div>
                <div class="form-group">
                   <label for="EventLocation">Event Location</label> 
                    <asp:TextBox ID="EventLocation"  onFocus="geolocate()" name="EventLocation" type="text" placeholder="Location" class="form-control input-md" runat="server"></asp:TextBox>   
                </div>
                <div class="form-group">
                   <label for="Comments">Additional Comments</label> 
                    <asp:TextBox ID="Comments"  name="Comments" type="text" placeholder="Comments" class="form-control input-md" runat="server" TextMode="MultiLine" style="max-width:100%"></asp:TextBox>   
                </div>
                </div>
                <asp:Button ID="btnEnter" class="btn-md btn-stylez" runat="server" Text="Submit" OnClick="btnEnter_Click"/>     
                <button id="clear" class="btn-stylez" style="margin-left: 10px">Clear</button>
            </div>      
        </div>
    </div>
</div>

    <script type="text/javascript">
        $(document).ready(function () {
            $("li").removeClass("active");
            $("#book").addClass("active");
            $("#header").hide().slideDown(1500);

            $("#clear").on('click', function () {
                $(".inputs input").val('');
                $("#ContentPlaceHolder1_feedback").css("display", "none");
                return false;
            });

            //Form validation
            $('#form1').validator();
        });
    </script>
</asp:Content>
