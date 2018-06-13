using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace DJ_Connect
{
    public partial class EventRequest : System.Web.UI.Page
    {
        SendData send = new SendData();
        FormValidation validate = new FormValidation();
        string errorMessage = "";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public bool Validate()
        {
            //Clear message
            bool valid = true;
            
            //Validate required fields aren't empty
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
                valid = false;
            }

            //Validate input doesn't exceed max length
            foreach (TextBox txtBox in textBoxes)
            {
                if (!validate.ValidateInputLength(txtBox.Text))
                {
                    errorMessage += "Input can't exceed 50 characters.\r\n";
                    valid = false;
                }
            }

            //Validate input is valid email address
            if (!validate.ValidateEmailAddress(Email.Text))
            {
                errorMessage += "Please enter a valid email address.\r\n";
                valid = false;
            }

            //Validate input is valid phone number
            //if (!validate.ValidatePhoneNumber(Phone.Text))
            //    valid = false;

            //Validate event date isn't already booked
            try
            {
                if (!validate.ValidateEventDate(Convert.ToDateTime(BookedDate.Text)))
                {
                    errorMessage += "The date selected (" + BookedDate.Text + ") is already booked.\r\n<br> ";
                    valid = false;
                }
            }
            //Validate input is a valid date
            catch (Exception k)
            {
                if (!validate.ValidDate(BookedDate.Text))
                {
                    errorMessage += "Please select a valid date.\r\n ";
                    valid = false;
                }
            }

            if(!validate.ValidateEventDateNotPast(Convert.ToDateTime(BookedDate.Text)))
            {
                errorMessage += "The date you selected has already past.";
                valid = false;
            }

            //if (!validate.ValidateStartEndTime(Convert.ToDateTime(StartTime.Text), Convert.ToDateTime(EndTime.Text)))
            //{
            //    errorMessage += "The event start time must be before event end time.<br>";
            //    valid = false;
            //}

            //Return validity of form submission
            return valid;
        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            DateTime dateCreated = DateTime.Now;

            //Validate user input
            if (!Validate())
                //User input is invalid
            {
                feedback.Attributes.Remove("style");
                feedback.Attributes.Add("style", "display:block; padding-top: 30px; padding-bottom: 30px;");
                feedbackText.Attributes.Remove("class");
                feedbackText.Attributes.Add("class", "col-md-6 col-sm-12 alert alert-danger");
                feedbackText.InnerText = errorMessage;
                //lblDisplay.Text = errorMessage;
            }
            else
                //User input is valid
            {
                if (send.MakeEventRequest(FirstName.Text, LastName.Text, dateCreated.ToString(), BookedDate.Text, Email.Text, Phone.Text, EventType.Text, StartTime.Text, EndTime.Text, EventLocation.Text, Comments.Text) != -1)
                //New event request sucussefully inserted into DB table
                {
                    feedback.Attributes.Add("style", "display: block; padding-top: 30px; padding-bottom: 30px;");
                    feedbackText.Attributes.Remove("class");
                    feedbackText.Attributes.Add("class", "col-md-6 col-sm-12 alert alert-success");
                    feedbackText.InnerText = "Your event request has succuessfully been submitted!";
                    //lblDisplay.Text = "Your event request has succuessfully been submitted!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "disableInputs();", true);
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