using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DJ_Connect
{
    public partial class EventRequest : System.Web.UI.Page
    {
        SendData send = new SendData();
        FormValidation validate = new FormValidation();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {

            //Clear message
            bool checker = true;
            string errorMessage = "";

            DateTime dateCreated = DateTime.Now;

            List<TextBox> textBoxes = new List<TextBox>();
            textBoxes.Add(FirstName);
            textBoxes.Add(LastName);
            textBoxes.Add(Email);
            textBoxes.Add(Phone);
            textBoxes.Add(BookedDate);
            textBoxes.Add(StartTime);
            textBoxes.Add(EndTime);
            textBoxes.Add(EventType);
            textBoxes.Add(EventLocation);
            //textBoxes.Add(Comments);

            if (!validate.AreTextBoxesBlank(textBoxes))
            {
                errorMessage = "Don't leave blank\r\n ";
                checker = false;
            }

            //try
            //{
            //    if (!validate.checkBookedDate(Convert.ToDateTime(BookedDate.Text)))
            //    {
            //        errorMessage += "The date selected (" + BookedDate.Text + ") is already booked.\r\n ";
            //        checker = false;
            //    }
            //}
            //catch (Exception k)
            //{
            //    if (!validate.ValidDate(BookedDate.Text))
            //    {
            //        errorMessage += "Please select a valid date.\r\n ";
            //        checker = false;
            //    }
            //}


            if (checker == false)
            {
                feedback.Attributes.Remove("style");
                feedback.Attributes.Add("style", "display:block; padding-top: 30px; padding-bottom: 30px;");
                feedbackText.Attributes.Remove("class");
                feedbackText.Attributes.Add("class", "col-md-6 col-sm-12 alert alert-danger");
                feedbackText.InnerText = errorMessage;
                //lblDisplay.Text = errorMessage;
            }
            else
            {
                if (send.MakeEventRequest(FirstName.Text, LastName.Text, dateCreated.ToString(), BookedDate.Text, Email.Text, Phone.Text, EventType.Text, StartTime.Text, EndTime.Text, EventLocation.Text, Comments.Text) != -1)
                //New event request sucussefully inserted into DB table
                {
                    feedback.Attributes.Add("style", "display: block; padding-top: 30px; padding-bottom: 30px;");
                    feedbackText.Attributes.Remove("class");
                    feedbackText.Attributes.Add("class", "col-md-6 col-sm-12 alert alert-success");
                    feedbackText.InnerText = "Your event request has succuessfully been submitted!";
                    //lblDisplay.Text = "Your event request has succuessfully been submitted!";
                }
                //Error while attempting to insert new record
                else
                {
                    feedback.Attributes.Add("style", "display: block; padding-top: 30px; padding-bottom: 30px;");
                    feedbackText.Attributes.Remove("class");
                    feedbackText.Attributes.Add("class", "col-md-6 col-sm-12 alert alert-danger");
                    feedbackText.InnerText = "There was an error submitting your event request";
                    //lblDisplay.Text = "There was an error submitting your event request";
                }
            }
        }
    }


}