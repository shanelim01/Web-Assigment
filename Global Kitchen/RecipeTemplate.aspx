<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe Template | Global Kitchen</title>
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

        /* --- Reset --- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            color: #333;
            line-height: 1.6;
            padding: 20px;
            padding-top: 120px;
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

        .navbar .nav-links a.active {
            color: var(--white);
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            box-shadow: var(--shadow);
        }

        .navbar .nav-links a.active:hover {
            background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
        }

        .recipe-container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .recipe-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .recipe-header h1 {
            font-size: 2rem;
            color: #2c3e50;
        }

        .recipe-header img {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 12px;
            margin-top: 20px;
        }

        .section {
            margin-top: 30px;
        }

        .section h2 {
            font-size: 1.4rem;
            color: #d35400;
            margin-bottom: 10px;
            border-bottom: 2px solid #d35400;
            display: inline-block;
            padding-bottom: 4px;
        }

        .ingredients ul {
            list-style-type: square;
            margin-left: 20px;
        }

        .ingredients li, .steps li {
            margin-bottom: 8px;
        }

        .steps ol {
            margin-left: 20px;
        }

        .description {
            font-size: 1rem;
            margin-top: 10px;
            color: #555;
        }

        .footer {
            text-align: center;
            font-size: 0.9rem;
            color: #888;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                <a href="/Home/Register">Register</a>
                <a href="/Home/Admin">Admin</a>
            </nav>
        </header>

        <div class="recipe-container">
            <div class="recipe-header">
                <h1><%: RecipeTitle %></h1>
                <img src="<%: RecipeImage %>" alt="<%: RecipeTitle %>" />
            </div>

            <div class="section description">
                <p><%: RecipeDescription %></p>
            </div>

            <div class="section ingredients">
                <h2>Ingredients</h2>
                <ul>
                    <% foreach (var ingredient in Ingredients) { %>
                        <li><%: ingredient %></li>
                    <% } %>
                </ul>
            </div>

            <div class="section steps">
                <h2>Steps</h2>
                <ol>
                    <% foreach (var step in Steps) { %>
                        <li><%: step %></li>
                    <% } %>
                </ol>
            </div>

            <div class="footer">
                <p>© 2025 Global Kitchen. All Rights Reserved.</p>
            </div>
        </div>
    </form>
</body>
</html>
