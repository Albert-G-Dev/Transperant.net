using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LeaveApp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserID"] != null)
            {
                Response.Redirect("login.aspx");
                return;
            }

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserId, Role FROM Users WHERE UserName=@UserName AND Password=@Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserName", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        int userId = (int)reader["UserId"];
                        int role = (int)reader["Role"]; // 1 for admin, 0 for user

                        Session["UserId"] = userId;
                        Session["Role"] = role;
                        Session["Authenticated"] = true;

                        // Redirect based on role
                        if (role == 1)
                        {
                            // Admin login
                            Response.Redirect("AdminHome.aspx");
                        }
                        else if (role == 0)
                        {
                            // User login
                            Response.Redirect("gridtable.aspx");
                        }

                        return;
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password.";
                    }
                }
            }
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {

            Response.Redirect("Register.aspx");
        }
    }
}

      
 
