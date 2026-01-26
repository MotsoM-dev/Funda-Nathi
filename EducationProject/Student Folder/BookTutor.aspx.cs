using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace EducationProject
{
    public partial class BookTutor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEnrolledSubjects();
            }
        }

        private void LoadEnrolledSubjects()
        {
            int studentId = Session["StudentID"] != null ? Convert.ToInt32(Session["StudentID"]) : 1;
            string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT DISTINCT c.CourseID, c.CourseName
            FROM Enrollments e
            INNER JOIN Courses c ON e.CourseID = c.CourseID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@StudentID", studentId);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    ddlSubjects.DataSource = dt;
                    ddlSubjects.DataTextField = "CourseName";
                    ddlSubjects.DataValueField = "CourseID";
                    ddlSubjects.DataBind();

                    ddlSubjects.Items.Insert(0, new ListItem("-- Select Subject --", ""));
                }
            }
        }

        protected void ddlSubjects_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedSubject = ddlSubjects.SelectedItem.Text;

            if (selectedSubject != "-- Select Subject --")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT TutorID, FirstName FROM Tutors WHERE ModuleName = @ModuleName";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@ModuleName", selectedSubject);

                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    ddlTutor.DataSource = dt;
                    ddlTutor.DataTextField = "FirstName";
                    ddlTutor.DataValueField = "TutorID";
                    ddlTutor.DataBind();

                    ddlTutor.Items.Insert(0, new ListItem("-- Select Tutor --", ""));
                }
            }
        }

        protected void ddlTutor_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedTutorID = ddlTutor.SelectedValue;

            if (!string.IsNullOrEmpty(selectedTutorID))
            {
                try
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string query = "SELECT SESSIONDATE, SESSIONTIME FROM Tutors WHERE TutorID = @TutorID";
                        SqlCommand command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@TutorID", selectedTutorID);

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.Read())
                        {
                            object sessionDateObj = reader["SESSIONDATE"];
                            object sessionTimeObj = reader["SESSIONTIME"];

                            if (sessionDateObj != DBNull.Value)
                            {
                                DateTime sessionDate = Convert.ToDateTime(sessionDateObj);
                                calDate.SelectedDate = sessionDate;
                                calDate.VisibleDate = sessionDate;
                            }
                            else
                            {
                                calDate.SelectedDates.Clear();
                            }

                            ddlSessionTime.Items.Clear();
                            if (sessionTimeObj != DBNull.Value)
                            {
                                string sessionTime = sessionTimeObj.ToString();
                                ddlSessionTime.Items.Add(new ListItem(sessionTime, sessionTime));
                            }
                            else
                            {
                                ddlSessionTime.Items.Add(new ListItem("No session time available", ""));
                            }
                        }
                        else
                        {
                            lblMessage.Text = "No session data found for this tutor.";
                        }

                        reader.Close();
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }





        protected void calDate_SelectionChanged(object sender, EventArgs e)
        {
            // Optional: Implement if date selection should trigger something
        }

        protected void btnBookNow_Click(object sender, EventArgs e)
        {
           
        }
    }
}
