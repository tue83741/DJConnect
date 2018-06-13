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
                <div id="feedback" class="row" style="padding-top: 30px; display:none" runat="server">
                    <div id="feedbackText" class="col-md-12" runat="server"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a></div>
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
                <div class="form-group">
                   <label for="Phone">Phone</label> 
                    <asp:TextBox ID="Phone"  name="phone" type="tel" placeholder="Phone" class="form-control input-md" runat="server"></asp:TextBox>   
                </div>
                <div class="form-group">
                   <label for="BookedDate">Date</label> 
                    <asp:TextBox ID="BookedDate"  name="BookedDate" type="date" placeholder="Date" class="form-control input-md tryThis" runat="server" ></asp:TextBox>   
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

            <!-- Confirmation Modal -->
            <%--<div class="modal fade" id="confirmationModal" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header filter-header">
                            <h3 id="modalHeader" runat="server" class="modal-title modal-header-stylez">Confirm Booking Request</h3>
                            <button type="button" class="close modal-exit-btn-stylez" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal Body -->
                        <div class="modal-body">

                            <div class="form-group row">   
                                <div class="col-md-6 col-sm-12">
                                    <label for="firstNameConfirm">First</label> 
                                    <asp:TextBox ID="firstNameConfirm"  name="firstName" type="text" placeholder="First Name" class="form-control input-md" runat="server"></asp:TextBox>   
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <label for="lastNameConfirm">Last</label> 
                                    <asp:TextBox ID="lastNameConfirm"  name="lastName" type="text" placeholder="Last Name" class="form-control input-md" runat="server"></asp:TextBox> 
                                </div>
                            </div>

                            <div class="form-group">
                               <label for="emailConfirm">Event</label> 
                                <asp:TextBox ID="emailConfirm"  name="eventType" type="email" placeholder="Email" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="phoneConfirm">Event Location</label> 
                                <asp:TextBox ID="phoneConfirm" name="eventLocation" type="tel" placeholder="Phone" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="eventDateConfirm">Event Date</label> 
                                <asp:TextBox ID="eventDateConfirm" name="eventDate" type="date" placeholder="Date" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="eventStartConfirm">Price</label> 
                                <asp:TextBox ID="eventStartConfirm" name="eventPrice" type="text" placeholder="Start" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="eventEndConfirm">Price</label> 
                                <asp:TextBox ID="eventEndConfirm" name="eventPrice" type="text" placeholder="End" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="eventTypeConfirm">Price</label> 
                                <asp:TextBox ID="eventTypeConfirm" name="eventPrice" type="text" placeholder="End" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="eventLocationConfirm">Price</label> 
                                <asp:TextBox ID="eventLocationConfirm" name="eventPrice" type="text" placeholder="Location" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="commentsConfirm">Price</label> 
                                <asp:TextBox ID="commentsConfirm" name="eventPrice" type="text" placeholder="Comments" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div id="successAlert" runat="server" class="alert alert-success" style="display:none">
                                Your changes have been <strong>submitted!</strong>
                            </div>
                            <div id="dangerAlert" runat="server" class="alert alert-danger" style="display:none">
                                There was an <strong>error</strong> with your submission!
                            </div>
                        </div>

                        <!-- Modal Footer -->
                        <div class="modal-footer">
                            <button id="btnEditModalClose" runat="server" type="button" class="w3-btn modal-close-btn-stylez" data-dismiss="modal" onserverclick="btnEditModalClose_Click" >Close</button>
                            <asp:Button ID="btnSubmitEdit" class="w3-btn modal-submit-btn-stylez" runat="server" Text="Submit" OnClick="btnSubmitEdit_Click" />
                        </div>
                    </div>
                </div>
            </div>--%>
</div>

    <script type="text/javascript">
        $(document).ready(function () {
            $("li").removeClass("active");
            $("#book").addClass("active");
            $("#header").hide().slideDown(1500);

            //Set minimum date to current date
            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!
            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }

            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById("ContentPlaceHolder1_BookedDate").setAttribute("min", today);

            //Clear all input fields
            $("#clear").on('click', function () {
                $(".inputs input").val('');
                $("#ContentPlaceHolder1_feedback").css("display", "none");
                return false;
            });

            //Form validation
            $('#form1').validator();
        });

        //Disable input fields
        //function disableInputs() {
        //    $(".inputs input").attr("disabled", "disabled");
        //}
    </script>
</asp:Content>
