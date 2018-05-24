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
using System.Data.OleDb;
using System.Collections;
using System.Data.SqlClient;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace DJ_Connect
{
    public class FormValidation
    {
        public bool ValidateTempleEmail(string Email)
        {
            Regex regexTempleEmail = new Regex(@"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$");
            return (regexTempleEmail.IsMatch(Email) && Email.EndsWith("@temple.edu"));
        }

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

        //public bool checkBookedDate(DateTime theTime)
        //{
        //    try
        //    {
        //        // Access Connection
        //        string strConnection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\\Users\\Stephan\\Desktop\\Articles.mdb;User Id=admin;Password=;";
        //        OleDbConnection myConnection = new OleDbConnection(strConnection);

        //        string cmdstr = "SELECT bookedDate FROM Booking";

        //        OleDbCommand com = new OleDbCommand(cmdstr, myConnection);
        //        OleDbDataAdapter myDataAdapter = new OleDbDataAdapter(com);

        //        DataSet myDS = new DataSet();
        //        myDataAdapter.Fill(myDS);

        //        bool valid = true;

        //        //string test1 = myDS.Tables[0].Rows[0][0].ToString();
        //        //DateTime test = Convert.ToDateTime(myDS.Tables[0].Rows[0].ToString());
        //        for (int i = 0; i < myDS.Tables[0].Rows.Count; i++)
        //        {
        //            if (theTime.Equals(Convert.ToDateTime(myDS.Tables[0].Rows[i][0].ToString())))
        //                valid = false;

        //        }

        //        return valid;
        //    }
        //    catch (Exception e)
        //    {
        //        return false;
        //    }
        //}
    }
}