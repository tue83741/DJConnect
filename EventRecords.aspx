<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EventRecords.aspx.cs" Inherits="DJ_Connect.WebForm1" %> 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Fields to hold the state of filter panels across postbacks -->
    <asp:HiddenField ID="rulesState" runat="server"/>
    <asp:HiddenField ID="eventPriceState" runat="server"/>
    
    <div class="container">
        <div id="mainContent" class="main-content">
            <div class="row">

            <!-- Filter Panel -->
            <div id="filter" runat="server" class="col-md-3 col-sm-12 filter-sm filter-md">
            <div class="" id="searchPanel" runat="server">
            <!-- Panel Header -->
            <h4 class="filter-header">Narrow Results By:</h4>

            <div class="panel-body" style="border: none; overflow-x: auto">

                <asp:Button ID="btnResetAllFilters" runat="server" Text="Reset All" CssClass="btn btn-block resetButton btn-filter-reset-all-stylez" OnClick="ResetAllFilters_Click"/>

                <!-- Event Types -->
                <div class="filter-body-stylez">
                    <button id="btnCollapseEventTypeFilter" type="button" class="btn btn-block filter-collapse icon-chevron-down rulesClick btn-toggle" data-toggle="collapse" data-target="#eventTypes" style="margin-top: 20px; margin-bottom: 15px; background-color: transparent; padding-left:0px; padding-right:0px;">
                        <h4 class="content-filter-header-stylez" style="display: inline; padding: 0px; padding-left: 10px; float: left;">Event Type</h4>
                        <span id="upBtn" class="glyphicon glyphicon-chevron-down filter-arrow" style="float:right; padding-top: 10px;"></span>
                    </button>
                    <div id="eventTypes" class="collapse filter-content">
                        <asp:ListBox ID="lstEventTypes" runat="server" SelectionMode="Multiple" CssClass="listBoxFilters form-control" style="height:145px"></asp:ListBox>
                        <div class="filter-footer-stylez">
                            <button id="Button1" type="button" class="btn btn-default btn-circle filter-btn" runat="server" onserverclick="FilterClick"><span class="glyphicon glyphicon-ok"></span></button>
                            <button id="Button2" type="button" runat="server" class="btn btn-default btn-circle filter-btn" style="float: right" onserverclick="ResetFilter_Click"><span class="glyphicon glyphicon-remove"></span></button>
                        </div>
                    </div>
                </div>

                <!-- Event Price -->
                <div class="filter-body-stylez">
                    <button id="btnEventPriceFilterToggle" type="button" class="btn btn-block filter-collapse icon-chevron-down event-price-filter-click btn-toggle" data-toggle="collapse" data-target="#eventPriceFilter" style="margin-top: 20px; margin-bottom: 15px; background-color: transparent; padding-left:0px; padding-right:0px;">
                        <h4 class="content-filter-header-stylez" style="display: inline; padding: 0px; padding-left: 10px; float: left;">Event Price</h4>
                        <span class="glyphicon glyphicon-chevron-down filter-arrow" style="float:right; padding-top: 10px;"></span></button>
                    <div id="eventPriceFilter" class="collapse filter-content">
                        <asp:TextBox ID="txtEventPriceFromFilter" class="form-control" placeholder="$" runat="server"></asp:TextBox>
                        <label>to</label>
                        <asp:TextBox ID="txtEventPriceToFilter" class="form-control" placeholder="$" runat="server"></asp:TextBox>
                        <div class="filter-footer-stylez">
                            <button id="btnEventPriceFilter" type="button" class="btn btn-default btn-circle filter-btn" runat="server" onserverclick="FilterClick" ><span class="glyphicon glyphicon-ok"></span></button>
                            <button id="btnEventPriceFilterReset" type="button" runat="server" class="btn btn-default btn-circle filter-btn" style="float: right" onserverclick="ResetEventPriceFilter_Click" ><span class="glyphicon glyphicon-remove"></span></button>
                        </div>
                    </div>
                </div>
            </div>
                <button id="Button3" class="btn btn-add-event-stylez" runat="server" onserverclick="addEventRecord_Click"><span class="glyphicon glyphicon-plus"></span></button>
            </div>
            </div>

            <!-- Table Panel -->

            <div class="col-md-9 col-sm-12 panel panel-default card-stylez-2" style="border-top-left-radius:0px; border-top-right-radius: 0px; padding-left: 0px; padding-right: 0px">
                <h4 class="filter-header">Event Records:</h4>
                <div class="panel-body panel-body-stylez">

                    <!-- Entries & Search -->
                    <div class="row" style="padding-bottom: 10px">
                                <div class="col-sm-4" id="ShowEntriesDropdown">
                                    <div id="dataTables-example_length">
                                        <label style="display:inline-flex">
                                            Show
                                        <asp:DropDownList runat="server" AutoPostBack="true" ID="ddlSelectPageSize" CssClass="form-control input-sm ddlSelectPageSize">
                                            <asp:ListItem Value="10">10</asp:ListItem>
                                            <asp:ListItem Value="25">25</asp:ListItem>
                                            <asp:ListItem Value="50">50</asp:ListItem>
                                            <asp:ListItem Value="100">100</asp:ListItem>
                                            <asp:ListItem Value="All">See All</asp:ListItem>
                                        </asp:DropDownList>
                                            entries
                                        </label>
                                    </div>
                                </div>

                                <div class="col-sm-4 searchBarCont searchbar-stylez">
                                    <div id="custom-search-input">
                                        <div class="input-group">
                                            <input type="text" id="txtSearch" runat="server" class="form-control input-sm txtSearch" placeholder="Search" />
                                            <span class="input-group-btn">
                                                <button class="btn btn-search-stylez" runat="server" id="btnSearch" type="submit" onserverclick="btnSearchClick">
                                                    <i class="glyphicon glyphicon-search"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                    <!-- Gridview -->
                    <div class="table-responsive">
                    <asp:GridView ID="gvEventRecords" PagerStyle-CssClass="pagination" runat="server" AllowSorting="True" OnSorting="gvEventRecords_Sorting" AutoGenerateColumns="False" DataKeyNames="eventRecordID" AllowPaging="True" CssClass="table table-striped table-bordered table-hover dataTable no-footer" style="overflow-x:auto" OnRowCommand="gvEventRecords_RowCommand" OnSelectedIndexChanged="gvEventRecords_SelectedIndexChanged" OnRowDataBound="gvEventRecords_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="firstName" HeaderText="First" SortExpression="firstName" />
                        <asp:BoundField DataField="lastName" HeaderText="Last" SortExpression="lastName" />
                        <asp:BoundField DataField="eventType" HeaderText="Type" SortExpression="eventType" />
                        <asp:BoundField DataField="eventLocation" HeaderText="Location" SortExpression="eventLocation" />
                        <asp:BoundField DataField="eventDate" HeaderText="Date" SortExpression="eventDate" />
                        <asp:BoundField DataField="eventPrice" HeaderText="Price" SortExpression="eventPrice" DataFormatString="{0:c}" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                 <asp:ImageButton CommandName="selectRecord" CssClass="btn btn-sm" ID="btnEditEventRecord" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ImageUrl="Img/EditIcon.png"  style="padding:0px; width:28px; height:28px;"/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:ImageButton CommandName="deleteRecord" CssClass="btn btn-sm" ID="btnDeleteEventRecord" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" ImageUrl="Img/DeleteIcon.png" style="padding:0px; width:28px; height:28px;" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="eventRecordID" HeaderText="ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" >
                            <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                            <ItemStyle CssClass="hiddencol"></ItemStyle>
                        </asp:BoundField>
                    </Columns>
                    <PagerStyle CssClass="pagination"></PagerStyle>
                    </asp:GridView>
                        </div>
                </div>
            </div>
        </div>

            <!-- Edit Modal -->
            <div class="modal fade" id="editModal" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header filter-header">
                            <h3 id="modalHeader" runat="server" class="modal-title modal-header-stylez">Edit Event</h3>
                            <button type="button" class="close modal-exit-btn-stylez" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal Body -->
                        <div class="modal-body">

                            <div class="form-group row">   
                                <div class="col-md-6 col-sm-12">
                                    <label for="firstName">First</label> 
                                    <asp:TextBox ID="firstName"  name="firstName" type="text" placeholder="First Name" class="form-control input-md" runat="server"></asp:TextBox>   
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <label for="lastName">Last</label> 
                                    <asp:TextBox ID="lastName"  name="lastName" type="text" placeholder="Last Name" class="form-control input-md" runat="server"></asp:TextBox> 
                                </div>
                            </div>

                            <div class="form-group">
                               <label for="eventType">Event</label> 
                                <asp:TextBox ID="eventType"  name="eventType" type="text" placeholder="Event" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="eventLocation">Event Location</label> 
                                <asp:TextBox ID="eventLocation" name="eventLocation" type="text" placeholder="Location" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="eventDate">Event Date</label> 
                                <asp:TextBox ID="eventDate" name="eventDate" type="date" placeholder="Date" class="form-control input-md" runat="server"></asp:TextBox>   
                            </div>

                            <div class="form-group">
                               <label for="eventPrice">Price</label> 
                                <asp:TextBox ID="eventPrice" name="eventPrice" type="text" placeholder="Price" class="form-control input-md" runat="server"></asp:TextBox>   
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
            </div>

            <!-- Add Modal -->
            <div class="modal fade" id="confirmationModal" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header filter-header">
                            <h3 class="modal-title modal-header-stylez">Confirm Deletion</h3>
                            <button type="button" class="close modal-exit-btn-stylez" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal Body -->
                        <div class="modal-body">

                            <div class="form-group row">   
                                <div class="col-md-6 col-sm-12">
                                    <label for="firstName">First</label> 
                                    <asp:TextBox ID="firstNameAddTxt"  name="firstName" type="text" placeholder="First Name" class="form-control input-md" runat="server"></asp:TextBox>   
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <label for="lastName">Last</label> 
                                    <asp:TextBox ID="lastNameAddTxt"  name="lastName" type="text" placeholder="Last Name" class="form-control input-md" runat="server"></asp:TextBox> 
                                </div>
                            </div>

                        </div>

                        <!-- Modal Footer -->
                        <div class="modal-footer">
                            <button type="button" class="w3-btn modal-close-btn-stylez" data-dismiss="modal">Close</button>
                            <asp:Button ID="btnConfirmDelete" class="w3-btn modal-submit-btn-stylez" runat="server" Text="Confirm" />
                        </div>
                    </div>
                </div>
            </div>
    </div>

    <script type="text/javascript">
        //Open Edit Modal
        function openModal() {
            $('#editModal').modal('show');
        }

        //Open Add Modal
        function openConfirmationModal() {
            $('#confirmationModal').modal('show');
        }

        //Slide transition 
        function slidez() {
            $(document).ready(function () {
                $("#mainContent").hide().slideDown(1500);
            });
        }

        $(document).ready(function () {
            $("li").removeClass("active");
            $("#eventRecords").addClass("active");
        });

        //Switch filter expand/button on click
        //$(".btn-toggle").on('click', function () {
        //    $(this).children().toggleClass("glyphicon-chevron-down").toggleClass("glyphicon-chevron-up");
        //});

        $(".btn-toggle").on('click', function () {
            $(this).find(".filter-arrow").toggleClass("glyphicon-chevron-down").toggleClass("glyphicon-chevron-up");
        });

        //Keep filter in appropriate expanded/collapsed state
        checkState(".rulesClick", "#eventTypes", '#<%= rulesState.ClientID %>');
        checkState(".event-price-filter-click", "#eventPriceFilter", '#<%= eventPriceState.ClientID %>');
        $(document).ready(function () {
            setDiv("#eventTypes", "#btnCollapseEventTypeFilter", $('#<%= rulesState.ClientID %>'));
            setDiv("#eventPriceFilter", "#btnEventPriceFilterToggle", $('#<%= eventPriceState.ClientID %>'));
        });


        //Keep filter expand/collapse button in appropriate state
        $(window).on('load', function () {
            //if ($("#eventTypes").hasClass('in'))
            //    $("#upBtn").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");

            $(".filter-content").each(function () {
                if ($(this).hasClass("in"))
                    $(this).parent().find(".filter-arrow").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-up");
            });
        });

        //$('#form1').submit(function () {
        //    // your code here
        //    alert("this worked");
        //});

    </script>
    </div>
</asp:Content>
