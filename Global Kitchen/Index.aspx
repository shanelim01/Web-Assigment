<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Global_Kitchen.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            font-family: 'Segoe UI', Arial, sans-serif;
            color: #333;
            overflow-x: hidden;
        }

        /* === NAVBAR === */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: rgba(255,255,255,0.8);
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
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
            margin-right: 50px;
            text-decoration: none;
            color: #333;
            font-weight: 500;
        }

        .nav-links a:hover {
            color: #e67300;
        }

        /* === HERO SECTION === */
        .hero {
            height: 90vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            background: linear-gradient(rgba(255,255,255,0.7), rgba(255,255,255,0.7)),
                        url('Image/kitchen-bg.jpg') center/cover no-repeat;
            margin-top: 100px;
            padding: 0 20px;
        }

        .hero h1 {
            font-size: 60px;
            font-weight: bold;
            color: #222;
            margin-bottom: 20px;
        }

        .hero p {
            font-size: 20px;
            color: #555;
            max-width: 700px;
            line-height: 1.6;
        }

        /* === FEATURED SECTION === */
        .featured-section {
            max-width: 1100px;
            margin: 80px auto;
            text-align: center;
            padding: 0 20px;
        }

        .featured-section h2 {
            font-size: 32px;
            margin-bottom: 20px;
        }

        .featured-recipes {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
        }

        .recipe-card {
            background: rgba(255,255,255,0.95);
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            overflow: hidden;
            width: 300px;
            transition: transform 0.3s ease;
        }

        .recipe-card:hover {
            transform: translateY(-8px);
        }

        .recipe-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .recipe-card h3 {
            margin: 15px 0 8px 0;
            font-size: 22px;
        }

        .recipe-card p {
            color: #666;
            font-size: 15px;
            padding: 0 15px 20px;
        }

        /* === CTA SECTION === */
        .cta {
            text-align: center;
            margin: 100px 20px;
        }

        .cta h2 {
            font-size: 34px;
            margin-bottom: 20px;
        }

        .cta p {
            font-size: 20px;
            color: #555;
            max-width: 700px;
            margin: 0 auto 30px auto;
            line-height: 1.6;
            text-align: center;
        }

        .cta button {
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            color: white;
            border: none;
            padding: 15px 40px;
            border-radius: 30px;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.3s ease;
        }

        .cta button:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
        }

        .footer {
            background-color: #1e1e1e;
            color: #f1f1f1;
            padding: 50px 20px 20px;
            margin-top: 80px;
            font-family: Arial, sans-serif;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            max-width: 1200px;
            margin: 0 auto;
            gap: 40px;
        }

        .footer-column {
            flex: 1;
            min-width: 220px;
        }

        .footer-title {
            font-size: 24px;
            font-weight: bold;
            color: #ffb347;
        }

        .footer-column h3 {
            font-size: 18px;
            margin-bottom: 15px;
            color: #ffb347;
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .footer-column ul li {
            margin-bottom: 8px;
        }

        .footer-column ul li a {
            color: #ddd;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-column ul li a:hover {
            color: #ff9800;
        }

        .social-icons {
            display: flex;
            gap: 12px;
        }

        .social-icons img {
            width: 28px;
            height: 28px;
            transition: transform 0.3s ease;
        }

        .social-icons img:hover {
            transform: scale(1.2);
        }

        .footer-bottom {
            text-align: center;
            margin-top: 40px;
            font-size: 14px;
            color: #aaa;
            border-top: 1px solid rgba(255,255,255,0.2);
            padding-top: 15px;
        }

        /* === Responsive === */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 40px;
            }

            .featured-recipes {
                flex-direction: column;
                align-items: center;
            }
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
                <h1 class="site-title">Global Kitchen</h1>
                <p class="subscript-text">Cooking lessons across cultures</p>
            </div>

            <nav class="nav-links">
                <a href="UserPage.aspx">Profile</a>
                <a href="login.aspx">Login</a>
                <a href="Admin.aspx">Admin</a>
            </nav>
        </header>

        <!-- Hero Section -->
        <section class="hero">
            <h1>Welcome to Global Kitchen</h1>
            <p>Explore the art of cooking across cultures.  
            Learn authentic recipes from passionate chefs worldwide — right from your own kitchen.</p>
        </section>

        <!-- Featured Paid Recipes -->
        <section class="featured-section">
            <h2>Featured Premium Lessons</h2>
            <div class="featured-recipes">
                <div class="recipe-card">
                    <img src="Image/ItalianPasta.jpg" alt="Italian Pasta" />
                    <h3>Italian Pasta Secrets</h3>
                    <p>Discover how to make fresh pasta from scratch, with sauces passed down through generations.</p>
                </div>

                <div class="recipe-card">
                    <img src="Image/JapaneseSushi.jpg" alt="Japanese Sushi" />
                    <h3>Mastering Sushi</h3>
                    <p>Learn the precision, balance, and art behind traditional Japanese sushi techniques.</p>
                </div>

                <div class="recipe-card">
                    <img src="Image/FrenchPastry.jpg" alt="French Pastry" />
                    <h3>French Pastry Magic</h3>
                    <p>From croissants to éclairs — dive into the delicious world of classic French desserts.</p>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta">
            <h2>Ready to Start Your Culinary Journey?</h2>
            <p> Join thousands of students who have transformed their cooking skills with our expert-led courses </p>
            <button type="button" onclick="window.location.href='Recipes.aspx'">Get Started Free</button>
        </section>

        <footer class="footer">
            <div class="footer-container">
                <div class="footer-column">
                    <h2 class ="footer-title"> Global Kitchen </h2>
                    <p>Bringing the world’s flavors to your home kitchen.<br>Explore, cook, and share your passion for food.</p>
                </div>

                <div class="footer-column">
                    <h3> Support </h3>
                    <ul>
                        <li><a href="UserPage.aspx">Profile</a></li>
                        <li><a href="Login.aspx"> Login </a></li>
                        <li><a href="Register.aspx"> Create Account </a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Connect</h3>
                    <div class="social-icons">
                        <img src="Image/Facebook.png" alt="Facebook" />
                        <img src="Image/Instagram.jpg" alt="Instagram" />
                        <img src="Image/X.jpg" alt ="X" />
                        <img src="Image/Youtube.png" alt="Youtube" />
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <p>© 2025 Global Kitchen | Designed for Culinary Creators</p>
            </div>
        </footer>
    </form>
</body>
</html>
