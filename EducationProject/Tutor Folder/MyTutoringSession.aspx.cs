using EducationProject.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;


namespace EducationProject
{
    public partial class MyTutoringSession : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        
        protected void btnCreateMeeting_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://www.microsoft.com/en-za/microsoft-teams/join-a-meeting?msockid=29997a1d026b6b3c3bb46f9203a26a27");
        }

      

       


    }
}


