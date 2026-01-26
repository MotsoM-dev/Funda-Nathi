using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EducationProject.Classes
{
    public class DiscussionResponses
    {
        public int UserID { get; set; }
        public string ResponseText { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}