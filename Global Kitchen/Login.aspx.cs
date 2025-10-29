using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace Global_Kitchen
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            this.Load += new EventHandler(Form_Submit);
        }

        private void Form_Submit(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string username = Request.Form["username"] ?? Request.Form["UserName"];
                string password = Request.Form["password"];

                if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                {
                    Response.Write("<script>alert('Please enter both username and password.');</script>");
                    return;
                }

                string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    string query = "SELECT Password FROM [User] WHERE Username = @Username";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        object result = cmd.ExecuteScalar();

                        if (result == null)
                        {
                            Response.Write("<script>alert('Invalid username or password.');</script>");
                            return;
                        }

                        string storedHash = result.ToString();

                        string enteredHash = HashPassword(password);

                        if (enteredHash.Equals(storedHash))
                        {
                            Session["Username"] = username;
                            Response.Write("<script>alert('Login successful! Redirecting to homepage...');window.location='Index.aspx';</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid username or password.');</script>");
                        }
                    }
                }
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}
