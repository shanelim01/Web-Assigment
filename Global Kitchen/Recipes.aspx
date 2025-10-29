<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recipes.aspx.cs" Inherits="Global_Kitchen.recipes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Global Kitchen - Recipes</title>

    <style>
        body, html {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            color: #333;
        }

        /* === NAVBAR === */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 30px;
            background: rgba(255,255,255,0.9);
            position: sticky;
            width: 100%;
            top: 0;
            left: 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            z-index: 10;
            flex-wrap: wrap;
            box-sizing: border-box;
        }

        .header img {
            height: 140px;
            width: auto;
            display: block;
            margin: 0 auto;
        }

        .title-area {
            text-align: center;
            flex: 1;
            min-width: 200px;
        }

        .subscript-text {
            font-size: 16px;
            color: #666;
            margin-top: 4px;
        }

        .site-title{
            font-size: 36px;
            font-weight: bold;
            margin: 0;
        }

        .nav-links {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 25px;
            flex-wrap: nowrap;
        }

        .nav-links a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #e67300;
        }

        /* === TOP SECTION === */
        .top-section {
            margin-top: 160px;
            text-align: center;
            padding: 20px;
        }

        /* SEARCH BAR */
        .search-bar {
            margin-bottom: 25px;
        }

        .search-bar input {
            width: 60%;
            max-width: 600px;
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

        /* FILTER SECTION */
        .filter-section {
            max-width: 900px;
            margin: 0 auto 50px auto;
            background: rgba(255,255,255,0.9);
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: left;
        }

        .filter-section h3 {
            margin-top: 0;
            color: #333;
        }

        .filter-section label {
            display: inline-block;
            margin-right: 20px;
            margin-bottom: 10px;
        }

        .filter-section select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 10px;
        }

        /* === MAIN CONTENT === */
        .main-content {
            display: flex;
            flex-direction: column;
            gap: 40px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px 40px;
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
            font-size: 24px;
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
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .recipe-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
        }

        .recipe-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .recipe-card h4 {
            margin: 10px;
            font-size: 18px;
        }

        .recipe-card p {
            margin: 0 10px 15px;
            color: #666;
            font-size: 14px;
        }

        /* FOOTER */
        footer {
            text-align: center;
            padding: 30px 0;
            background: rgba(255,255,255,0.8);
            margin-top: 40px;
            font-size: 14px;
            color: #555;
        }

        /* RESPONSIVE DESIGN */
         @media (max-width: 1024px) {
             .hero h1 { 
                 font-size: 48px; 
             }

             .hero p { 
                 font-size: 18px;
             }

             。header img{
                 height: 120px;
             }

             .site-title{
                 font-size: 30px;
             }

             .nav-links{
                 gap: 20px;
             }
         }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                text-align: center;
                height: auto;
                padding: 8px 0;
            }

            .header img {
                height: 120px;
                margin-bottom: 4px;
            }

            .nav-links {
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 5px;
            }

            .nav-links a {
                font-size: 15px;
            }

            .site-title {
                font-size: 20px;
                margin: 0;
            }

            .subscript-text {
                font-size: 12px;
                margin-top: 2px;
            }

            .title-area{
                margin-bottom: 5px;
            }

            .hero {
                padding: 130px;
            }

            .hero h1 {
                font-size: 38px;
            }

            .hero p {
                font-size: 17px;
            }

            .featured-recipes {
                flex-direction: column;
                align-items: center;
            }

            .footer-container {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .social-icons {
                justify-content: center;
            }

            .top-section{
                margin-top: 80px;
            }
        }

        @media (max-width: 480px) {
            .site-title {
                font-size: 28px;
            }

            .header img {
                height: 120px;
            }

            .site-title {
                font-size: 22px;
            }

            .nav-link a {
                font-size: 15px;
            }

            .hero h1 {
                font-size: 30px;
            }

            .hero p {
                font-size: 15px;
            }

            .recipe-card {
                width: 90%;
            }

            .social-icons img {
                width: 24px;
                height: 24px;
            }

            .top-section{
                margin-top: 80px;
            }
        }

    </style>
</head>

<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <header class="navbar">
            <div class="header">
                <img src="Image/Logo.png" alt="Global Kitchen Logo" />
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

        <!-- Top Section (Search + Filter) -->
        <section class="top-section">
            <div class="search-bar">
                <input type="text" placeholder="Search recipes, cuisines, or chefs..." />
                <button type="button">Search</button>
            </div>

            <div class="filter-section">
                <h3>Filter by Ingredients</h3>
                <label><input type="checkbox" /> Chicken</label>
                <label><input type="checkbox" /> Beef</label>
                <label><input type="checkbox" /> Vegetables</label>
                <label><input type="checkbox" /> Seafood</label>

                <h3>Country</h3>
                <select>
                    <option value="">Select Country</option>
                    <option>Japan</option>
                    <option>Italy</option>
                    <option>France</option>
                    <option>Malaysia</option>
                    <option>Mexico</option>
                </select>
            </div>
        </section>

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

        <!-- Footer -->
        <footer>
            © 2025 Global Kitchen. All rights reserved.
        </footer>
    </form>
</body>
</html>
