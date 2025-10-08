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

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: rgba(255,255,255,0.7);
            top: 0;
            left: 0;
            width: 100%;
            box-sizing: border-box;
        }

        /* Logo area */
        .logo-area {
            display: flex;
            align-items: center;
        }

        .logo {
            height: 40px;
            margin-right: 10px;
        }

        /* title area */
        .title-area{
            text-align: center;
            flex: 1;
        }

        .site-title {
           font-size: 50px;
           font-weight: bold;
           color: #333;
           margin: 0;
           flex: 1;
           text-align: center;
        }

        .subscript-text{
            font-size: 20px;
            color: #555;
            margin: 0;
            margin-top: 3px;
        }

        /* Navigation Bar */
        .nav-links a {
           margin-left: 20px;
           text-decoration: none;
           color: #333;
           font-weight: 500;
        }

        .nav-links a:hover {
            color: #e67300; 
        }

        /* --- Profile Banner --- */
        .profile-section {
            margin-top: 100px;
        }

        /* background */
        .profile-background {
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            border-radius: 16px;
            max-width: 900px;
            margin: 0 auto;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            padding: 40px;
        }

        .profile-container {
            display: flex;
            align-items: center;
        }

        /* user image */
        .profile-pic {
            width: 160px;
            height: 160px;
            border-radius: 12px;
            background: #ddd;
            overflow: hidden;
            margin-right: 40px;
            flex-shrink: 0;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .profile-pic img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* name and intro */
        .profile-info {
            flex: 1;
        }

        .profile-name {
            font-size: 32px;
            font-weight: bold;
            color: #333;
            margin: 0 0 12px 0;
        }

        .name-edit {
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .gender-icon{
            font-size: 22px;
            color: #007acc; /* male is bule color, famaleis pink color */
            margin-top: 2px;
        }

        .gender-icon:hover {
            color: #e67300;
        }

        .user-details {
            margin-top: 10px;
            margin-bottom: 15px;
        }

        .user-details p {
            margin: 3px 0;
            font-size: 16px;
            color: #444;
            background: rgba(255,255,255,0.6);
            display: inline-block;
            padding: 4px 10px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .edit-btn {
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            color: #666;
            transition: color 0.2s ease, transform 0.2s ease;
        }

        .edit-btn:hover {
            color: #e67300;
            transform: scale(1.1);
        }

        .profile-bio {
            font-size: 17px;
            color: #555;
            line-height: 1.6;
            background: rgba(255,255,255,0.7);
            padding: 15px 20px;
            border-radius: 10px;
            box-shadow: inset 0 1px 4px rgba(0,0,0,0.1);
        }

        .add-recipe-section {
            max-width: 900px;
            margin: 60px auto;
            background: rgba(255,255,255,0.85);
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            animation: fadeIn 1s ease-out;
        }

        .add-recipe-section h2 {
            font-size: 28px;
            color: #333;
            text-align: center;
            margin-bottom: 10px;
        }

        .add-recipe-section p {
             color: #555;
             text-align: center;
             margin-bottom: 30px;
        }

        /* User Stats Section */
        .user-stats {
            max-width: 900px;
            margin: 40px auto;
            text-align: center;
            background: rgba(255,255,255,0.85);
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            padding: 25px 0;
            animation: fadeIn 1s ease-out;
        }

        .stats-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 60px;
            flex-wrap: wrap;
        }

        .stat-box {
            display: flex;
            align-items: center;
            gap: 12px;
            background: rgba(255,255,255,0.9);
            padding: 12px 30px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .stat-box:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        }

        .stat-icon {
            font-size: 32px;
        }

        .stat-info {
            text-align: left;
        }

        .stat-number {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            margin: 0;
        }

        .stat-label {
            font-size: 14px;
            color: #666;
            margin: 0;
        }

        .recipe-form {
             display: flex;
             flex-direction: column;
             gap: 15px;
        }

        .recipe-form label {
            font-weight: bold;
            color: #333;
        }

        .recipe-form input[type="text"],
        .recipe-form textarea,
        .recipe-form input[type="file"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            background: rgba(255,255,255,0.9);
            transition: box-shadow 0.3s ease, border-color 0.3s ease;
        }

        .recipe-form input:focus,
        .recipe-form textarea:focus {
            outline: none;
            border-color: #e67300;
            box-shadow: 0 0 6px rgba(230,115,0,0.3);
        }

        .recipe-form textarea {
            min-height: 100px;
            resize: vertical;
        }

        .recipe-form button {
            margin-top: 10px;
            align-self: center;
            padding: 12px 40px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            border: none;
            border-radius: 25px;
            cursor: pointer;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
     <header class="navbar">
         <div class="header">
             <img src="Image/Logo.png"
                 alt="Global Kitchen Logo"
                 style="height: 168px; width: 201px" />
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

        <!-- User Profile Banner -->
       <section class="profile-section">
            <div class="profile-background">
                <div class="profile-container">
                    <div class="profile-pic">
                        <img src="Image/UserImage.jpg" alt="User Profile Picture" />
                    </div>

                    <div class="profile-info">
                        <div class="name-edit">
                            <h2 class="profile-name" style="margin: 0;"> Johny </h2>
                            <span class="gender-icon" title="Male"><strong> ♂ </strong></span>
                            <a class="edit-btn" title="Edit Profile" href="UserModifyPage.aspx"> ✏️ </a>
                        </div>

                        <div class="user-details">
                            <p><strong> Birthday: </strong> 3 April 2005</p>
                            <p><strong> Country: </strong> Malaysia </p>
                        </div>

                        <p class="profile-bio">
                            A passionate home chef who loves exploring new cuisines and sharing recipes with the world.
                            Cooking is not just a hobby — it's my language of love.
                        </p>
                    </div>
                </div>
            </div>
        </section>

         <!-- User Stats Section -->
        <section class="user-stats">
            <div class="stats-container">
                <div class="stat-box">
                    <span class="stat-icon"> ❤️ </span>
                    <div class="stat-info">
                        <h3 class="stats-number"> 128 </h3>
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

         <section class="add-recipe-section">
             <h2>Add Your Own Recipe </h2>
             <p>Share your favorite dish with the world! Upload an image, give it a name, and describe your creation.</p>
                
             <div class="recipe-form" id="receipeForm">
                 <label> Recipe Name: </label>
                 <input type="text" placeholder="e.ge Creamy Carbonara" required/>

                 <label> Description: </label>
                 <textarea placeholder="Write a short description about your recipe..." required></textarea>

                 <button type="submit"> Upload Receipe </button>
            </div>
         </section>
    </form>
</body>
</html>
