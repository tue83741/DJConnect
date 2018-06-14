<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageEventRequests.aspx.cs" Inherits="DJ_Connect.WebForm6" %>
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

                            <asp:Button ID="btnResetAllFilters" runat="server" Text="Reset All" CssClass="btn btn-block resetButton btn-filter-reset-all-stylez"/>

                            <!-- Event Types -->
                            <div class="filter-body-stylez">
                                <button id="btnCollapseEventTypeFilter" type="button" class="btn btn-block filter-collapse icon-chevron-down rulesClick btn-toggle" data-toggle="collapse" data-target="#eventTypes" style="margin-top: 20px; margin-bottom: 15px; background-color: transparent; padding-left:0px; padding-right:0px;">
                                    <h4 class="content-filter-header-stylez" style="display: inline; padding: 0px; padding-left: 10px; float: left;">Event Type</h4>
                                    <span id="upBtn" class="glyphicon glyphicon-chevron-down filter-arrow" style="float:right; padding-top: 10px;"></span>
                                </button>
                                <div id="eventTypes" class="collapse filter-content">
                                    <asp:ListBox ID="lstEventTypes" runat="server" SelectionMode="Multiple" CssClass="listBoxFilters form-control" style="height:145px"></asp:ListBox>
                                    <div class="filter-footer-stylez">
                                        <button id="Button1" type="button" class="btn btn-default btn-circle filter-btn" runat="server" ><span class="glyphicon glyphicon-ok"></span></button>
                                        <button id="Button2" type="button" runat="server" class="btn btn-default btn-circle filter-btn" style="float: right" ><span class="glyphicon glyphicon-remove"></span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Table Panel -->
                <div class="col-md-9 col-sm-12 panel panel-default card-stylez-2" style="border-top-left-radius:0px; border-top-right-radius: 0px; padding-left: 0px; padding-right: 0px">
                    <h4 class="filter-header">Event Requests:</h4>
                    <div class="panel-body panel-body-stylez">

                        <!-- Entries & Search -->
                        <div class="row" style="padding-bottom: 10px">
                                    <div class="col-sm-4" id="ShowEntriesDropdown">
                                        <div id="dataTables-example_length">
                                            <label style="display:inline-flex">
                                                Show
                                            <%--<asp:DropDownList runat="server" OnSelectedIndexChanged="ddlSelectPageSize_SelectedIndexChanged" AutoPostBack="true" ID="ddlSelectPageSize" CssClass="form-control input-sm ddlSelectPageSize">
                                                <asp:ListItem Value="10">10</asp:ListItem>
                                                <asp:ListItem Value="25">25</asp:ListItem>
                                                <asp:ListItem Value="50">50</asp:ListItem>
                                                <asp:ListItem Value="100">100</asp:ListItem>
                                                <asp:ListItem Value="All">See All</asp:ListItem>
                                            </asp:DropDownList>--%>
                                                entries
                                            </label>
                                        </div>
                                    </div>

                                    <div class="col-sm-4 searchBarCont searchbar-stylez">
                                        <div id="custom-search-input">
                                            <div class="input-group">
                                                <input type="text" id="txtSearch" runat="server" class="form-control input-sm txtSearch" placeholder="Search" />
                                                <span class="input-group-btn">
                                                    <%--<button class="btn btn-search-stylez" runat="server" id="btnSearch" type="submit" onserverclick="btnSearchClick">
                                                        <i class="glyphicon glyphicon-search"></i>
                                                    </button>--%>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            <div class="row">
                                <label id="lblSearchResults" class="col-xs-12" style="padding-bottom: 10px;"></label>
                            </div>


                        <!-- Gridview -->
                        <div class="table-responsive">
                        <asp:GridView ID="gvEventRequests" PagerStyle-CssClass="" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="eventRequestID" AllowPaging="True" CssClass="table table-striped table-bordered table-hover dataTable no-footer" style="overflow-x:auto; border-collapse: unset">
                        <Columns>
                            <asp:BoundField DataField="dateCreated" HeaderText="Request Date" SortExpression="dateCreated" />
                            <asp:BoundField DataField="eventDate" HeaderText="Event Date" SortExpression="eventDate" />
                            <asp:BoundField DataField="firstName" HeaderText="First" SortExpression="firstName" />
                            <asp:BoundField DataField="lastName" HeaderText="Last" SortExpression="lastName" />
                            <asp:BoundField DataField="emailAddress" HeaderText="Email" SortExpression="emailAddress" />
                            <asp:BoundField DataField="phoneNumber" HeaderText="Phone" SortExpression="phoneNumber" />
                            <asp:BoundField DataField="eventType" HeaderText="Type" SortExpression="eventType" />
                            <asp:BoundField DataField="eventStartTime" HeaderText="Start" SortExpression="eventStartTime" />
                            <asp:BoundField DataField="eventEndTime" HeaderText="End" SortExpression="eventEndTime" />
                            <asp:BoundField DataField="eventLocation" HeaderText="Location" SortExpression="eventLocation" />
                            <asp:BoundField DataField="comments" HeaderText="Comments" SortExpression="comments" />

                            <asp:BoundField DataField="eventRequestID" HeaderText="ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" >
                                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                                <ItemStyle CssClass="hiddencol"></ItemStyle>
                            </asp:BoundField>
                        </Columns>
                        <PagerStyle CssClass="pagination-ys"></PagerStyle>
                            <PagerSettings  Mode="NextPreviousFirstLast" PreviousPageText="Previous" NextPageText="Next"/>
                        </asp:GridView>
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

        //Display search results information
        function getSearchResults() {
            $(document).ready(function () {
                var results = -1;
                var searchText = document.getElementById("ContentPlaceHolder1_txtSearch").value + ' ';
                var filterOptions = '';

                var rows = document.getElementById("ContentPlaceHolder1_gvEventRecords").rows.length;

                for (var i = 0; i < rows; i++) {
                    results++;
                }


                var filter = document.getElementById("ContentPlaceHolder1_lstEventTypes");

                for (j = 0; j < filter.options.length; j++) {
                    if (filter.options[j].selected)
                        filterOptions += filter.options[j].text + ' ';
                }
                document.getElementById("lblSearchResults").innerText = 'Search results: ' + searchText + filterOptions + ' (' + results + ')';
            });
        }

        //Disable input fields
        function disableInputs() {
            $(".inputs input").attr("disabled", "disabled");
            $("#ContentPlaceHolder1_btnSubmitEdit").attr("disabled", "disabled");
        }


        //Display number of search results
        //$("#ContentPlaceHolder1_btnSearch").on('click', function () {
        //    getSearchResults();
        //});

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
    </script>
    </div>
</asp:Content>
