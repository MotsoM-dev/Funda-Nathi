using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EducationProject.Authentication
{
        public partial class Login : System.Web.UI.Page
        {
            private Auth auth = new Auth();

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
                        new ScriptResourceDefinition
                        {
                            Path = "https://code.jquery.com/jquery-3.6.0.min.js",
                            CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js"
                        });
                }
            }

        // ================= SIGN UP =================
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Ensure that ASP.NET validators have passed
            if (!Page.IsValid)
            {
                ShowSignUpMessage("Please fill in all fields.", true);
                return;
            }

            string userName = txtFullName.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string email = txtSignUpEmail.Text.Trim();
            string password = txtPasswordSignUp.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string userRole = ddlRole.SelectedValue;

            // Extra server-side check (optional, since validators already cover it)
            if (string.IsNullOrWhiteSpace(userName) ||
                string.IsNullOrWhiteSpace(gender) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password) ||
                string.IsNullOrWhiteSpace(confirmPassword) ||
                string.IsNullOrWhiteSpace(userRole))
            {
                ShowSignUpMessage("Please fill in all fields.", true);
                return;
            }

            if (password != confirmPassword)
            {
                ShowSignUpMessage("Passwords do not match.", true);
                return;
            }

            Auth auth = new Auth();
            if (!auth.IsValidEmail(email))
            {
                ShowSignUpMessage("Invalid email address.", true);
                return;
            }

            string message;
            bool success = auth.RegisterUser(userName, gender, email, password, userRole, out message);
            ShowSignUpMessage(message, !success);

            if (success)
            {
                // Clear the form or redirect
                Response.Redirect("Auth.aspx?message=Registration successful");
            }
        }

        private void ShowSignUpMessage(string message, bool isError)
            {
                lblSignUpMessage.ForeColor = isError
                    ? System.Drawing.Color.Red
                    : System.Drawing.Color.Green;

                lblSignUpMessage.Text = message;
                lblSignUpMessage.Visible = true;
            }

            // ================= LOGIN =================
            protected void btnLogin_Click(object sender, EventArgs e)
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text;

                if (string.IsNullOrWhiteSpace(email) ||
                    string.IsNullOrWhiteSpace(password))
                {
                    ShowError("Please enter both email and password.");
                    return;
                }

                int userId;
                string userRole;
                string userName;

                bool success = auth.AuthenticateUser(
                    email,
                    password,
                    out userId,
                    out userRole,
                    out userName
                );

                if (success)
                {
                    // Store session cleanly
                    Session["UserID"] = userId;
                    Session["UserEmail"] = email;
                    Session["UserRole"] = userRole;
                    Session["UserName"] = userName;

                    // Normalize role for safety
                    string role = userRole.ToLower();

                    if (role == "student")
                    {
                        Response.Redirect("~/Student Folder/StudentProfile.aspx", false);
                    }
                    else if (role == "tutor")
                    {
                        Session["TutorID"] = userId;
                        Response.Redirect("~/Tutor Folder/TutorProfile.aspx", false);
                    }
                    else
                    {
                        ShowError("Account role not recognized.");
                    }
                }
                else
                {
                    ShowError("Invalid login credentials or inactive account.");
                }
            }

            private void ShowError(string message)
            {
                lblError.Text = message;
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Visible = true;
            }
        }
    }