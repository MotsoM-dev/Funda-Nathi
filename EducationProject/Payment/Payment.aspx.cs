using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EducationProject.Payment
{
	public partial class Payment : System.Web.UI.Page
	{
        private string connectionString = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set StudentId from logged-in session (here hardcoded for demo)
                if (Session["StudentID"] == null)
                {
                    LoadAmountPayed();
                }


                
            }
        }

        private void LoadAmountPayed()
        {
            //if (Session["StudentID"] == null)
            //{
            //    lblMessage.Text = "Session expired. Please log in again.";
            //    return;
            //}

            int studentId = Convert.ToInt32(Session["StudentID"]);

            string query = @"
    SELECT CourseFee
    FROM Courses
";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Declare the parameter correctly
                   // cmd.Parameters.AddWithValue("@StudentID", studentId);

                    try
                    {
                        con.Open();
                        object result = cmd.ExecuteScalar(); // Gets the first CourseFee

                        if (result != null && result != DBNull.Value)
                        {
                            decimal courseFee = Convert.ToDecimal(result);
                            Session["CourseFee"] = courseFee;
                            txtAmount.Text = courseFee.ToString("F2");
                        }
                        else
                        {
                            lblMessage.Text = "You are not currently enrolled in any courses.";
                            txtAmount.Text = "0.00";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error fetching course information: " + ex.Message;
                    }
                }
            }



        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["myDBFundaNathi"].ConnectionString;

            Session["PaidAmount"] = txtAmount.Text.Trim();

            if (string.IsNullOrWhiteSpace(txtCardName.Text) ||
                  string.IsNullOrWhiteSpace(txtCardNumber.Text) ||
                   ddlExpiryMonth.SelectedValue == "" ||
                     ddlExpiryYear.SelectedValue == "" ||
                     string.IsNullOrWhiteSpace(txtCVV.Text) ||
                  string.IsNullOrWhiteSpace(txtAmount.Text))
            {
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            // 2. Validate amount
            if (!decimal.TryParse(txtAmount.Text, out decimal amount))
            {
                lblMessage.Text = "Please enter a valid amount.";
                return;
            }

            // 3. Check session
            //if (Session["StudentID"] == null)
            //{
            //    lblMessage.Text = "Session expired. Please log in again.";
            //    return;
            //}

            int studentId = Convert.ToInt32(Session[""]);

            ////4.Check enrollment ID
            //if (ViewState["EnrollmentID"] == null)
            //{
            //    lblMessage.Text = "Enrollment record not found.";
            //    return;
            //}

            //int enrollmentId = Convert.ToInt32(ViewState["EnrollmentID"]);

            // 5. Database operation
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlTransaction transaction = con.BeginTransaction();

                try
                {
                    // Insert payment
                    string paymentInsert = @"
                INSERT INTO Payments (UserID, CardName, Amount, PaymentDate) 
                VALUES (@UserID, @CardName, @Amount, @PaymentDate);
                SELECT SCOPE_IDENTITY();";

                    SqlCommand paymentCmd = new SqlCommand(paymentInsert, con, transaction);
                    paymentCmd.Parameters.AddWithValue("@UserID", studentId);
                    paymentCmd.Parameters.AddWithValue("@CardName", txtCardName.Text.Trim());
                    paymentCmd.Parameters.AddWithValue("@Amount", amount);
                    paymentCmd.Parameters.AddWithValue("@PaymentDate", DateTime.Now);

                    object insertedPaymentIdObj = paymentCmd.ExecuteScalar();
                    int paymentId = Convert.ToInt32(insertedPaymentIdObj);



                    // Commit transaction
                    // Commit transaction
                    transaction.Commit();

                    // Redirect or show success message
                    Response.Redirect("~/Payment/MyTransactions.aspx", false);
                    Context.ApplicationInstance.CompleteRequest();
                    return;

                }
                catch (Exception ex)
                {
                    if (transaction.Connection != null)
                    {
                        transaction.Rollback();
                    }
                    lblMessage.Text = "Payment failed. Error: " + ex.Message;
                }

            }
        }
    }
    
}