using EducationProject.Classes;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace EducationProject
{
    public partial class CourseCatalog : System.Web.UI.Page
    {
        protected int CourseID
        {
            get
            {
                return ViewState["CourseID"] != null ? Convert.ToInt32(ViewState["CourseID"]) : 0;
            }
            set
            {
                ViewState["CourseID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["CourseID"] != null)
                {
                    CourseID = Convert.ToInt32(Request.QueryString["CourseID"]);
                    LoadCourseDetails();
                }
                else
                {
                    Response.Redirect("~/Student Folder/CourseCatalog.aspx");
                }
            }
        }

        private void LoadCourseDetails()
        {
            CourseHelper helper = new CourseHelper();
            var course = helper.GetCourseById(CourseID);

            if (course != null)
            {
                lblCourseName.InnerText = course.CourseName;
                lblCourseDescription.InnerText = course.CourseDescription;
                lblPrice.Text = course.CourseFee.ToString("F2");
                imgCourse.Src = !string.IsNullOrWhiteSpace(course.ImageUrl) ? course.ImageUrl : "~/Images/default-course.jpg";
            }
            else
            {
                Response.Redirect("~/Student Folder/CourseCatalog.aspx");
            }
        }

        protected void EnrollInCourse(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);
            CourseHelper helper = new CourseHelper();
            decimal courseFee = helper.GetCourseFee(CourseID);

            if (courseFee <= 0)
            {
                lblMessage.Text = "Invalid course fee. Please contact admin.";
                lblMessage.CssClass = "message-label error";
                lblMessage.Visible = true;
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string checkStudentQuery = "SELECT COUNT(*) FROM Students WHERE StudentID = @userId";
                SqlCommand checkCmd = new SqlCommand(checkStudentQuery, conn);
                checkCmd.Parameters.AddWithValue("@userId", userId);

                conn.Open();
                int studentExists = (int)checkCmd.ExecuteScalar();
                conn.Close();

                if (studentExists == 0)
                {
                    lblMessage.Text = "Student record not found. Please complete your profile first.";
                    lblMessage.CssClass = "message-label error";
                    lblMessage.Visible = true;
                    return;
                }
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string insertQuery = @"INSERT INTO Enrollments (StudentID, CourseID) 
                           VALUES (@StudentID, @CourseID);
                           SELECT SCOPE_IDENTITY()";

                SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                insertCmd.Parameters.AddWithValue("@StudentID", userId);
                insertCmd.Parameters.AddWithValue("@CourseID", CourseID);

                try
                {
                    conn.Open();
                    object insertedId = insertCmd.ExecuteScalar();
                    int enrollmentId = Convert.ToInt32(insertedId);
                    ViewState["EnrollmentID"] = enrollmentId;

                    Response.Redirect($"~/Payment/Payment.aspx?CourseID={CourseID}&EnrollmentID={enrollmentId}", true);
                }
                catch (SqlException ex)
                {
                    lblMessage.Text = "Enrollment failed: " + ex.Message;
                    lblMessage.CssClass = "message-label error";
                    lblMessage.Visible = true;
                }
            }
        }
    }
}
