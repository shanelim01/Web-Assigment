<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Global Kitchen - User Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* === CSS VARIABLES === */
        :root {
            --primary-color: #ff6b35;
            --secondary-color: #f7931e;
            --accent-color: #ffb347;
            --text-dark: #2c3e50;
            --text-light: #7f8c8d;
            --bg-light: #f8f9fa;
            --white: #ffffff;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-hover: 0 8px 25px rgba(0, 0, 0, 0.15);
            --border-radius: 12px;
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        body, html {
            margin: 0;
            height: 100vh;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            font-family: 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            overflow-x: hidden;
        }

        /* === STANDARD NAVBAR === */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            box-shadow: var(--shadow);
            z-index: 1000;
            transition: var(--transition);
            box-sizing: border-box;
        }

        .navbar:hover {
            box-shadow: var(--shadow-hover);
        }

        .navbar .header {
            display: flex;
            align-items: center;
        }

        .navbar .header img {
            height: 80px;
            width: auto;
            display: block;
        }

        .navbar .title-area {
            text-align: center;
            flex: 1;
            min-width: 200px;
        }

        .navbar .subscript-text {
            font-size: clamp(0.9rem, 2vw, 1rem);
            color: var(--text-light);
            margin-top: 4px;
        }

        .navbar .site-title {
            font-size: clamp(1.8rem, 4vw, 2.2rem);
            font-weight: 800;
            margin: 0;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .navbar .nav-links {
            display: flex;
            gap: 20px;
            align-items: center;
            flex-wrap: wrap;
        }

        .navbar .nav-links a {
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 600;
            padding: 10px 20px;
            border-radius: var(--border-radius);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            font-size: 0.95rem;
        }

        .navbar .nav-links a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 107, 53, 0.2), transparent);
            transition: left 0.5s;
        }

        .navbar .nav-links a:hover::before {
            left: 100%;
        }

        .navbar .nav-links a:hover {
            color: var(--primary-color);
            background: rgba(255, 107, 53, 0.1);
            transform: translateY(-2px);
        }

        .profile-section { margin-top: 120px; }
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
     <form id="form1">
     <!-- Standard Navbar -->
     <header class="navbar">
         <div class="header">
             <img src="/Image/Logo.png" alt="Global Kitchen Logo" />
         </div>

         <div class="title-area">
             <h1 class="site-title">Global Kitchen</h1>
             <p class="subscript-text">Cooking lessons across cultures</p>
         </div>

         <nav class="nav-links">
             <a href="/">Home</a>
             <a href="/Home/Recipes">Recipes</a>
             <a href="/Home/About">About</a>
             <a href="/Home/Login">Login</a>
             <a href="/Home/Admin">Admin</a>
         </nav>
     </header>

        <section class="profile-section">
            <div class="profile-background">
                <div class="profile-container">
                    <div class="profile-pic">
                        <img src="/Image/UserImage.jpg" alt="User Profile Picture" />
                    </div>

                    <div class="profile-info">
                        <div class="name-edit">
                            <h2 class="profile-name" style="margin: 0;"> Johny </h2>
                            <span class="gender-icon" title="Male"><strong> ♂ </strong></span>
                            <a class="edit-btn" title="Edit Profile" href="/Home/UserModifyPage"> ✏️ </a>
                        </div>

                        <div class="user-details">
                            <p><strong> Birthday: </strong> 3 April 2005</p>
                            <p><strong> Country: </strong> Malaysia </p>
                        </div>

                        <p class="profile-bio">
                            A passionate home chef who loves exploring new cuisines and sharing recipes with the world.
                            Cooking is not just a hobby - it's my language of love.
                        </p>
                    </div>
                </div>
            </div>
        </section>

        <section class="user-stats">
            <div class="stats-container">
                <div class="stat-box">
                    <span class="stat-icon"> ♥ </span>
                    <div class="stat-info">
                        <h3 class="stat-number"> 128 </h3>
                        <p class="stat-label"> Total Liked </p>
                    </div>
                </div>

                <div class="stat-box">
                    <span class="stat-icon"> ♨ </span>
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
                
                <div class="recipe-card">
                    <div class="recipe-info">
                        <h3>Creamy Carbonara</h3>
                        <p>♥ 256 Likes</p>
                    </div>
                </div>
                
                <div class="recipe-card">
                    <div class="recipe-info">
                        <h3>Teriyaki Chicken</h3>
                        <p>♥ 300 Likes</p>
                    </div>
                </div>
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
