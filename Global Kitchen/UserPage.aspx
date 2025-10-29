<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="Global_Kitchen.UserPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen - User Page</title>
    <style>
        body, html {
            margin: 0;
            height: 100vh;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            font-family: Arial, sans-serif;
        }
        .navbar { display: flex; justify-content: space-between; align-items: center; padding: 15px 30px; background: rgba(255,255,255,0.7); top: 0; left: 0; width: 100%; box-sizing: border-box; }
        .logo-area { display: flex; align-items: center; }
        .logo { height: 40px; margin-right: 10px; }
        .title-area{ text-align: center; flex: 1; }
        .site-title { font-size: 50px; font-weight: bold; color: #333; margin: 0; flex: 1; text-align: center; }
        .subscript-text{ font-size: 20px; color: #555; margin: 0; margin-top: 3px; }
        .nav-links a { margin-left: 20px; text-decoration: none; color: #333; font-weight: 500; }
        .nav-links a:hover { color: #e67300; }
        .profile-section { margin-top: 100px; }
        .profile-background { background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8); border-radius: 16px; max-width: 900px; margin: 0 auto; box-shadow: 0 4px 20px rgba(0,0,0,0.08); padding: 40px; }
        .profile-container { display: flex; align-items: center; }
        .profile-pic { width: 160px; height: 160px; border-radius: 12px; background: #ddd; overflow: hidden; margin-right: 40px; flex-shrink: 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        .profile-pic img { width: 100%; height: 100%; object-fit: cover; }
        .profile-info { flex: 1; }
        .profile-name { font-size: 32px; font-weight: bold; color: #333; margin: 0 0 12px 0; }
        .name-edit { display: inline-flex; align-items: center; gap: 10px; }
        .gender-icon{ font-size: 22px; color: #007acc; margin-top: 2px; }
        .gender-icon:hover { color: #e67300; }
        .user-details { margin-top: 10px; margin-bottom: 15px; }
        .user-details p { margin: 3px 0; font-size: 16px; color: #444; background: rgba(255,255,255,0.6); display: inline-block; padding: 4px 10px; border-radius: 8px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .edit-btn { background: none; border: none; font-size: 20px; cursor: pointer; color: #666; transition: color 0.2s ease, transform 0.2s ease; }
        .edit-btn:hover { color: #e67300; transform: scale(1.1); }
        .profile-bio { font-size: 17px; color: #555; line-height: 1.6; background: rgba(255,255,255,0.7); padding: 15px 20px; border-radius: 10px; box-shadow: inset 0 1px 4px rgba(0,0,0,0.1); }
        .user-recipes { max-width: 1100px; margin: 60px auto; display: flex; justify-content: center; align-items: flex-start; gap: 30px; flex-wrap: wrap; }
        .published-recipes { flex: 1; min-width: 300px; max-width: 45%; background: rgba(255,255,255,0.85); border-radius: 16px; padding: 25px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
        .published-recipes h2 { text-align: center; color: #333; margin-bottom: 20px; }
        .recipe-card { display: flex; align-items: center; background: rgba(255,255,255,0.9); border-radius: 10px; margin-bottom: 15px; padding: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); transition: transform 0.2s ease, box-shadow 0.2s ease; }
        .recipe-card:hover { transform: translateY(-4px); box-shadow: 0 6px 15px rgba(0,0,0,0.15); }
        .recipe-info h3 { margin: 0; font-size: 18px; color: #333; }
        .recipe-info p { margin: 5px 0 0 0; color: #e67300; font-weight: bold; }
        .user-stats { max-width: 900px; margin: 40px auto; text-align: center; background: rgba(255,255,255,0.85); border-radius: 16px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); padding: 25px 0; animation: fadeIn 1s ease-out; }
        .stats-container { display: flex; justify-content: center; align-items: center; gap: 60px; flex-wrap: wrap; }
        .stat-box { display: flex; align-items: center; gap: 12px; background: rgba(255,255,255,0.9); padding: 12px 30px; border-radius: 12px; box-shadow: 0 3px 10px rgba(0,0,0,0.1); transition: transform 0.3s ease, box-shadow 0.3s ease; }
        .stat-box:hover { transform: translateY(-4px) scale(1.02); box-shadow: 0 6px 18px rgba(0,0,0,0.15); }
        .stat-icon { font-size: 32px; }
        .stat-info { text-align: left; }
        .stat-number { font-size: 22px; font-weight: bold; color: #333; margin: 0; }
        .stat-label { font-size: 14px; color: #666; margin: 0; }
        .add-recipe-panel { flex: 1; min-width: 350px; background: rgba(255,255,255,0.85); border-radius: 16px; padding: 25px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); }
        .add-recipe-panel h2 { text-align: center; color: #333; }
        .add-recipe-panel p { text-align: center; color: #555; margin-bottom: 20px; }
        .add-recipe-form { display: flex; flex-direction: column; gap: 15px; }
        .add-recipe-form label { font-weight: bold; color: #333; }
        .add-recipe-form input[type="file"], .add-recipe-form input[type="text"], .add-recipe-form textarea { padding: 10px; border: 1px solid #ccc; border-radius: 8px; font-size: 16px; background: rgba(255,255,255,0.9); transition: box-shadow 0.3s ease, border-color 0.3s ease; }
        .add-recipe-form input[type="file"]:hover { border-color: #e67300; box-shadow: 0 0 6px rgba(230,115,0,0.3); }
        .add-recipe-form input:focus, .add-recipe-form textarea:focus { outline: none; border-color: #e67300; box-shadow: 0 0 6px rgba(230,115,0,0.3); }
        .add-recipe-form textarea { min-height: 100px; resize: vertical; }
        .add-recipe-form button { margin-top: 10px; align-self: center; padding: 12px 40px; font-size: 18px; font-weight: bold; color: white; background: linear-gradient(135deg, #ff7e5f, #feb47b); border: none; border-radius: 25px; cursor: pointer; box-shadow: 0px 4px 10px rgba(0,0,0,0.2); transition: transform 0.2s ease, box-shadow 0.2s ease; }
        .recipe-image {
    width: 100%;
    max-width: 200px;
    height: auto;
    border-radius: 10px;
    margin-top: 5px;
}

        </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <header class="navbar">
            <div class="header">
                <img src="Image/Logo.png" alt="Global Kitchen Logo" style="height: 168px; width: 201px" />
            </div>

            <div class="title-area">
                <h1 class="site-title"> Global Kitchen </h1>
                <p class="subscript-text"> Cooking lessons across cultures </p>
            </div>

            <nav class="nav-links">
                <a href="Index.aspx"> Home </a>
                <a href="Recipes.aspx"> Recipes </a>
            </nav>
        </header>

        <section class="profile-section">
            <div class="profile-background">
                <div class="profile-container">
                    <div class="profile-pic">
    <asp:Image ID="imgProfile" runat="server" CssClass="profile-pic-img" />
</div>

<div class="profile-info">
    <div class="name-edit">
        <h2 class="profile-name">
            <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
        </h2>
        <span class="gender-icon">
            <asp:Label ID="lblGender" runat="server"></asp:Label>
        </span>
        <a class="edit-btn" title="Edit Profile" href="UserModifyPage.aspx"> ✏️ </a>
    </div>

    <div class="user-details">
        <p><strong>Birthday: </strong><asp:Label ID="lblDOB" runat="server"></asp:Label></p>
        <p><strong>Country: </strong><asp:Label ID="lblCountry" runat="server"></asp:Label></p>
        <p><strong>Email: </strong><asp:Label ID="lblEmail" runat="server"></asp:Label></p>
    </div>

    <p class="profile-bio">
        <asp:Label ID="lblBio" runat="server"></asp:Label>
    </p>
</div>

                </div>
            </div>
        </section>

        <section class="user-stats">
            <div class="stats-container">
                <div class="stat-box">
                    <span class="stat-icon"> ❤️ </span>
                    <div class="stat-info">
                        <h3 class="stat-number"> 128 </h3>
                        <p class="stat-label"> Total Liked </p>
                    </div>
                </div>

                <div class="stat-box">
                    <span class="stat-icon"> 🍳 </span>
                    <div>
                        <h3 class="stat-number"> 12 </h3>
                        <p class="stat-label"> Recipes Published </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="user-recipes">
            <div class="published-recipes">
    <h2>Your Recipes</h2>
    <asp:Repeater ID="rptRecipes" runat="server" OnItemCommand="rptRecipes_ItemCommand">
        <ItemTemplate>
            <div class="recipe-card">
                <asp:Image 
                    ID="imgRecipe" 
                    runat="server" 
                    ImageUrl='<%# "~/Image/RecipeImages/" + Eval("Image") %>' 
                    CssClass="recipe-image" />
                <div class="recipe-info">
                    <h3><%# Eval("RecipeName") %></h3>
                    <p><%# Eval("Description") %></p>
                    <asp:Button 
                        ID="btnDelete" 
                        runat="server" 
                        Text="Delete" 
                        CommandName="DeleteRecipe" 
                        CommandArgument='<%# Eval("RecipeID") %>' 
                        CssClass="delete-btn" />
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>




            <div class="add-recipe-panel">
    <h2>Add Your Own Recipe</h2>
    <p>Share your favorite dish with the world! Upload an image, give it a name, and describe your creation.</p>

    <asp:Panel ID="pnlAddRecipe" runat="server" CssClass="add-recipe-form">
        <asp:Label Text="Upload Recipe Image" AssociatedControlID="fuRecipeImage" runat="server"></asp:Label>
        <asp:FileUpload ID="fuRecipeImage" runat="server" />

        <asp:Label Text="Recipe Name" AssociatedControlID="txtRecipeName" runat="server"></asp:Label>
        <asp:TextBox ID="txtRecipeName" runat="server" Placeholder="e.g. Creamy Carbonara"></asp:TextBox>

        <asp:Label Text="Description" AssociatedControlID="txtRecipeDesc" runat="server"></asp:Label>
        <asp:TextBox ID="txtRecipeDesc" runat="server" TextMode="MultiLine" Placeholder="Write a short description about your recipe..."></asp:TextBox>

        <asp:Button ID="btnUploadRecipe" runat="server" Text="Upload Recipe" CssClass="upload-btn" OnClick="btnUploadRecipe_Click" />
        
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </asp:Panel>
</div>

        </section>
    </form>
</body>
</html>
