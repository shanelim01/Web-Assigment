<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="Global_Kitchen.recipes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Global Kitchen - Recipes</title>
    <style>
        body, html {
            margin: 0;
            height: 100%;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            font-family: 'Segoe UI', Arial, sans-serif;
            color: #333;
        }

        /* === NAVBAR === */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: rgba(255,255,255,0.8);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            z-index: 10;
        }

        .title-area {
            text-align: center;
            flex: 1;
        }

        .site-title {
            font-size: 40px;
            font-weight: bold;
            margin: 0;
        }

        .subscript-text {
            font-size: 18px;
            color: #666;
            margin-top: 5px;
        }

        .nav-links a {
            margin-right: 40px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
        }

        .nav-links a:hover {
            color: #e67300;
        }

        /* === SEARCH BAR === */
        .search-bar {
            margin-top: 200px;
            text-align: center;
        }

        .search-bar input {
            width: 50%;
            padding: 12px 20px;
            border-radius: 25px;
            border: 1px solid #ccc;
            font-size: 18px;
            transition: box-shadow 0.3s ease;
        }

        .search-bar input:focus {
            box-shadow: 0 0 10px rgba(230, 115, 0, 0.3);
            outline: none;
        }

        .search-bar button {
            padding: 12px 25px;
            margin-left: 10px;
            border-radius: 25px;
            border: none;
            background: linear-gradient(135deg, #e67300, #ffb347);
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s ease;
        }

        .search-bar button:hover {
            transform: scale(1.05);
        }

        /* === LAYOUT === */
        .content-wrapper {
            display: flex;
            margin: 40px auto;
            max-width: 1300px;
            gap: 30px;
        }

        /* === SIDEBAR === */
        .sidebar {
            width: 260px;
            background: rgba(255,255,255,0.85);
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            height: fit-content;
        }

        .sidebar h3 {
            margin-top: 0;
            color: #333;
        }

        .sidebar label {
            display: block;
            margin: 8px 0;
        }

        /* === MAIN CONTENT === */
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 40px;
        }

        .recipe-section {
            background: rgba(255,255,255,0.9);
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        .recipe-section h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .recipe-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .recipe-card {
            width: 250px;
            border-radius: 12px;
            overflow: hidden;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }

        .recipe-card:hover {
            transform: translateY(-5px);
        }

        .recipe-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .recipe-card h4 {
            margin: 10px;
        }

        .recipe-card p {
            margin: 0 10px 15px;
            color: #666;
            font-size: 14px;
        }

    </style>
</head>

<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <header class="navbar">
            <div class="header">
                <img src="Image/Logo.png" alt="Global Kitchen Logo" style="height: 120px;" />
            </div>

            <div class="title-area">
                <h1 class="site-title">Recipes</h1>
                <p class="subscript-text">Discover dishes from every corner of the world</p>
            </div>

            <nav class="nav-links">
                <a href="Index.aspx">Home</a>
                <a href="UserPage.aspx">Profile</a>
                <a href="Login.aspx">Login</a>
            </nav>
        </header>

        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" placeholder="Search recipes, cuisines, or chefs..." />
            <button type="button">Search</button>
        </div>

        <!-- Content Layout -->
        <div class="content-wrapper">
            <!-- Sidebar -->
            <aside class="sidebar">
                <h3>Filter by Ingredients</h3>
                <label><input type="checkbox" /> Chicken</label>
                <label><input type="checkbox" /> Beef</label>
                <label><input type="checkbox" /> Vegetables</label>
                <label><input type="checkbox" /> Seafood</label>

                <h3>Country</h3>
                <select style="width:100%; padding:10px; border-radius:8px; border:1px solid #ccc;">
                    <option value="">Select Country</option>
                    <option>Japan</option>
                    <option>Italy</option>
                    <option>France</option>
                    <option>Malaysia</option>
                    <option>Mexico</option>
                </select>
            </aside>

            <!-- Main Content -->
            <main class="main-content">
                <section class="recipe-section">
                    <h2>🔥 Trending Recipes</h2>
                    <div class="recipe-grid">
                        <div class="recipe-card">
                            <img src="Image/Sushi.jpg" alt="Sushi" />
                            <h4>Classic Sushi Rolls</h4>
                            <p>Perfectly rolled with fresh fish and rice.</p>
                        </div>

                        <div class="recipe-card">
                            <img src="Image/Pasta.jpg" alt="Pasta" />
                            <h4>Spaghetti Carbonara</h4>
                            <p>Creamy sauce with crispy pancetta.</p>
                        </div>
                    </div>
                </section>

                <section class="recipe-section">
                    <h2>⭐ Featured Recipes</h2>
                    <div class="recipe-grid">
                        <div class="recipe-card">
                            <img src="Image/Tacos.jpg" alt="Tacos" />
                            <h4>Authentic Mexican Tacos</h4>
                            <p>Rich flavor, soft tortillas, fresh lime.</p>
                        </div>
                        <div class="recipe-card">
                            <img src="Image/Curry.jpg" alt="Curry" />
                            <h4>Indian Curry Bowl</h4>
                            <p>Spices and aroma that awaken the senses.</p>
                        </div>
                    </div>
                </section>

                <section class="recipe-section">
                    <h2>🍳 Today’s Recommendation</h2>
                    <div class="recipe-grid">
                        <div class="recipe-card">
                            <img src="Image/Ratatouille.jpg" alt="Ratatouille" />
                            <h4>French Ratatouille</h4>
                            <p>A warm, comforting vegetable stew.</p>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </form>
</body>
</html>
