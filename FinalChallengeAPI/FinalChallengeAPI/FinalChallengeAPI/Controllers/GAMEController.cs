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
    public class GAMEController : ApiController
    {
        public HttpResponseMessage Get()
        {
            string Query = @"SELECT * FROM GAME";
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
        public string Post(GAME game)
        {
            try
            {
                string query = @"EXACUTE ADD_GAME " + game.GAMEVENUE + @"," + game.GAMEDATE + @"," + game.GAMETIME;
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

        public string Put(GAME game)
        {
            try
            {
                string query = @"EXACUTE END_GAME " + game.GAMEID + @"," + game.GAMECOST + @"," + game.USERNAME;
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

        public string Delete(GAME game)
        {
            try
            {
                string query = @"EXACUTE DELETE_GAME " + game.GAMEID;
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
