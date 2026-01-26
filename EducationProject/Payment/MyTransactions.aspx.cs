using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace EducationProject.Payment
{
    public partial class MyTransactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblPaymentDate.InnerText = DateTime.Now.ToString("f");
                lblPaymentMethod.InnerText = "Credit Card •••• 4242";

                string courseId = Request.QueryString["courseId"];

                if (Session["PaidAmount"] == null && !string.IsNullOrEmpty(courseId))
                {
                    LoadPaymentAmount(courseId);
                }

                decimal paidAmount = 0m;
                if (Session["PaidAmount"] != null)
                {
                    decimal.TryParse(Session["PaidAmount"].ToString(), out paidAmount);
                }
                lblAmount.InnerText = "R" + paidAmount.ToString("N2");
            }
        }

        private void LoadPaymentAmount(string courseId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"SELECT CourseFee FROM Courses WHERE CourseID = @CourseID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CourseID", courseId);

                try
                {
                    con.Open();
                    object fee = cmd.ExecuteScalar();
                    if (fee != null)
                    {
                        decimal courseFee = 0m;
                        decimal.TryParse(fee.ToString(), out courseFee);
                        Session["PaidAmount"] = courseFee;
                    }
                    else
                    {
                        Session["PaidAmount"] = 0m;
                    }
                }
                catch (Exception ex)
                {
                    // TODO: Log error if needed
                    Session["PaidAmount"] = 0m;
                }
            }
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                Document document = new Document(PageSize.A4, 50, 50, 25, 25);
                PdfWriter writer = PdfWriter.GetInstance(document, ms);
                writer.CloseStream = false;

                document.Open();

                // Create heading paragraph
                Font headingFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18);
                Paragraph heading = new Paragraph("Enrollment Receipt", headingFont);
                heading.Alignment = Element.ALIGN_CENTER;
                document.Add(heading);
                document.Add(new Chunk("\n"));

                // Create table with 2 columns
                PdfPTable table = new PdfPTable(2);
                table.WidthPercentage = 80;
                table.HorizontalAlignment = Element.ALIGN_CENTER;
                table.SpacingBefore = 10f;

                // Add cells
                table.AddCell("Reference No:");
                table.AddCell("EDU-" + DateTime.Now.ToString("yyyyMMddHHmm"));

                table.AddCell("Amount Paid:");
                table.AddCell(lblAmount.InnerText);

                table.AddCell("Payment Date:");
                table.AddCell(lblPaymentDate.InnerText);

                table.AddCell("Payment Method:");
                table.AddCell(lblPaymentMethod.InnerText);

                document.Add(table);
                document.Close();

                // Send PDF to client browser
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=Receipt.pdf");
                Response.OutputStream.Write(ms.GetBuffer(), 0, (int)ms.Length);
                Response.OutputStream.Flush();
                Response.End();
            }
        }

        protected void btnDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Student Folder/StudentDashboard.aspx");
        }
    }
}     



