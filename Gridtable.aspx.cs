using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LeaveApp
{
    public partial class Gridtable : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Authenticated"] == null || !(bool)Session["Authenticated"])
            {
                Response.Redirect("Login.aspx"); 
            }

            if (!IsPostBack)
            {
                BindGridView();
            } 
        }

        protected void btnLeaveApplication_Click(object sender, EventArgs e)
        {
            // Navigate to the Leave Application page
            Response.Redirect("LeaveApp.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {

            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
        private void BindGridView()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                
                string query = "SELECT TOP 5 LeaveId, Name, LeaveType, StartDate, EndDate, Reason, Status FROM LeaveApplications ";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);

                        
                        GridViewUserLeaveStatus.DataSource = dt;
                        GridViewUserLeaveStatus.DataBind();
                    }
                }
            }

        }
    }
}
