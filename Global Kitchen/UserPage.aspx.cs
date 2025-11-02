using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Global_Kitchen
{
    public partial class UserPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                    LoadUserInfo(username);
                }
                else
                {
                    Response.Redirect("Login.aspx"); 
                }
                BindUserRecipes();
            }
        }

        private void LoadUserInfo(string username)
        {
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT Username, Gender, DOB, Country, Email, ProfileImg FROM UserTable WHERE Username=@Username";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    conn.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblUsername.Text = reader["Username"].ToString();
                            lblGender.Text = reader["Gender"].ToString();
                            lblDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("dd MMMM yyyy");
                            lblCountry.Text = reader["Country"].ToString();
                            lblEmail.Text = reader["Email"].ToString();

                            string imgPath = reader["ProfileImg"] != DBNull.Value ? reader["ProfileImg"].ToString() : "Image/DefaultUser.png";
                            imgProfile.ImageUrl = imgPath;
                        }
                    }
                }
            }
        }
        protected void btnUploadRecipe_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtRecipeName.Text.Trim()))
            {
                lblMessage.Text = "Please enter a recipe name.";
                return;
            }

            if (!fuRecipeImage.HasFile)
            {
                lblMessage.Text = "Please upload a recipe image.";
                return;
            }

            if (Session["Username"] == null)
            {
                lblMessage.Text = "User session expired. Please log in again.";
                return;
            }

            string username = Session["Username"].ToString();
            string recipeName = txtRecipeName.Text.Trim();
            string recipeDesc = txtRecipeDesc.Text.Trim();

            string fileName = Path.GetFileName(fuRecipeImage.PostedFile.FileName);
            string ext = Path.GetExtension(fileName);
            string uniqueFileName = $"{Path.GetFileNameWithoutExtension(fileName)}_{DateTime.Now.Ticks}{ext}";
            string savePath = Server.MapPath("~/Image/RecipeImages/") + uniqueFileName;

            try
            {
                fuRecipeImage.SaveAs(savePath);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error saving image: " + ex.Message;
                return;
            }

            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string getUserIdQuery = "SELECT UserID FROM UserTable WHERE Username = @Username";
                SqlCommand cmdUser = new SqlCommand(getUserIdQuery, conn);
                cmdUser.Parameters.AddWithValue("@Username", username);
                object userIdObj = cmdUser.ExecuteScalar();

                if (userIdObj == null)
                {
                    lblMessage.Text = "User not found.";
                    return;
                }

                int userId = Convert.ToInt32(userIdObj);

                string getMaxRecipeIdQuery = "SELECT ISNULL(MAX(RecipeID), 0) FROM Recipe";
                SqlCommand cmdMax = new SqlCommand(getMaxRecipeIdQuery, conn);
                int maxRecipeId = Convert.ToInt32(cmdMax.ExecuteScalar());

                int newRecipeId = maxRecipeId + 1;

                string insertQuery = @"INSERT INTO Recipe (RecipeID, UserID, RecipeName, Description, Image)
                               VALUES (@RecipeID, @UserID, @RecipeName, @Description, @Image)";
                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                cmd.Parameters.AddWithValue("@RecipeID", newRecipeId);
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@RecipeName", recipeName);
                cmd.Parameters.AddWithValue("@Description", recipeDesc);
                cmd.Parameters.AddWithValue("@Image", uniqueFileName);

                cmd.ExecuteNonQuery();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Recipe uploaded successfully!";

                txtRecipeName.Text = "";
                txtRecipeDesc.Text = "";
                Response.Redirect("UserPage.aspx");

            }
        }


        private void BindUserRecipes()
        {
            string username = Session["Username"]?.ToString();
            if (string.IsNullOrEmpty(username)) return;

            int userId = 0;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
            {
                conn.Open();

                string getUserIdQuery = "SELECT UserID FROM UserTable WHERE Username = @Username";
                using (SqlCommand cmd = new SqlCommand(getUserIdQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        userId = Convert.ToInt32(result);
                    }
                    else
                    {
                        return;
                    }
                }

                string getRecipesQuery = "SELECT RecipeID, RecipeName, Description, Image FROM Recipe WHERE UserID = @UserID";
                using (SqlCommand cmd = new SqlCommand(getRecipesQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptRecipes.DataSource = reader;
                    rptRecipes.DataBind();
                }
            }
        }
            protected void rptRecipes_ItemCommand(object source, RepeaterCommandEventArgs e)
            {
                if (e.CommandName == "DeleteRecipe")
                {
                    int recipeId = Convert.ToInt32(e.CommandArgument);

                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString))
                    {
                        conn.Open();

                        string getImageQuery = "SELECT Image FROM Recipe WHERE RecipeID = @RecipeID";
                        string imageName = "";
                        using (SqlCommand cmd = new SqlCommand(getImageQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("@RecipeID", recipeId);
                            object result = cmd.ExecuteScalar();
                            if (result != null)
                            {
                                imageName = result.ToString();
                            }
                        }

                        string deleteQuery = "DELETE FROM Recipe WHERE RecipeID = @RecipeID";
                        using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                        {
                            cmd.Parameters.AddWithValue("@RecipeID", recipeId);
                            cmd.ExecuteNonQuery();
                        }

                        if (!string.IsNullOrEmpty(imageName))
                        {
                            string path = Server.MapPath("~/Image/RecipeImages/" + imageName);
                            if (System.IO.File.Exists(path))
                            {
                                System.IO.File.Delete(path);
                            }
                        }
                    }

                    BindUserRecipes();
                }
            }

        }

    
}
