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
            private readonly string connectionString;

            public Auth()
            {
                connectionString = ConfigurationManager
                    .ConnectionStrings["myDBFundaNathi"]
                    .ConnectionString;
            }

            // ================= EMAIL VALIDATION =================
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

            // ================= PASSWORD HASHING =================
            public string HashPassword(string password)
            {
                using (SHA256 sha256 = SHA256.Create())
                {
                    byte[] bytes = sha256.ComputeHash(
                        Encoding.UTF8.GetBytes(password)
                    );
                    return BitConverter.ToString(bytes)
                        .Replace("-", "")
                        .ToLower();
                }
            }

            // ================= CHECK EMAIL EXISTS =================
            public bool EmailExists(string email)
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        conn.Open();
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }

            // ================= REGISTER USER =================
            public bool RegisterUser(string userName, string gender, string email,
                                     string password, string userRole,
                                     out string message)
            {
                message = "";

                if (!IsValidEmail(email))
                {
                    message = "Invalid email format.";
                    return false;
                }

                if (EmailExists(email))
                {
                    message = "Email is already registered.";
                    return false;
                }

                string hashedPassword = HashPassword(password);

                // Convert gender to CHAR(1)
                char genderChar = 'O';
                switch (gender.ToLower())
                {
                    case "male":
                        genderChar = 'M';
                        break;
                    case "female":
                        genderChar = 'F';
                        break;
                    case "other":
                        genderChar = 'O';
                        break;
                }

                bool isTutor = userRole.ToLower() == "tutor";

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string insertQuery = @"
                    INSERT INTO Users 
                    (Email, PasswordHash, UserName, Gender, UserRole, 
                     IsTutor, IsActive, EmailVerified, CreatedDate)
                    VALUES 
                    (@Email, @PasswordHash, @UserName, @Gender, @UserRole, 
                     @IsTutor, 1, 0, SYSUTCDATETIME())";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                        cmd.Parameters.AddWithValue("@UserName", userName);
                        cmd.Parameters.AddWithValue("@Gender", genderChar);
                        cmd.Parameters.AddWithValue("@UserRole", userRole.ToLower());
                        cmd.Parameters.AddWithValue("@IsTutor", isTutor);

                        conn.Open();
                        int rows = cmd.ExecuteNonQuery();

                        if (rows > 0)
                        {
                            message = "Registration successful!";
                            return true;
                        }
                        else
                        {
                            message = "Registration failed.";
                            return false;
                        }
                    }
                }
            }

            // ================= AUTHENTICATE USER =================
            public bool AuthenticateUser(string email, string password,
                                         out int userId,
                                         out string userRole,
                                         out string userName)
            {
                userId = 0;
                userRole = "";
                userName = "";

                string hashedPassword = HashPassword(password);

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = @"
                    SELECT UserID, UserName, UserRole 
                    FROM Users 
                    WHERE Email = @Email 
                    AND PasswordHash = @PasswordHash
                    AND IsActive = 1";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);

                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            userId = Convert.ToInt32(reader["UserID"]);
                            userName = reader["UserName"].ToString();
                            userRole = reader["UserRole"].ToString();

                            reader.Close();

                            // Update LastLogin
                            SqlCommand updateCmd = new SqlCommand(
                                "UPDATE Users SET LastLogin = SYSUTCDATETIME() WHERE UserID = @UserID",
                                conn);
                            updateCmd.Parameters.AddWithValue("@UserID", userId);
                            updateCmd.ExecuteNonQuery();

                            // Store session
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
    }