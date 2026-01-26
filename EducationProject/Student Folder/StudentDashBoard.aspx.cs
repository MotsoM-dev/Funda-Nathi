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
            if (!IsPostBack)
            {
                LoadStudentDashboardData();

                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Authentication/Auth.aspx");
                    return;
                }

                if (Session["UserName"] != null)
                {
                    lblStudentName.Text = Session["UserName"].ToString();
                }
                else
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
                SqlCommand cmdCourses = new SqlCommand("SELECT COUNT(*) FROM Enrollments WHERE StudentID = @StudentID", conn);
                cmdCourses.Parameters.AddWithValue("@StudentID", userId);
                lblTotalCourses.Text = cmdCourses.ExecuteScalar().ToString();

                // Total tutoring sessions
                //SqlCommand cmdSessions = new SqlCommand("SELECT COUNT(*) FROM TutoringSessions WHERE StudentID = @StudentID", conn);
                //cmdSessions.Parameters.AddWithValue("@StudentID", userId);
                //lblTotalSessions.Text = cmdSessions.ExecuteScalar().ToString();

                // Total paid amount
                //SqlCommand cmdPaid = new SqlCommand("SELECT ISNULL(SUM(AmountPayed), 0) FROM Enrollments WHERE StudentID = @StudentID", conn);
                //cmdPaid.Parameters.AddWithValue("@StudentID", userId);
                //lblTotalPaid.Text = Convert.ToDecimal(cmdPaid.ExecuteScalar()).ToString("F2");

                //// Total pending payments
                //SqlCommand cmdPending = new SqlCommand("SELECT ISNULL(SUM(Amount), 0) FROM Payments WHERE StudentID = @StudentID AND Status = 'Pending'", conn);
                //cmdPending.Parameters.AddWithValue("@StudentID", userId);
                //lblPendingPayments.Text = Convert.ToDecimal(cmdPending.ExecuteScalar()).ToString("F2");
            }
        }



    }
}