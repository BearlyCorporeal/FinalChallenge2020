using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using FinalChallengeAPI.Models;

namespace FinalChallengeAPI.Controllers
{
    public class USERACCOUNTController : ApiController
    {
        public HttpResponseMessage Get()
        {
            string Query = @"EXECUTE VIEW_USERS";
            DataTable table = new DataTable();
            using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["FinalChallengeDB"].ConnectionString))
            using (var cmd = new SqlCommand(Query, con))
            using (var da = new SqlDataAdapter(cmd))
            {
                cmd.CommandType = CommandType.Text;
                da.Fill(table);
            }
            return Request.CreateResponse(HttpStatusCode.OK, table);
        }

        public string Post(USERACCOUNT USER) 
        {
            try
            {
                string query = @"EXACUTE ADD_USER " + USER.USERNAME + @"," + USER.PASSWORD + @"," + USER.ROLE;
                DataTable table = new DataTable();
                using (var con = new SqlConnection(ConfigurationManager.ConnectionStrings["FinalChallengeDB"].ConnectionString))
                using (var cmd = new SqlCommand(query, con))
                using (var da = new SqlDataAdapter(cmd))
                {
                    cmd.CommandType = CommandType.Text;
                    da.Fill(table);
                }
                return "succsess";
            }
            catch (Exception)
            {
                return "falure";
            }
        
        }
    }
}
