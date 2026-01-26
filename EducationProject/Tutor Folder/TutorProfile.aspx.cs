using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
namespace EducationProject
{
        public partial class ManageProfile : System.Web.UI.Page
        {

            string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    LoadTutorProfile();
                }
            }

            private void LoadTutorProfile()
            {

                int tutorId = GetLoggedInTutorId();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT FirstName, LastName, Gender, Email FROM Users WHERE UserID = @UserID AND IsTutor = 1";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserID", tutorId);

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtFirstName.Text = reader["FirstName"].ToString();
                        txtLastName.Text = reader["LastName"].ToString();
                        ddlGender.SelectedValue = reader["Gender"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                    }
                }
            }
            protected void btnUpdate_Click(object sender, EventArgs e)
            {
                string username = txtUserName.Text;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString))
                {
                    string query = @"UPDATE [Users] 
                         SET FirstName = @FirstName, LastName = @LastName, 
                             Email = @Email, Gender = @Gender, 
                             IsTutor = @IsTutor
                         WHERE UserName = @UserName";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@IsTutor", true); // Always register/update as tutor
                    cmd.Parameters.AddWithValue("@UserName", username);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                    lblMessage.Text = "Profile updated successfully!";
                }
                Response.Redirect("TutorDashboard.aspx");
            }

            protected void btnSave_Click(object sender, EventArgs e)
            {
                int tutorId = GetLoggedInTutorId();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string updateQuery = @"
                    UPDATE Users
                    SET FirstName = @FirstName,
                        LastName = @LastName,
                        Gender = @Gender,
                        Email = @Email
                    WHERE UserID = @UserID AND IsTutor = 1";

                    SqlCommand cmd = new SqlCommand(updateQuery, con);
                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@UserID", tutorId);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    lblMessage.Text = rowsAffected > 0 ? "Profile updated successfully." : "Error updating profile.";
                }
            }

            private int GetLoggedInTutorId()
            {
                // Placeholder logic: Replace this with real authentication/session logic
                if (Session["UserID"] != null)
                {
                    return Convert.ToInt32(Session["UserID"]);
                }
                else
                {
                    Response.Redirect("~/Auth.aspx");
                    return 0;
                }
            }
        }
    }