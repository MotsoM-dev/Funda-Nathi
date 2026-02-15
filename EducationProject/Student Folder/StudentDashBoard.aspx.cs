using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EducationProject
{
	public partial class StudentDashBoard : System.Web.UI.Page
	{


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Authentication/Auth.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadStudentDashboardData();

                if (Session["UserName"] != null)
                {
                    lblStudentName.Text = Session["UserName"].ToString();
                }
            }
        }
        



        private void LoadStudentDashboardData()
        {
            int userId = Convert.ToInt32(Session["UserID"]);
            string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Total enrolled courses
                SqlCommand cmdCourses = new SqlCommand("SELECT COUNT(*) FROM Enrollments WHERE UserID = @UserID", conn);
                cmdCourses.Parameters.AddWithValue("@UserID", userId);
                lblTotalCourses.Text = cmdCourses.ExecuteScalar().ToString();
            }
        }



    }
}