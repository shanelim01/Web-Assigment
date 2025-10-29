using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace Global_Kitchen
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string gender = genderMale.Checked ? "Male" : "Female";
            string birthday = txtBirthday.Text;
            string country = ddlCountry.SelectedValue;

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Please fill in all required fields.');</script>");
                return;
            }

            if (!IsPasswordStrong(password))
            {
                Response.Write("<script>alert('Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.');</script>");
                return;
            }

            string hashedPassword = HashPassword(password);

            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                string checkQuery = "SELECT COUNT(*) FROM [User] WHERE Email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@Email", email);
                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    Response.Write("<script>alert('Email already registered. Please use another one.');</script>");
                    return;
                }

                string checkUsernameQuery = "SELECT COUNT(*) FROM [User] WHERE Username = @Username";
                SqlCommand checkUsernameCmd = new SqlCommand(checkUsernameQuery, conn);
                checkUsernameCmd.Parameters.AddWithValue("@Username", username);
                int usernameCount = (int)checkUsernameCmd.ExecuteScalar();

                if (usernameCount > 0)
                {
                    Response.Write("<script>alert('Username already taken. Please choose another one.');</script>");
                    return;
                }

                string insertQuery = @"INSERT INTO [User] (Username, Email, Password, Gender, DOB, Country, ProfileImg)
                       VALUES (@Username, @Email, @Password, @Gender, @DOB, @Country, @ProfileImg)";

                SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                insertCmd.Parameters.AddWithValue("@Username", username);
                insertCmd.Parameters.AddWithValue("@Email", email);
                insertCmd.Parameters.AddWithValue("@Password", hashedPassword);
                insertCmd.Parameters.AddWithValue("@Gender", gender);
                insertCmd.Parameters.AddWithValue("@DOB", birthday);
                insertCmd.Parameters.AddWithValue("@Country", country);
                insertCmd.Parameters.AddWithValue("@ProfileImg", DBNull.Value); 


                insertCmd.ExecuteNonQuery();
            }

            Response.Write("<script>alert('Registration Successful! Redirecting to Login Page...');window.location='Login.aspx';</script>");
        }

        private bool IsPasswordStrong(string password)
        {
            var regex = new Regex(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$");
            return regex.IsMatch(password);
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
