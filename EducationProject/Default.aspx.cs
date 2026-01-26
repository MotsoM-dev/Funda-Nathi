using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EducationProject
{
	public partial class WebForm1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void btnExploreCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Authentication/Auth.aspx");
        }

        protected void btnBrowseCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Authentication/Auth.aspx");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Authentication/Auth.aspx");
        }
	}
}

