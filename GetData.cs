using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace DJ_Connect
{
    public class GetData
    {
        //Returns DataSet of all event records
        public DataSet GetEventRecords()
        {
            //Sql Connection
            string strConnection = "Data Source=(localdb)\\ProjectsV12;Initial Catalog=DJConnectDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
            SqlConnection myConnection = new SqlConnection(strConnection);

            SqlCommand com = new SqlCommand();
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "GetEventRecords";
            com.Connection = myConnection;
            SqlDataAdapter myDataAdapter = new SqlDataAdapter(com);

            DataSet myDS = new DataSet();
            myDataAdapter.Fill(myDS);

            return myDS;
        }

        //Returns DataSet of all event types
        public DataSet GetEventTypes()
        {
            //Sql Connection
            string strConnection = "Data Source=(localdb)\\ProjectsV12;Initial Catalog=DJConnectDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
            SqlConnection myConnection = new SqlConnection(strConnection);

            SqlCommand com = new SqlCommand();
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "GetEventTypes";
            com.Connection = myConnection;
            SqlDataAdapter myDataAdapter = new SqlDataAdapter(com);

            DataSet myDS = new DataSet();
            myDataAdapter.Fill(myDS);

            return myDS;
        }

        public DataSet GetBooking()
        {
            //Sql Connection
            string strConnection = "Data Source=(localdb)\\ProjectsV12;Initial Catalog=DJConnectDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
            SqlConnection myConnection = new SqlConnection(strConnection);

            SqlCommand com = new SqlCommand();
            com.CommandType = CommandType.StoredProcedure;
            com.CommandText = "GetEventRequests";
            com.Connection = myConnection;
            SqlDataAdapter myDataAdapter = new SqlDataAdapter(com);

            DataSet myDS = new DataSet();
            myDataAdapter.Fill(myDS);

            return myDS;
        }

    }
}