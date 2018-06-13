using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Collections;
using System.Data.SqlClient;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace DJ_Connect
{
    public class FormValidation
    {
        //public bool ValidateEmailAddress(string Email)
        //{
        //    Regex regexEmailAddress = new Regex(@"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$");
        //    return (regexEmailAddress.IsMatch(Email));
        //}

        //Validate input is valid email address
        public bool ValidateEmailAddress(string emailaddress)
        {
            try
            {
                MailAddress m = new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }

        public bool ValidatePhoneNumber(String phone)
        {
            Regex regexPhoneNumber = new Regex("/^(1-?)?(\\([2-9]\\d{2}\\)|[2-9]\\d{2})-?[2-9]\\d{2}-?\\d{4}$/");
            return (regexPhoneNumber.IsMatch(phone));
        }

        //Validate textboxes aren't blank
        public bool IsTextBoxBlank(TextBox txt)
        {
            return (String.IsNullOrEmpty(txt.Text) || String.IsNullOrWhiteSpace(txt.Text));
        }

        public bool AreTextBoxesBlank(List<TextBox> TxtBox)
        {
            bool valid = true;
            for (int i = 0; i < TxtBox.Count; i++)
            {
                if (String.IsNullOrEmpty(TxtBox[i].Text) || String.IsNullOrWhiteSpace(TxtBox[i].Text))
                    valid = false;
            }
            return valid;
        }

        //Validate input is valid date
        public bool ValidDate(String theDate)
        {
            try
            {
                DateTime date = Convert.ToDateTime(theDate);
                DateTime today = DateTime.Now;
                if (date.CompareTo(today) < 0)
                    return false;
                else
                    return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        //Validate input doesn't exceed maximum length
        public bool ValidateInputLength(String input)
        {
            if (input.Length > 50)
                return false;
            else
                return true;
        }

        public bool ValidateInputLength(String input, int maxLength)
        {
            if (input.Length > maxLength)
                return false;
            else
                return true;
        }

        //Validate requested event date isn't already booked
        public bool ValidateEventDate(DateTime theTime)
        {
            try
            {
                //Sql Connection
                string strConnection = "Data Source=(localdb)\\ProjectsV12;Initial Catalog=DJConnectDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
                SqlConnection myConnection = new SqlConnection(strConnection);

                SqlCommand com = new SqlCommand();
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "GetEventDates";
                com.Connection = myConnection;
                SqlDataAdapter myDataAdapter = new SqlDataAdapter(com);

                DataSet myDS = new DataSet();
                myDataAdapter.Fill(myDS);

                bool valid = true;

                //string test1 = myDS.Tables[0].Rows[0][0].ToString();
                //DateTime test = Convert.ToDateTime(myDS.Tables[0].Rows[0].ToString());
                for (int i = 0; i < myDS.Tables[0].Rows.Count; i++)
                {
                    if (theTime.Equals(Convert.ToDateTime(myDS.Tables[0].Rows[i][0].ToString())))
                        valid = false;
                }

                return valid;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        //Validate requested event date isn't before current date
        public bool ValidateEventDateNotPast(DateTime theTime)
        {
            DateTime currentDate = DateTime.Now;

            if (DateTime.Compare(theTime, currentDate) < 0)
                return false;
            else
                return true;
        }

        public bool ValidateStartEndTime(DateTime startTime, DateTime endTime)
        {
            if (DateTime.Compare(endTime, startTime) <= 0)
                return false;
            else
                return true;
        }
    }
}