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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {
                // Register jQuery CDN for unobtrusive validation
                ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
                {
                    Path = "https://code.jquery.com/jquery-3.6.0.min.js",
                    CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js"
                });
                // Optionally set initial form visibility based on query string
                string action = Request.QueryString["action"]?.ToLower();
                if (action == "signup")
                {
                    // JavaScript will handle sliding
                }
                
            }
        }


        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            // Use the correct control IDs that match your ASPX page
            string userName = txtFullName.Text.Trim();
         
            string gender = ddlGender.SelectedValue;
            string email = txtSignUpEmail.Text.Trim(); // Changed from txtEmail to txtSignUpEmail
            string password = txtPasswordSignUp.Text;   // Changed from txtPassword to txtPasswordSignUp
            string confirmPassword = txtConfirmPassword.Text;
            string userRole = ddlRole.SelectedValue;

            // Validation
            if (string.IsNullOrWhiteSpace(userName) ||
             
                string.IsNullOrWhiteSpace(gender) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrWhiteSpace(password) ||
                string.IsNullOrWhiteSpace(confirmPassword) ||
                string.IsNullOrWhiteSpace(userRole))
            {
                ShowSignUpMessage("Please fill in all the fields.", true);
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

        // Add this new method for sign-up messages
        private void ShowSignUpMessage(string message, bool isError)
        {
            lblSignUpMessage.ForeColor = isError ? System.Drawing.Color.Red : System.Drawing.Color.Green;
            lblSignUpMessage.Text = message;
            lblSignUpMessage.Visible = true;
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
            {
                ShowError("Please enter both email and password.");
                return;
            }

            Auth auth = new Auth();
            int userId;
            string userRole;
            string userName;

            if (auth.AuthenticateUser(email, password, out userId, out userRole, out userName))
            {
                Session["UserID"] = userId;
                Session["UserEmail"] = email;
                Session["userRole"] = userRole;
                Session["UserName"] = userName;


                switch (userRole)
                {
                    case "Student":
                        Response.Redirect("~/Student Folder/StudentProfile.aspx");
                        break;

                    case "Tutor":
                        Session["TutorID"] = userId; // ✅ Set TutorID for TutorProfile
                        Response.Redirect("~/Tutor Folder/TutorProfile.aspx");
                        break;

                   

                    default:
                        ShowError("Unknown role. Please contact support.");
                        break;
                }
            }
            else
            {
                ShowError("Invalid login credentials.");
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