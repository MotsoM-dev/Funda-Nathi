using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Runtime.Remoting.Contexts;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace EducationProject
{
	public class Auth
	{
        private string connectionString;

        public Auth()
        {
            connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;
        }

        public bool IsValidEmail(string email)
        {
            try
            {
                var addr = new MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(bytes).Replace("-", "").ToLower();
            }
        }

        public bool EmailExists(string email)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        public bool RegisterUser(string userName,  string gender, string email, string password, string userRole, out string message)
        {
            message = "";

            if (EmailExists(email))
            {
                message = "Email is already registered.";
                return false;
            }

            string hashedPassword = HashPassword(password);
            bool isTutor = userRole.ToLower() == "tutor";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string insertQuery = @"INSERT INTO Users (UserName, Gender, Email, PasswordHash, UserRole, IsTutor)
                                       VALUES (@UserName,  @Gender, @Email, @PasswordHash, @UserRole, @IsTutor)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@UserName", userName);
                    
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                    cmd.Parameters.AddWithValue("@UserRole", userRole);
                    cmd.Parameters.AddWithValue("@IsTutor", isTutor);

                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        message = "Registration successful!";
                        return true;
                    }
                    else
                    {
                        message = "Error occurred while registering.";
                        return false;
                    }
                }
            }
        }

        public bool AuthenticateUser(string email, string password, out int userId, out string userRole, out string userName)
        {
            userId = 0;
            userRole = null;
            userName = "";
            string hashedPassword = HashPassword(password);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserID, UserName, UserRole FROM Users WHERE Email = @Email AND PasswordHash = @PasswordHash";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    userId = Convert.ToInt32(reader["UserID"]);
                    userRole = reader["UserRole"].ToString();
                    userName = reader["UserName"].ToString();

                    HttpContext.Current.Session["UserID"] = userId;
                    HttpContext.Current.Session["UserRole"] = userRole;
                    HttpContext.Current.Session["UserName"] = userName;
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}