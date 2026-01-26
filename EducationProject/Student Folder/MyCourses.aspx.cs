using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EducationProject
{
    public partial class MyCourses : System.Web.UI.Page
    {
        private string courseId; 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                courseId = Request.QueryString["CourseID"];

                if (string.IsNullOrEmpty(courseId))
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = "Course ID not found.";
                    rptDocuments.Visible = false;
                    lblCourseName.Visible = false;
                    lblCourseDescription.Visible = false;
                    imgCourse.Visible = false;
                }
                else
                {
                    LoadCourseDetails();
                    LoadUploadedDocuments();
                }
            }
        }

        private void LoadCourseDetails()
        {
            if (string.IsNullOrEmpty(courseId))
                return;

            string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT CourseName, CourseDescription, ImageUrl FROM Courses WHERE CourseID = @CourseID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@CourseID", courseId);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    lblCourseName.InnerText = reader["CourseName"].ToString();
                    lblCourseDescription.InnerText = reader["CourseDescription"].ToString();
                    imgCourse.Src = reader["ImageUrl"].ToString();
                }
                reader.Close();
            }
        }

        private void LoadUploadedDocuments()
        {
            if (string.IsNullOrEmpty(courseId))
                return;

            string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                SELECT DocumentID, DocumentTitle, UploadDate
                FROM TutorDocuments
                WHERE CourseID = @CourseID
                ORDER BY UploadDate DESC";

                SqlCommand cmd = new SqlCommand(query, connection);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dtDocuments = new DataTable();
                adapter.Fill(dtDocuments);

                rptDocuments.DataSource = dtDocuments;
                rptDocuments.DataBind();
            }
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            lblMessage.Visible = true;
            lblMessage.Text = "Thank you for booking! We'll contact you shortly.";
           
        }

    }
}
