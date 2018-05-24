using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Collections;
using System.Data.SqlClient;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace DJ_Connect
{
    public class SendData
    {
        //Inserts new event record in database
        public int AddEventRecord(string firstName, string lastName, string eventType, string eventLocation, string eventDate,
        double eventPrice)
        {
            //Sql Connection
            string strConnection = "Data Source=(localdb)\\ProjectsV12;Initial Catalog=DJConnectDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
            SqlConnection myConnection = new SqlConnection(strConnection);
            myConnection.Open();

            SqlCommand com = new SqlCommand();
            com.Parameters.AddWithValue("@firstName", firstName);
            com.Parameters.AddWithValue("@lastName", lastName);
            com.Parameters.AddWithValue("@eventType", eventType);
            com.Parameters.AddWithValue("@eventLocation", eventLocation);
            com.Parameters.AddWithValue("@eventDate", eventDate);
            com.Parameters.AddWithValue("@eventPrice", eventPrice);

            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "AddEventRecord";
            com.Connection = myConnection;

            try
            {
                return com.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return -1;
            }

        }

        //Updates specified event record in database
        public int EditEventRecord(string firstName, string lastName, string eventType, string eventLocation, string eventDate,
        double eventPrice, int eventRecordID)
        {
            string strConnection = "Data Source=(localdb)\\ProjectsV12;Initial Catalog=DJConnectDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
            SqlConnection myConnection = new SqlConnection(strConnection);
            myConnection.Open();

            SqlCommand com = new SqlCommand();
            com.Parameters.AddWithValue("@firstName", firstName);
            com.Parameters.AddWithValue("@lastName", lastName);
            com.Parameters.AddWithValue("@eventType", eventType);
            com.Parameters.AddWithValue("@eventLocation", eventLocation);
            com.Parameters.AddWithValue("@eventDate", eventDate);
            com.Parameters.AddWithValue("@eventPrice", eventPrice);
            com.Parameters.AddWithValue("@eventRecordID", eventRecordID);

            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "EditEventRecord";
            com.Connection = myConnection;

            try
            {
                return com.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        //Deletes specified event record from database
        public int DeleteEventRecord(int eventRecordID)
        {
            string strConnection = "Data Source=(localdb)\\ProjectsV12;Initial Catalog=DJConnectDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
            SqlConnection myConnection = new SqlConnection(strConnection);
            myConnection.Open();

            SqlCommand com = new SqlCommand();
            com.Parameters.AddWithValue("@eventRecordID", eventRecordID);

            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "DeleteEventRecord";
            com.Connection = myConnection;

            try
            {
                return com.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return -1;
            }
        }

        //Inserts a new record in the Event Requests table
        public int MakeEventRequest(string firstName, string lastName, string dateCreated, string eventDate, string emailAddress,
            string phoneNumber, string eventType, string eventStartTime, string eventEndTime, string eventLocation, string comments)
        {
            DateTime dateCreatedConv = Convert.ToDateTime(dateCreated);
            DateTime eventDateConv = Convert.ToDateTime(eventDate);

            string strConnection = "Data Source=(localdb)\\ProjectsV12;Initial Catalog=DJConnectDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
            SqlConnection myConnection = new SqlConnection(strConnection);
            myConnection.Open();

            SqlCommand com = new SqlCommand();
            com.Parameters.AddWithValue("@firstName", firstName);
            com.Parameters.AddWithValue("@lastName", lastName);
            com.Parameters.AddWithValue("@dateCreated", dateCreatedConv);
            com.Parameters.AddWithValue("@eventDate", eventDateConv);
            com.Parameters.AddWithValue("@emailAddress", emailAddress);
            com.Parameters.AddWithValue("@phoneNumber", phoneNumber);
            com.Parameters.AddWithValue("@eventType", eventType);
            com.Parameters.AddWithValue("@eventStartTime", eventStartTime);
            com.Parameters.AddWithValue("@eventEndTime", eventEndTime);
            com.Parameters.AddWithValue("@eventLocation", eventLocation);
            com.Parameters.AddWithValue("@comments", comments);

            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "AddEventRequest";
            com.Connection = myConnection;

            try
            {
                return com.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                return -1;
            }

        }
    }
}