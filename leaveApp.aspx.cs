using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace LeaveApp
{
    public partial class leaveApp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Authenticated"] == null || !(bool)Session["Authenticated"])
            {
                Response.Redirect("Login.aspx"); 
            }
            if (!IsPostBack)
            {

            }
        }
        protected void btnSubmit_click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string email = txtEmail.Text;
            string leaveType = ddlLeaveType.SelectedValue;
            string startDate = txtStartDate.Text;
            string endDate = txtEndDate.Text;
            string reason = txtReason.Text;


            SaveLeaveApplicationToDatabase(name, email, leaveType, startDate, endDate, reason);


           
            Response.Write("<script>alert('Leave Application Submitted and Email Sent Successfully!');</script>");

        }
        private void SaveLeaveApplicationToDatabase(string name, string email, string leaveType, string startDate, string endDate, string reason)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;


            string query = "INSERT INTO LeaveApplications (Name, Email, LeaveType, StartDate, EndDate, Reason) " +
                           "VALUES (@Name, @Email, @LeaveType, @StartDate, @EndDate, @Reason)";


            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameters to the SQL command
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@LeaveType", leaveType);
                    cmd.Parameters.AddWithValue("@StartDate", DateTime.Parse(startDate));
                    cmd.Parameters.AddWithValue("@EndDate", DateTime.Parse(endDate));
                    cmd.Parameters.AddWithValue("@Reason", reason);

                    // Open the connection and execute the query
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            

            string approvalLink = $"https://localhost:44338/AdminHome.aspx?leaveId={name}"; 

            SendEmailNotification(name, email, leaveType, startDate, endDate, reason, approvalLink);

        }
        

            private void SendEmailNotification(string name, string email, string leaveType, string startDate, string endDate, string reason,string approvalLink)
                    {
                        try
                        {

                            string smtpHost = "smtp.gmail.com";
                            int smtpPort = 587;
                            string fromEmail = "infinigentg@gmail.com";
                            string fromPassword = "cbig nqis ijni vhao";



                           MailMessage mail = new MailMessage();
                            mail.From = new MailAddress(fromEmail);
                            mail.To.Add(email);
                            mail.Subject = "Leave Application Submission Confirmation";
                            mail.Body = $"Hello Sir/Madam, I am {name},\n\n" +
                                        $"This is my leave application. Here are the details:\n\n" +
                                        $"Leave Type: {leaveType}\n" +
                                        $"Start Date: {startDate}\n" +
                                        $"End Date: {endDate}\n" +
                                        $"Reason: {reason}\n\n" +
                                        $" Leave application has been submitted. {approvalLink} to approve or reject the leave request." +
                                        "Thank you!";
                            mail.IsBodyHtml = false;


                            SmtpClient smtpClient = new SmtpClient(smtpHost, smtpPort)
                            {
                                Credentials = new NetworkCredential(fromEmail, fromPassword),
                                EnableSsl = true
                            };


                            smtpClient.Send(mail);
                        }
                        catch (Exception ex)
                        {

                            Response.Write($"<script>alert('Error in sending email: {ex.Message}');</script>");
                        }
                    }
            protected void btnGoBack_Click(object sender, EventArgs e)
            {
                Response.Redirect("Gridtable.aspx");


            }
        }
    }




        
