using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Reflection;

namespace LeaveApp
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Authenticated"] == null || !(bool)Session["Authenticated"])
            {
                Response.Redirect("Login.aspx"); // Redirect to login page if not authenticated
            }
            if (!IsPostBack)
            {
                LoadLeaveApplications();
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }


        private void LoadLeaveApplications()
        {

            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT LeaveId, Name, LeaveType, StartDate, EndDate, Reason, Status FROM LeaveApplications WHERE Status = 'Pending'";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    GridViewLeaveApplications.DataSource = dt;
                    GridViewLeaveApplications.DataBind();
                }

            }
        }

        protected void GridViewLeaveApplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {

                int index = Convert.ToInt32(e.CommandArgument);


                if (index >= 0 && index < GridViewLeaveApplications.Rows.Count)
                {

                    GridViewRow row = GridViewLeaveApplications.Rows[index];
                    int leaveId = Convert.ToInt32(row.Cells[0].Text); 


                    string status = e.CommandName == "Approve" ? "Approved" : "Rejected";


                    UpdateLeaveStatus(leaveId, status);


                    LoadLeaveApplications();
                }
                else
                {
                    Console.WriteLine("Invalid index: " + index);
                    Console.WriteLine("Total Rows: " + GridViewLeaveApplications.Rows.Count);
                }

            }
        }

        private void UpdateLeaveStatus(int leaveId, string status)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "UPDATE LeaveApplications SET Status = @Status WHERE LeaveId = @LeaveId";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Status", status);
                        cmd.Parameters.AddWithValue("@LeaveId", leaveId);

                        conn.Open();
                        cmd.ExecuteNonQuery();

                    }
                }
            }



    }
}


