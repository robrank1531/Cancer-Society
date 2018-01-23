using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Capstone.Web.Utility
{
    public static class Enviroment
    {
        public static string GetConnectionString()
        {
            //determines connection string based on system (server) name
            //defaults to Dev (local)

            string machineName = System.Environment.MachineName;
            string result;

            if (machineName.Substring(0, 3) == "IP-")
            {
                // pattern match on AppHarbor
                result = ConfigurationManager.AppSettings["SQLSERVER_CONNECTION_STRING"];
            }

            else
            {
                // local by default
                result = ConfigurationManager.ConnectionStrings["recipeDB"].ConnectionString;
            }

            return result;
        }
    }
}