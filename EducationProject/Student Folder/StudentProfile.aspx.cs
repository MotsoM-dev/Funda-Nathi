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
            int studentID = Convert.ToInt32(Session["StudentID"]); // Ensure TutorID is stored in session
            int studentNo = Convert.ToInt32(Session["StudentNo"]); // Ensure TutorID is stored in session
            string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        conn.Open();

        //        string insertQuery = @"
        //INSERT INTO Students (FirstName, LastName, StudentNo, Degree, Institution) 
        //VALUES (@FirstName, @LastName, @StudentNo, @Degree, @Institution)";

        //        SqlCommand cmd = new SqlCommand(insertQuery, conn);
        //        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
        //        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
        //        cmd.Parameters.AddWithValue("@StudentNo", txtStudentNo.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Degree", txtDegree.Text.Trim());
        //        cmd.Parameters.AddWithValue("@Institution", txtInstitution.Text.Trim());

        //        int rowsAffected = cmd.ExecuteNonQuery();

        //        if (rowsAffected > 0)
        //        {
        //            lblMessage.Text = "Student information inserted successfully.";
        //        }
        //        else
        //        {
        //            lblMessage.Text = "Failed to insert student information.";
        //        }
            //}

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            {
                if (string.IsNullOrWhiteSpace(txtFirstName.Text) ||
                    string.IsNullOrWhiteSpace(txtLastName.Text) ||
                    string.IsNullOrWhiteSpace(txtStudentNo.Text) ||
                    string.IsNullOrWhiteSpace(txtDegree.Text) ||
                    string.IsNullOrWhiteSpace(txtInstitution.Text))
                {
                    lblMessage.Text = "Please fill in all fields.";
                    return;
                }

                string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string insertQuery = @"
                    INSERT INTO Students (FirstName, LastName, StudentNo, Degree, Institution) 
                    VALUES (@FirstName, @LastName, @StudentNo, @Degree, @Institution)";

                    SqlCommand cmd = new SqlCommand(insertQuery, conn);
                    cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                    cmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                    cmd.Parameters.AddWithValue("@StudentNo", txtStudentNo.Text.Trim());
                    cmd.Parameters.AddWithValue("@Degree", txtDegree.Text.Trim());
                    cmd.Parameters.AddWithValue("@Institution", txtInstitution.Text.Trim());

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Student information inserted successfully.";
                    }
                    else
                    {
                        lblMessage.Text = "Failed to insert student information.";
                    }

                    Response.Redirect("~/Student Folder/StudentDashBoard.aspx");
                }
            }

        }
    }
}