using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Global_Kitchen
{
    public partial class UserModifyPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    LoadUserInfo(Session["Username"].ToString());
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadUserInfo(string username)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Username, Gender, DOB, Country, Email, ProfileImg FROM [User] WHERE Username=@Username";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtUsername.Text = reader["Username"].ToString();
                            ddlGender.SelectedValue = reader["Gender"].ToString();
                            txtDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("yyyy-MM-dd");
                            txtCountry.Text = reader["Country"].ToString();
                            txtEmail.Text = reader["Email"].ToString();

                            imgProfile.ImageUrl = reader["ProfileImg"] != DBNull.Value ? reader["ProfileImg"].ToString() : "Image/DefaultUser.png";
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Session["Username"] == null) return;

            string username = Session["Username"].ToString();
            string newUsername = txtUsername.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string dob = txtDOB.Text;
            string country = txtCountry.Text.Trim();
            string password = txtPassword.Text.Trim();

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            string profileImgPath = null;
            if (fuProfileImg.HasFile)
            {
                string ext = Path.GetExtension(fuProfileImg.FileName);
                string fileName = username + "_" + DateTime.Now.Ticks + ext;
                string savePath = Server.MapPath("~/Image/UserProfiles/" + fileName);
                fuProfileImg.SaveAs(savePath);
                profileImgPath = "Image/UserProfiles/" + fileName;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "UPDATE [User] SET Username=@NewUsername, Gender=@Gender, DOB=@DOB, Country=@Country " +
                               (password != "" ? ", Password=@Password " : "") +
                               (profileImgPath != null ? ", ProfileImg=@ProfileImg " : "") +
                               "WHERE Username=@Username";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@NewUsername", newUsername);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Parameters.AddWithValue("@Username", username);

                    if (password != "")
                    {
                        // Ideally hash the password before saving
                        cmd.Parameters.AddWithValue("@Password", password);
                    }

                    if (profileImgPath != null)
                    {
                        cmd.Parameters.AddWithValue("@ProfileImg", profileImgPath);
                    }

                    int rows = cmd.ExecuteNonQuery();
                    if (rows > 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                        lblMessage.Text = "Profile updated successfully!";
                        Session["Username"] = newUsername; // update session
                        LoadUserInfo(newUsername); // reload data
                    }
                    else
                    {
                        lblMessage.Text = "Failed to update profile.";
                    }
                }
            }
        }
    }
}
