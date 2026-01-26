using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace EducationProject
{
	public partial class ViewCourses : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindCourses();
                LoadCourses();
            }
        }
        private void LoadCourses(string keyword = "")
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = @"
SELECT 
    CourseID, 
    CourseName, 
    CourseDescription, 
    CourseFee,
     Instructor,
    ImageUrl,
     Title
  
FROM Courses";

                    if (!string.IsNullOrWhiteSpace(keyword))
                    {
                        query += " WHERE (CourseName LIKE @Keyword OR CourseDescription LIKE @Keyword)";
                    }

                    SqlCommand cmd = new SqlCommand(query, conn);
                    if (!string.IsNullOrWhiteSpace(keyword))
                    {
                        cmd.Parameters.AddWithValue("@Keyword", "%" + keyword + "%");
                    }

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                   
                    if (!dt.Columns.Contains("Department"))
                        dt.Columns.Add("Department", typeof(string));
                    if (!dt.Columns.Contains("Credits"))
                        dt.Columns.Add("Credits", typeof(int));
                    if (!dt.Columns.Contains("ImageUrlFinal"))
                        dt.Columns.Add("ImageUrlFinal", typeof(string));

                    foreach (DataRow row in dt.Rows)
                    {
                        string courseName = row["CourseName"].ToString().Trim().ToLower();
                        string imageUrl = row["ImageUrl"].ToString();

                        
                        if (courseName.Contains("sociology"))
                        {
                            row["Department"] = "Social Science";
                            row["Credits"] = 8;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1405779000/photo/school-psychologist-talking-to-difficult-teenager.jpg?s=612x612&w=0&k=20&c=slPG9MEaZwFlAOlg1dwzgEw7o1BKLuNs-ImLrfxqBTs=";
                        }
                        else if (courseName.Contains("systems development"))
                        {
                            row["Department"] = "Information Systems";
                            row["Credits"] = 16;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1979289147/photo/data-analysis-science-and-big-data-with-ai-technology-analyst-or-scientist-uses-a-computer.jpg?s=612x612&w=0&k=20&c=vmC-jVG6PNPRQtgtBp2y1caApEGYjt-fDrm0VzRgvK8=";
                        }
                        else if (courseName.Contains("systems analysis"))
                        {
                            row["Department"] = "Information Systems";
                            row["Credits"] = 5;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1867035079/photo/analytics-and-data-management-systems-business-analytics-and-data-management-systems-to-make.jpg?s=612x612&w=0&k=20&c=tFcJnBIWlkPhIumrPtkSJwFRNDMtdVfJ1CYbfUlx5fE=";
                        }
                        else if (courseName.Contains("Essentials of IS (Information Systems)"))
                        {
                            row["Department"] = "Information Systems";
                            row["Credits"] = 16;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1058262630/vector/creation-responsive-internet-website-for-multiple-platforms-building-mobile-interface-on.jpg?s=612x612&w=0&k=20&c=BwGASPtAVnQu9_l-g7R-jW9gRxCQsmSMtRsA-jDPQz0=";
                        }
                        else if (courseName.Contains("business management"))
                        {
                            row["Department"] = "Business";
                            row["Credits"] = 16;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1333390975/photo/diverse-corporate-team-working-together-in-modern-meeting-room-office.jpg?s=612x612&w=0&k=20&c=0cHknLp7plnsAJqhyMaQ-tKq1-81ReCSNgAOSazJ1w8=";
                        }
                        else if (courseName.Contains("emergent technology"))
                        {
                            row["Department"] = "Information Systems";
                            row["Credits"] = 8;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1448124439/vector/web-development-programming-and-code-testing-ui-concept-with-laptop-displaying-futuristic.jpg?s=612x612&w=0&k=20&c=CXBA4DexowbvWEsyIBbiwc37h15N7fyeSpXUXGQpCpU=";
                        }
                        else if (courseName.Contains("economics"))
                        {
                            row["Department"] = "Economics";
                            row["Credits"] = 8;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://images.pexels.com/photos/6694543/pexels-photo-6694543.jpeg?auto=compress&cs=tinysrgb&w=600";
                        }
                        else if (courseName.Contains("social transformation"))
                        {
                            row["Department"] = "Humanities";
                            row["Credits"] = 12;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1345174214/photo/a-group-of-young-adult-people-are-marching-together-on-strike-against-climate-change.jpg?s=612x612&w=0&k=20&c=2FPMZUPLGq872G3lwMNmi9g3YFLGE12yE-cyL_wntFQ=";
                        }
                        else if (courseName.Contains("computer literacy"))
                        {
                            row["Department"] = "Information Technology";
                            row["Credits"] = 8;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1283342756/photo/digital-literacy-write-on-keyboard-isolated-on-laptop-background.jpg?s=612x612&w=0&k=20&c=OYwFprOxoCgKHzJTh5v--Lnip_DHkuhp9OXSO9rzuwE=";
                        }
                        else if (courseName.Contains("database"))
                        {
                            row["Department"] = "Information Technology";
                            row["Credits"] = 8;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1393858554/photo/relational-database-tables-with-server-room-and-datacenter-background-concept-of-database.jpg?s=612x612&w=0&k=20&c=UH75wLOwSjNEtpyXUcQn1Dkin2mkQ0YmYMEbhB3WOG8=";
                        }
                        else if (courseName.Contains("programming"))
                        {
                            row["Department"] = "Information Technology";
                            row["Credits"] = 8;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "https://media.istockphoto.com/id/1432248858/photo/smiling-male-programmer-explains-a-coding-technique-to-a-new-female-colleague-while-sitting.jpg?s=612x612&w=0&k=20&c=bfkrkvsjtXCp1cjJyN18w9CMF5gYgEuTAWhpYS2sbo0=";
                        }
                        else
                        {
                            row["Department"] = "General Studies";
                            row["Credits"] = 3;
                            if (string.IsNullOrEmpty(imageUrl))
                                imageUrl = "~/Images/default-course.jpg";
                        }

                        
                        row["ImageUrlFinal"] = string.IsNullOrEmpty(imageUrl) ? "~/Images/default-course.jpg" : imageUrl;
                    }

                    rptCourses.DataSource = dt;
                    rptCourses.DataBind();
                    lblMessage.Visible = dt.Rows.Count == 0;
                }
            }
            catch (Exception ex)
            {
               MessageBox.Show(ex.Message);
               
            }
        }


        private void LoadAllCourses()
        {
            LoadCourses(); 
        }


       
        protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Filter courses by department
            //BindCourses();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            
            LoadCourses(txtSearch.Text.Trim());
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadCourses(txtSearch.Text.Trim());
        }


        protected void txtSearch_TextChanged1(object sender, EventArgs e)
        {
            
            if (string.IsNullOrWhiteSpace(txtSearch.Text))
            {
                LoadAllCourses();
            }
            else
            {
                
                LoadCourses(txtSearch.Text.Trim());
            }
        }


        protected void rptCourses_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string courseId = e.CommandArgument.ToString();

            if (e.CommandName == "ViewDetails")
            {
                Response.Redirect($"~/Student Folder/CourseDetails.aspx?CourseId={courseId}");
            }
            else if (e.CommandName == "Enroll")
            {
                string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM Courses WHERE CourseID = @CourseID";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@CourseID", courseId);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["CourseID"] = reader["CourseID"].ToString();
                        Session["CourseName"] = reader["CourseName"].ToString();
                        Session["CourseDescription"] = reader["CourseDescription"].ToString();
                        Session["Instructor"] = reader["Instructor"].ToString();
                        Session["CourseFee"] = reader["CourseFee"].ToString();

                        // Optionally add department and credits if needed
                    }
                    reader.Close();
                }

                Response.Redirect($"~/Payment/Payment.aspx?courseId={courseId}");
            }

        }

    }

}