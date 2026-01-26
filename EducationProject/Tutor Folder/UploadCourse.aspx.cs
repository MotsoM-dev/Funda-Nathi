using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Documents;

namespace EducationProject
{
	public partial class UploadCourses : System.Web.UI.Page
    {
            protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TutorName"] != null)
                {
                    txtInstructor.Text = Session["TutorName"].ToString();
                }

                if (Session["SelectedFileName"] != null)
                {
                    txtCourseDescription.Text = "Document: " + Session["SelectedFileName"].ToString();
                }

                if (Session["SelectedCourseName"] != null)
                {
                    txtCourseName.Text = Session["SelectedCourseName"].ToString();
                }
            }
        }

            protected void btnSubmit_Click(object sender, EventArgs e)
            {
                if (Page.IsValid)
                {
                    try
                    {
                        if (!decimal.TryParse(txtCourseFee.Text, out decimal courseFee))
                        {
                            ShowMessage("Invalid course fee format.", "danger");
                            return;
                        }

                        string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;
                        string imagePath = SaveUploadedFile(fileImageUrl);

                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            string query = @"INSERT INTO [dbo].[Courses] 
                                       ([CourseName], [CourseDescription], [CourseFee], 
                                        [Instructor], [Title], [ImageUrl])
                                       VALUES 
                                       (@CourseName, @CourseDescription, @CourseFee, 
                                        @Instructor, @Title, @ImageUrl)"; // ✅ Removed extra comma

                            using (SqlCommand cmd = new SqlCommand(query, con))
                            {
                                cmd.Parameters.AddWithValue("@CourseName", txtCourseName.Text.Trim());
                                cmd.Parameters.AddWithValue("@CourseDescription", txtCourseDescription.Text.Trim());
                                cmd.Parameters.AddWithValue("@CourseFee", courseFee);
                                cmd.Parameters.AddWithValue("@Instructor", txtInstructor.Text.Trim());
                                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                                cmd.Parameters.AddWithValue("@ImageUrl", imagePath);

                                con.Open();
                                cmd.ExecuteNonQuery();
                            }
                        }

                        ShowMessage("Course uploaded successfully!", "success");
                        ClearForm();
                    }
                    catch (Exception ex)
                    {
                        ShowMessage("Error: " + ex.Message, "danger");
                    }
                }
            }

            protected void btnUploadDoc_Click(object sender, EventArgs e)
            {
                try
                {
                    if (fileDocument.HasFile)
                    {
                        string[] allowedExts = { ".pdf", ".docx", ".jpg", ".jpeg", ".png" };
                        string ext = Path.GetExtension(fileDocument.FileName).ToLower();

                        if (!allowedExts.Contains(ext))
                            throw new Exception("Invalid file type. Only PDF, DOCX, JPG, PNG are allowed.");

                        if (fileDocument.PostedFile.ContentLength > 5 * 1024 * 1024)
                            throw new Exception("File too large. Max size is 5MB.");

                        byte[] fileBytes = fileDocument.FileBytes;
                        string fileName = Path.GetFileName(fileDocument.FileName);
                        string contentType = fileDocument.PostedFile.ContentType;

                        string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            string query = @"INSERT INTO TutorDocuments (UserID, FileName, ContentType, FileData, UploadDate)
                                         VALUES (@UserID, @FileName, @ContentType, @FileData, @UploadDate)";

                            using (SqlCommand cmd = new SqlCommand(query, con))
                            {
                                cmd.Parameters.AddWithValue("@UserID", Session["UserID"] ?? DBNull.Value);
                                cmd.Parameters.AddWithValue("@FileName", fileName);
                                cmd.Parameters.AddWithValue("@ContentType", contentType);
                                cmd.Parameters.AddWithValue("@FileData", fileBytes);
                                cmd.Parameters.AddWithValue("@UploadDate", DateTime.Now);

                                con.Open();
                                cmd.ExecuteNonQuery();
                            }
                        }

                        lblUploadStatus.Text = "Document uploaded successfully!";
                        lblUploadStatus.CssClass = "alert alert-success";
                    }
                    else
                    {
                        lblUploadStatus.Text = "Please select a document to upload.";
                        lblUploadStatus.CssClass = "alert alert-danger";
                    }
                }
                catch (Exception ex)
                {
                    lblUploadStatus.Text = "Upload failed: " + ex.Message;
                    lblUploadStatus.CssClass = "alert alert-danger";
                }
            }

            private string SaveUploadedFile(FileUpload fileUpload)
            {
                if (fileUpload.HasFile)
                {
                    try
                    {
                        string fileExtension = Path.GetExtension(fileUpload.FileName).ToLower();
                        string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };

                        if (!allowedExtensions.Contains(fileExtension))
                            throw new Exception("Only image files (JPG, JPEG, PNG, GIF) are allowed.");

                        if (fileUpload.PostedFile.ContentLength > 5242880)
                            throw new Exception("Maximum file size exceeded (5MB maximum).");

                        string newFileName = Guid.NewGuid().ToString() + fileExtension;
                        string uploadPath = Server.MapPath("~/Uploads/Courses/");

                        if (!Directory.Exists(uploadPath))
                            Directory.CreateDirectory(uploadPath);

                        string filePath = Path.Combine(uploadPath, newFileName);
                        fileUpload.SaveAs(filePath);

                        return "/Uploads/Courses/" + newFileName;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("File upload failed: " + ex.Message);
                    }
                }
                throw new Exception("Please select a thumbnail image for the course.");
            }

            private void ShowMessage(string message, string type)
            {
                lblMessage.Text = message;
                lblMessage.Visible = true;
                lblMessage.CssClass = $"alert alert-{type}";
            }

            private void ClearForm()
            {
                txtCourseName.Text = string.Empty;
                txtCourseDescription.Text = string.Empty;
                txtCourseFee.Text = string.Empty;
                txtInstructor.Text = string.Empty;
                txtTitle.Text = string.Empty;
            }
        }

    }