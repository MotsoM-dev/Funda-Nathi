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
    public partial class StudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }
        private void LoadProfile()
        {
            if (Session["UserID"] == null)
                return;

            int userId = Convert.ToInt32(Session["UserID"]);
            string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string query = "SELECT StudentNo, Degree, Institution FROM Students WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userId);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    txtStudentNo.Text = reader["StudentNo"].ToString();
                    txtDegree.Text = reader["Degree"].ToString();
                    txtInstitution.Text = reader["Institution"].ToString();
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("~/Authentication/Auth.aspx");
                return;
            }

            if (string.IsNullOrWhiteSpace(txtStudentNo.Text) ||
                string.IsNullOrWhiteSpace(txtDegree.Text) ||
                string.IsNullOrWhiteSpace(txtInstitution.Text))
            {
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            int userId = Convert.ToInt32(Session["UserID"]);
            string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Check if profile already exists
                string checkQuery = "SELECT COUNT(*) FROM Students WHERE UserID = @UserID";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@UserID", userId);

                int count = (int)checkCmd.ExecuteScalar();

                if (count == 0)
                {
                    // INSERT
                    string insertQuery = @"INSERT INTO Students (UserID, StudentNo, Degree, Institution)
                                   VALUES (@UserID, @StudentNo, @Degree, @Institution)";

                    SqlCommand cmd = new SqlCommand(insertQuery, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@StudentNo", txtStudentNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@Degree", txtDegree.Text.Trim());
                    cmd.Parameters.AddWithValue("@Institution", txtInstitution.Text.Trim());

                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Profile created successfully.";
                }
                else
                {
                    // UPDATE
                    string updateQuery = @"UPDATE Students 
                                   SET StudentNo = @StudentNo,
                                       Degree = @Degree,
                                       Institution = @Institution
                                   WHERE UserID = @UserID";

                    SqlCommand cmd = new SqlCommand(updateQuery, conn);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@StudentNo", txtStudentNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@Degree", txtDegree.Text.Trim());
                    cmd.Parameters.AddWithValue("@Institution", txtInstitution.Text.Trim());

                    cmd.ExecuteNonQuery();
                    lblMessage.Text = "Profile updated successfully.";
                }
            }

            Response.Redirect("~/Student Folder/StudentDashBoard.aspx");
        }
    }
}