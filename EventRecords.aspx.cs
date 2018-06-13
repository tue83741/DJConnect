using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;

namespace DJ_Connect
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        GetData eventRecordsData = new GetData();
        SendData send = new SendData();

        protected void Page_Load(object sender, EventArgs e)
        {
            string Sort_Direction = "lastName ASC";

            //
            //DataSet ds = eventRecordsData.GetEventRecords();
            //ViewState["SearchTable"] = ds.Tables[0].DefaultView.ToTable();

            if (!IsPostBack)
            {
                ViewState["SortExpr"] = Sort_Direction;
                
                gvEventRecords.DataSource = eventRecordsData.GetEventRecords();
                gvEventRecords.DataBind();

                lstEventTypes.DataSource = eventRecordsData.GetEventTypes();
                lstEventTypes.DataValueField = "eventType";
                lstEventTypes.DataTextField = "eventType";
                lstEventTypes.DataBind();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "slidez();", true);
            }
        }

        protected void FilterClick(object sender, EventArgs e)
        {
            this.Filter();
        }

        protected void ResetAllFilters_Click(object sender, EventArgs e)
        {
            lstEventTypes.ClearSelection();
            txtEventPriceFromFilter.Text = "";
            txtEventPriceToFilter.Text = "";

            this.Filter();
            gvEventRecords.DataBind();
        }

        protected void ResetFilter_Click(object sender, EventArgs e)
        {
            lstEventTypes.ClearSelection();

            this.Filter();
            gvEventRecords.DataBind();
        }

        protected void ResetEventPriceFilter_Click(object sender, EventArgs e)
        {
            txtEventPriceFromFilter.Text = "";
            txtEventPriceToFilter.Text = "";

            this.Filter();
            gvEventRecords.DataBind();
        }

        /* Here lies the code for searching and filtering */

        //Variables
        bool searching;
        bool filtering;

        //Method for filtering gridview
        public void Filter()
        {
            gvEventRecords.PageIndex = 0;

            string select = "";

            int count = 0;
            for (int i = 0; i < lstEventTypes.Items.Count; i++)
            {
                if (lstEventTypes.Items[i].Selected)
                    count++;
            }

            if (count > 0)
                select += " AND (";

            for (int i = 0; i < lstEventTypes.Items.Count; i++)
            {
                if (lstEventTypes.Items[i].Selected)
                    select += " OR eventType = '" + lstEventTypes.Items[i].Text + "'";
            }

            if (count > 0)
            {
                select += ")";
                int Place = select.IndexOf("OR");
                select = select.Remove(Place, 2).Insert(Place, "");
            }

            if (!txtEventPriceFromFilter.Text.Equals("") && !txtEventPriceToFilter.Text.Equals(""))
            {
                select += " AND (eventPrice >= " + Convert.ToDouble(txtEventPriceFromFilter.Text) +
                    " AND eventPrice <= " + Convert.ToDouble(txtEventPriceToFilter.Text) + ")";
            }
            //DataTable searchSubset;
            //searchSubset = (DataTable)ViewState["SearchTable"];
            //searchSubset.DefaultView.RowFilter = select;
            ////Gridview uses the filtered subset as new datasource
            //gvEventRecords.DataSource = searchSubset;
            //gvEventRecords.DataBind();

            DataTable searchSubset;

            //Stores the subset from the search results in a new table
            searchSubset = (DataTable)ViewState["SearchTable"];
            if (searchSubset != null)
            {
                this.UpdateSearchSet();
                searching = true;
            }
            //If it fails then the user is not currently searching
            else
            {
                //The table is set to the default DataSet instead
                searchSubset = eventRecordsData.GetEventRecords().Tables[0];
                searching = false;
            }

            try
            {
                //Removes the first instance of AND to create a dynamic sql statement
                int Place = select.IndexOf("AND");
                select = select.Remove(Place, 3).Insert(Place, "");


                //Filters the search subset (if searching, otherwise the default DataSet)
                //to a new subset based on which filters were selected
                searchSubset.DefaultView.RowFilter = select;

                //Stores the search subset or entire DataSet
                DataSet defaultSet = eventRecordsData.GetEventRecords();
                defaultSet.Tables[0].DefaultView.RowFilter = select;

                //Filtered on entire dataset
                ViewState["FilteredOnDefaultSet"] = defaultSet.Tables[0];

                //Filtered on subset of search of results
                ViewState["FilteredOnSearchSet"] = searchSubset;

                //Gridview uses the filtered subset as new datasource
                gvEventRecords.DataSource = searchSubset;

                ViewState["Filtering"] = "true";
            }
            //If try fails it means no filters are checked
            catch
            {
                ViewState["Filtering"] = "false";

                if (ViewState["Searching"] != null)
                {
                    //If searching and no filteres were selected use the search subset as the datasource
                    if (ViewState["Searching"].ToString().Equals("true"))
                    {
                        this.UpdateSearchSet();
                        gvEventRecords.DataSource = (DataTable)ViewState["SearchTable"];
                    }
                    //If not searching and no filters were selected use the entire DataSet as the datasource
                    else
                        gvEventRecords.DataSource = eventRecordsData.GetEventRecords();
                }
                //Same as not searching
                else
                    gvEventRecords.DataSource = eventRecordsData.GetEventRecords();
            }

            gvEventRecords.DataBind();
            this.CheckCase();

        }

        //Method to check the current state
        public DataView CheckCase()
        {
            try
            {
                if (ViewState["Searching"].ToString().Equals("true"))
                    searching = true;
                else
                    searching = false;
            }
            catch
            {
                searching = false;
            }

            try
            {
                if (ViewState["Filtering"].ToString().Equals("true"))
                    filtering = true;
                else
                    filtering = false;
            }
            catch
            {
                filtering = false;
            }

            DataView returnView;

            if (searching && filtering)
            {
                DataTable searchedAndFiltered = (DataTable)ViewState["FilteredOnSearchSet"];
                searchedAndFiltered.DefaultView.Sort = ViewState["SortExpr"].ToString();
                //gvDivisions.DataSource = searchedAndFiltered.DefaultView;
                returnView = searchedAndFiltered.DefaultView;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "getSearchResults();", true);
            }
            else if (searching && !filtering)
            {
                DataTable searched = (DataTable)ViewState["SearchTable"];
                searched.DefaultView.Sort = ViewState["SortExpr"].ToString();         
                //gvDivisions.DataSource = searched.DefaultView;
                returnView = searched.DefaultView;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "getSearchResults();", true);
            }
            else if (!searching && filtering)
            {
                DataTable filtered = (DataTable)ViewState["FilteredOnDefaultSet"];
                filtered.DefaultView.Sort = ViewState["SortExpr"].ToString();
                //gvDivisions.DataSource = filtered.DefaultView;
                returnView = filtered.DefaultView;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "getSearchResults();", true);
            }
            else
            {
                DataTable defaultSet = eventRecordsData.GetEventRecords().Tables[0];
                defaultSet.DefaultView.Sort = ViewState["SortExpr"].ToString();
                //gvDivisions.DataSource = defaultSet;
                //results.Style.Add("display", "none");
                returnView = defaultSet.DefaultView;
            }

            return returnView;
        }

        //Search functionality
        protected void btnSearchClick(object sender, EventArgs e)
        {
            gvEventRecords.PageIndex = 0;

            if (!txtSearch.Value.Equals(""))
                ViewState["Searching"] = "true";
            else
                ViewState["Searching"] = "false";

            string searchText = null;
            searchText = txtSearch.Value.Trim().Replace("'", "''");
            ViewState["SearchText"] = searchText;
            DataSet ds = eventRecordsData.GetEventRecords();
            ds.Tables[0].DefaultView.RowFilter = "CONVERT(eventRecordID, System.String) LIKE '%" + searchText + "%'" + "OR firstName LIKE '%" + searchText + "%'"
                + "OR lastName LIKE '%" + searchText + "%'" + "OR eventType LIKE '%" + searchText + "%'" + "OR eventLocation LIKE '%" + searchText + "%'" + "OR eventDate LIKE '%" + searchText + "%'"; ;

            ViewState["SearchTable"] = ds.Tables[0].DefaultView.ToTable();

            //gvDivisions.DataSource = ds.Tables[0].DefaultView;
            this.Filter();
            gvEventRecords.DataSource = this.CheckCase();
            gvEventRecords.DataBind();

            if (searching && !filtering)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "getSearchResults();", true);
                //results.Style.Remove("display");
                //lblResults.InnerHtml = "Results for " + "\"" + txtSearch.Value + "\" " + "<span style=\"color:#899197\">(" + ds.Tables[0].DefaultView.Count.ToString() + ")</span>";
            }
            else if (!searching && filtering)
            {
                DataTable filtered = (DataTable)ViewState["FilteredOnDefaultSet"];
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "getSearchResults();", true);
                //results.Style.Remove("display");
                //lblResults.InnerHtml = "Results " + "<span style=\"color:#899197\">(" + filtered.DefaultView.Count.ToString() + ")</span>";
            }
            else if (searching && filtering)
            {
                DataTable searchedAndFiltered = (DataTable)ViewState["FilteredOnSearchSet"];
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "getSearchResults();", true);
                //results.Style.Remove("display");
                //lblResults.InnerHtml = "Results for " + "\"" + txtSearch.Value + "\" " + "<span style=\"color:#899197\">(" + searchedAndFiltered.DefaultView.Count.ToString() + ")</span>";
            }
            //else
            //results.Style.Add("display", "none");
        }

        public void UpdateSearchSet()
        {
            DataSet ds = eventRecordsData.GetEventRecords();
            ds.Tables[0].DefaultView.RowFilter = "CONVERT(eventRecordID, System.String) LIKE '%" + ViewState["SearchText"].ToString() + "%'" + "OR firstName LIKE '%" + ViewState["SearchText"].ToString() + "%'"
                + "OR lastName LIKE '%" + ViewState["SearchText"].ToString() + "%'" + "OR eventType LIKE '%" + ViewState["SearchText"].ToString() + "%'"
                + "OR eventLocation LIKE '%" + ViewState["SearchText"].ToString() + "%'" + "OR eventDate LIKE '%" + ViewState["SearchText"].ToString() + "%'"; ;

            ViewState["SearchTable"] = ds.Tables[0].DefaultView.ToTable();

            gvEventRecords.DataSource = ds.Tables[0].DefaultView;
            gvEventRecords.DataBind();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }

        protected void gvEventRecords_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            modalHeader.InnerHtml = "Edit Event";
            if (e.CommandName == "selectRecord")
            {
                ViewState["Edit/Add"] = "edit";
                GridViewRow row = gvEventRecords.Rows[Convert.ToInt32(e.CommandArgument)];

                firstName.Text = row.Cells[0].Text;
                lastName.Text = row.Cells[1].Text;
                eventType.Text = row.Cells[2].Text;
                eventLocation.Text = Server.HtmlDecode(row.Cells[3].Text);
                //eventLocation.Text = row.Cells[3].Text.ToString().Replace("'", "//'");
                eventDate.Text = row.Cells[4].Text;
                eventPrice.Text = row.Cells[5].Text;
                ViewState["eventRecordID"] = row.Cells[8].Text;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
            else if (e.CommandName == "deleteRecord")
            {
                GridViewRow row = gvEventRecords.Rows[Convert.ToInt32(e.CommandArgument)];

                send.DeleteEventRecord(Convert.ToInt32(row.Cells[8].Text));
                gvEventRecords.DataSource = eventRecordsData.GetEventRecords();
                gvEventRecords.DataBind();
            }
        }

        //Sorting code for the next two methods
        private DataView Getdata()
        {
            DataView dv = this.CheckCase();
            dv.Sort = ViewState["SortExpr"].ToString();
            return dv;
        }

        protected void gvEventRecords_Sorting(object sender, GridViewSortEventArgs e)
        {
            gvEventRecords.PageIndex = 0;

            string[] SortOrder = ViewState["SortExpr"].ToString().Split(' ');
            if (SortOrder[0] == e.SortExpression)
            {
                if (SortOrder[1] == "ASC")
                {
                    ViewState["SortExpr"] = e.SortExpression + " " + "DESC";
                }
                else
                {
                    ViewState["SortExpr"] = e.SortExpression + " " + "ASC";
                }
            }
            else
            {
                ViewState["SortExpr"] = e.SortExpression + " " + "ASC";
            }

            this.Filter();
            gvEventRecords.DataSource = CheckCase();
            gvEventRecords.DataBind();

        }

        protected void ddlSelectPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSelectPageSize.SelectedValue.Equals("All"))
            {
                gvEventRecords.AllowPaging = false;
                this.Filter();
                gvEventRecords.DataBind();
            }
            else
            {
                gvEventRecords.AllowPaging = true;
                gvEventRecords.PageSize = int.Parse(ddlSelectPageSize.SelectedValue);
                this.Filter();
                gvEventRecords.DataBind();
            }
        }

        protected void gvEventRecords_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvEventRecords_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.Filter();
            gvEventRecords.PageIndex = e.NewPageIndex;
            gvEventRecords.DataBind();
        }

        protected void gvEventRecords_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        //Submit changes to event record
        protected void btnSubmitEdit_Click(object sender, EventArgs e)
        {
            if (ViewState["Edit/Add"].ToString().Equals("edit"))
            {
                if (send.EditEventRecord(firstName.Text, lastName.Text, eventType.Text, eventLocation.Text.Replace("'", "''"), eventDate.Text, double.Parse(eventPrice.Text, NumberStyles.Currency), Convert.ToInt32(ViewState["eventRecordID"].ToString())) != -1)
                {
                    successAlert.Style.Remove("display");
                    successAlert.InnerHtml = "Your changes have been <strong>submitted!</strong>";
                }
                else
                {
                    dangerAlert.Style.Remove("display");
                }
            }
            else if (ViewState["Edit/Add"].ToString().Equals("add"))
            {
                if (send.AddEventRecord(firstName.Text, lastName.Text, eventType.Text, eventLocation.Text.Replace("'", "''"), eventDate.Text, double.Parse(eventPrice.Text, NumberStyles.Currency)) != -1)
                {
                    successAlert.Style.Remove("display");
                    successAlert.InnerHtml = "A new event record has been <strong>added!</strong>";
                }
                else
                {
                    dangerAlert.Style.Remove("display");
                }
            }

            lstEventTypes.DataSource = eventRecordsData.GetEventTypes();
            lstEventTypes.DataValueField = "eventType";
            lstEventTypes.DataTextField = "eventType";
            lstEventTypes.DataBind();

            gvEventRecords.DataSource = eventRecordsData.GetEventRecords();
            gvEventRecords.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Disable", "disableInputs();", true);
        }

        //Close event record edit modal
        protected void btnEditModalClose_Click(object sender, EventArgs e)
        {
            //Clear form input data
            firstName.Text = "";
            lastName.Text = "";
            eventType.Text = "";
            eventLocation.Text = "";
            eventDate.Text = "";
            eventPrice.Text = "";

            //Clear feedback messages
            successAlert.Style.Add("display", "none");
            dangerAlert.Style.Add("display", "none");

            //Refresh listbox
            lstEventTypes.DataSource = eventRecordsData.GetEventTypes();
            lstEventTypes.DataValueField = "eventType";
            lstEventTypes.DataTextField = "eventType";
            lstEventTypes.DataBind();

            //Refresh table
            gvEventRecords.DataSource = eventRecordsData.GetEventRecords();
            gvEventRecords.DataBind();
        }


        protected void addEventRecord_Click(object sender, EventArgs e)
        {
            ViewState["Edit/Add"] = "add";
            modalHeader.InnerHtml = "Add Event";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        }
    }
}