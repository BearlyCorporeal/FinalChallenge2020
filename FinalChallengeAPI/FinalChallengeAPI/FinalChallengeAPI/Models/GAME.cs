using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalChallengeAPI.Models
{
    public class GAME
    {
        public int GAMEID { get; set; }
        public string GAMEVENUE { get; set; }
        public string GAMEDATE { get; set; }
        public string GAMETIME { get; set; }
        public string GAMEENDED { get; set; }
        public int GAMECOST { get; set; }
        public string USERNAME { get; set; }
    }
}