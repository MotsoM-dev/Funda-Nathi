using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EducationProject
{
	public partial class LiveSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
       
        protected void btnStartVideoCall_Click(object sender, EventArgs e)
        {
            lblSessionDetails.Text = "🔴 Redirecting you to the live tutorial session on Microsoft Teams...";
            Response.Redirect("https://www.microsoft.com/en-za/microsoft-teams/join-a-meeting?msockid=29997a1d026b6b3c3bb46f9203a26a27");
        }

    }
}