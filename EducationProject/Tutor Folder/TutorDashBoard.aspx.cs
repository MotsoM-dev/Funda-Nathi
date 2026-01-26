using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Controls;


namespace EducationProject
{
        public partial class TutorDashBoard : System.Web.UI.Page
        {
            
            string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                if (Session["UserID"] == null)
                {
                    Response.Redirect("~/Authentication/Auth.aspx");
                    return;
                }

                if (Session["UserName"] != null)
                {
                    lblTutorName.Text = Session["UserName"].ToString();
                }
                else
                {
                    lblTutorName.Text = Session["UserName"].ToString();
                }
                LoadDocx();
            }
        }


        private void LoadDocx()
        {
            int userID = Convert.ToInt32(Session["UserID"].ToString());

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT DocumentID, FileName, UploadDate FROM TutorDocuments WHERE UserID = @UserID";
                ; 
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserID", userID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

  
        protected void lnkView_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string documentId = btn.CommandArgument;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "SELECT FileName, ContentType, FileData FROM TutorDocuments WHERE DocumentID = @DocumentID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@DocumentID", documentId);
                con.Open();

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    byte[] fileData = (byte[])reader["FileData"];
                    string fileName = reader["FileName"].ToString();
                    string contentType = reader["ContentType"].ToString();

                    Response.Clear();
                    Response.Buffer = true;
                    Response.Charset = "";
                    Response.ContentType = contentType;
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                    Response.BinaryWrite(fileData);
                    Response.Flush();
                    Response.End();
                }
                reader.Close();
            }
        }


        protected void lnkSelect_Click(object sender, EventArgs e)
            {
                LinkButton btn = (LinkButton)sender;
                string fileName = btn.CommandArgument;

                Session["SelectedFileName"] = fileName;
                Response.Redirect("UploadCourse.aspx");
            }

            protected void gvDocuments_RowEditing(object sender, GridViewEditEventArgs e)
            {
                gvDocuments.EditIndex = e.NewEditIndex;
                BindDocuments(); 
            }

            protected void gvDocuments_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                gvDocuments.EditIndex = -1;
                BindDocuments();
            }

            protected void gvDocuments_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                int documentId = Convert.ToInt32(gvDocuments.DataKeys[e.RowIndex].Value);
                GridViewRow row = gvDocuments.Rows[e.RowIndex];
               

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString))
                {
                    string query = "UPDATE TutorDocuments SET FileName = @FileName WHERE DocumentID = @DocumentID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                gvDocuments.EditIndex = -1;
                BindDocuments();
            }

            protected void gvDocuments_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
                int documentId = Convert.ToInt32(gvDocuments.DataKeys[e.RowIndex].Value);

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString))
                {
                    string query = "DELETE FROM TutorDocuments WHERE DocumentID = @DocumentID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@DocumentID", documentId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                BindDocuments();
            }

            private void BindDocuments()
            {
                int userId = Convert.ToInt32(Session["UserID"]); 
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString))
                {
                    string query = "SELECT DocumentID, FileName, UploadDate FROM TutorDocuments WHERE UserID = @UserID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvDocuments.DataSource = dt;
                    gvDocuments.DataBind();
                }
            }

           

        }
    }