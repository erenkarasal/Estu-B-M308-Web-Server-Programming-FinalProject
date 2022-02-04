using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace Notitia
{
    public class SQL_Connect
    {
        public SqlConnection Connect()
        {
            SqlConnection connection = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=NotitDB;Integrated Security=true;");
            connection.Open();

            SqlConnection.ClearPool(connection);
            SqlConnection.ClearAllPools();
            return (connection);

        }
    }
}