git reset --hard<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Global_Kitchen.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            font-family: 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            color: var(--text-dark);
            overflow-x: hidden;
            line-height: 1.6;
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


        /* === HERO SECTION === */
        .hero {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            background: linear-gradient(135deg, rgba(255, 107, 53, 0.1), rgba(247, 147, 30, 0.1)),
                        linear-gradient(rgba(255,255,255,0.8), rgba(255,255,255,0.8)), url('Image/Background.png') center/cover no-repeat;
            padding: 120px 20px 80px;
            position: relative;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent 30%, rgba(255, 107, 53, 0.05) 50%, transparent 70%);
            animation: shimmer 3s ease-in-out infinite;
        }

        @keyframes shimmer {
            0%, 100% { transform: translateX(-100%); }
            50% { transform: translateX(100%); }
        }

        .hero-content {
            position: relative;
            z-index: 2;
            animation: fadeInUp 1s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

         .hero h1 {
            font-size: clamp(2.5rem, 5vw, 4rem);
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            animation: slideInDown 1s ease-out 0.3s both;
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
         }

         .hero p {
            font-size: clamp(1.1rem, 2.5vw, 1.3rem);
            color: var(--text-light);
            max-width: 700px;
            line-height: 1.8;
            margin-bottom: 30px;
            animation: fadeIn 1s ease-out 0.6s both;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
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
            background: var(--white);
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            width: 100%;
            max-width: 350px;
            transition: var(--transition);
            position: relative;
            cursor: pointer;
        }

        .recipe-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            opacity: 0;
            transition: var(--transition);
            z-index: 1;
        }

        .recipe-card:hover::before {
            opacity: 0.1;
        }

        .recipe-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: var(--shadow-hover);
        }

        .recipe-card-content {
            position: relative;
            z-index: 2;
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

        .cta-button {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            border: none;
            padding: 18px 45px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: var(--shadow);
        }

        .cta-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s;
        }

        .cta-button:hover::before {
            left: 100%;
        }

        .cta-button:hover {
            transform: translateY(-5px) scale(1.05);
            box-shadow: var(--shadow-hover);
            background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
        }

        .cta-button:active {
            transform: translateY(-2px) scale(1.02);
        }

        /* === VIDEO SECTION === */
        .video-section {
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 20px;
            text-align: center;
        }

        .video-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            padding: 50px 40px;
            box-shadow: var(--shadow);
            animation: fadeInUp 0.8s ease-out;
        }

        .video-container h2 {
            font-size: clamp(1.8rem, 4vw, 2.5rem);
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 15px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .video-container p {
            font-size: 1.1rem;
            color: var(--text-light);
            margin-bottom: 30px;
        }

        .video-wrapper {
            position: relative;
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--shadow-hover);
            transition: var(--transition);
        }

        .video-wrapper:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
        }

        .video-wrapper iframe {
            border-radius: var(--border-radius);
        }

        /* === FOOTER === */
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
            flex-wrap: wrap;
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

        /* === RESPONSIVE RULES === */
        @media (max-width: 1024px) {
            .hero h1 { 
                font-size: 48px; 
            }

            .hero p { 
                font-size: 18px;
            }

            .navbar .header img {
                height: 60px;
            }

            .navbar .site-title {
                font-size: 1.6rem;
            }

            .navbar .nav-links {
                gap: 15px;
            }
        }

        /* === RESPONSIVE DESIGN === */
        
        /* Tablet Styles */
        @media (max-width: 1024px) {
            .navbar {
                padding: 12px 20px;
            }
            
            .nav-links {
                gap: 20px;
            }
            
            .nav-links a {
                padding: 8px 16px;
                font-size: 0.9rem;
            }
            
            .hero {
                padding: 100px 20px 60px;
            }
            
            .featured-recipes {
                gap: 20px;
            }
            
            .recipe-card {
                max-width: 300px;
            }
        }

        /* Mobile Styles */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                text-align: center;
                height: auto;
                padding: 8px 0;
            }

            .navbar .header img {
                height: 50px;
                margin-bottom: 4px;
            }

            .navbar .nav-links {
                flex-wrap: wrap;
                gap: 10px;
                margin-top: 5px;
            }

            .navbar .nav-links a {
                font-size: 0.85rem;
                padding: 8px 12px;
            }

            .navbar .site-title {
                font-size: 1.4rem;
                margin: 0;
            }

            .navbar .subscript-text {
                font-size: 0.75rem;
                margin-top: 2px;
            }

            .navbar .title-area {
                margin-bottom: 5px;
            }

            .hero {
                padding: 130px;
            }

            .navbar {
                flex-direction: column;
                padding: 15px 20px;
                gap: 15px;
            }
            
            .title-area {
                order: 1;
            }
            
            .nav-links {
                order: 2;
                gap: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .nav-links a {
                padding: 8px 12px;
                font-size: 0.85rem;
            }
            
            .hero {
                padding: 140px 15px 60px;
                min-height: 80vh;
            }
            
            .hero h1 {
                font-size: clamp(2rem, 8vw, 2.5rem);
                margin-bottom: 15px;
            }
            
            .hero p {
                font-size: clamp(1rem, 4vw, 1.1rem);
                margin-bottom: 25px;
            }
            
            .featured-section {
                margin: 60px auto;
                padding: 0 15px;
            }
            
            .featured-section h2 {
                font-size: 1.8rem;
                margin-bottom: 30px;
            }
            
            .featured-recipes {
                flex-direction: column;
                align-items: center;
            }

            .cta h2 {
                font-size: 28px;
            }

            .cta p {
                font-size: 18px;
            }

            .cta button {
                padding: 12px 30px;
                font-size: 18px;
            }

            .footer-container {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            .social-icons {
                justify-content: center;
            }
        }

        @media (max-width: 480px) {
            .navbar .site-title {
                font-size: 1.3rem;
            }

            .navbar .header img {
                height: 45px;
            }

            .navbar .nav-links a {
                font-size: 0.8rem;
                padding: 6px 10px;
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

            .cta h2 {
                font-size: 24px;
            }

            .cta p { 
                font-size: 16px;
            }

            .cta button { 
                padding: 10px 25px; font-size: 16px; 
            }
            
            .social-icons img { 
                width: 24px; height: 24px; 
            }
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
                <a href="/Home/UserPage">Profile</a>
                <a href="/Home/Login">Login</a>
                <a href="/Home/Admin">Admin</a>
            </nav>
        </header>

        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <h1>Welcome to Global Kitchen</h1>
                <p>Explore the art of cooking across cultures.  
                Learn authentic recipes from passionate chefs worldwide right from your own kitchen.</p>
            </div>
        </section>

        <!-- Featured Paid Recipes -->
        <section class="featured-section">
            <h2>Featured Premium Lessons</h2>
            <div class="featured-recipes">
                <div class="recipe-card">
                    <div class="recipe-card-content">
                        <img src="/Image/ItalianPasta.jpg" alt="Italian Pasta" />
                        <h3>Italian Pasta Secrets</h3>
                        <p>Discover how to make fresh pasta from scratch, with sauces passed down through generations.</p>
                    </div>
                </div>

                <div class="recipe-card">
                    <div class="recipe-card-content">
                        <img src="/Image/JapaneseSushi.jpg" alt="Japanese Sushi" />
                        <h3>Mastering Sushi</h3>
                        <p>Learn the precision, balance, and art behind traditional Japanese sushi techniques.</p>
                    </div>
                </div>

                <div class="recipe-card">
                    <div class="recipe-card-content">
                        <img src="/Image/FrenchPastry.jpg" alt="French Pastry" />
                        <h3>French Pastry Magic</h3>
                        <p>From croissants to éclairs — dive into the delicious world of classic French desserts.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Video Tutorial Section -->
        <section class="video-section">
            <div class="video-container">
                <h2>Watch Our Featured Tutorial</h2>
                <p>Learn the basics of international cooking with our step-by-step video guide</p>
                <div class="video-wrapper">
                    <iframe 
                        width="100%" 
                        height="400" 
                        src="https://www.youtube.com/embed/y3X7DKYkSxs" 
                        title="Global Kitchen Cooking Tutorial" 
                        frameborder="0" 
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                        allowfullscreen>
                    </iframe>
                </div>
            </div>
        </section>

        <!-- CTA Section -->
        <section class="cta">
            <h2>Ready to Start Your Culinary Journey?</h2>
            <p> Join thousands of students who have transformed their cooking skills with our expert-led courses </p>
            <button type="button" class="cta-button" onclick="window.location.href='/Home/Recipes'">Get Started Free</button>
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
                        <li><a href="/Home/UserPage">Profile</a></li>
                        <li><a href="/Home/Login"> Login </a></li>
                        <li><a href="/Home/Register"> Create Account </a></li>
                    </ul>
                </div>

                <div class="footer-column">
                    <h3>Connect</h3>
                    <div class="social-icons">
                        <img src="/Image/Facebook.png" alt="Facebook" />
                        <img src="/Image/Instagram.jpg" alt="Instagram" />
                        <img src="/Image/X.jpg" alt ="X" />
                        <img src="/Image/Youtube.png" alt="Youtube" />
                    </div>
                </div>
            </div>

            <div class="footer-bottom">
                <p>© 2025 Global Kitchen | Designed for Culinary Creators</p>
            </div>
        </footer>

        <!-- Backend Integration Placeholders -->
        <div id="dynamic-content" style="display: none;">
            <!-- Placeholder for dynamic recipe data -->
            <div id="featured-recipes-container"></div>
            
            <!-- Placeholder for user authentication status -->
            <div id="user-auth-status"></div>
            
            <!-- Placeholder for personalized recommendations -->
            <div id="personalized-content"></div>
            
            <!-- Placeholder for dynamic testimonials -->
            <div id="testimonials-container"></div>
        </div>
    </form>
</body>
</html>
