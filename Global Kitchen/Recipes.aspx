<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Global Kitchen - Recipes</title>

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

        /* === SEARCH BAR === */
        .search-section {
            margin-top: 120px;
            padding: 40px 20px;
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            margin-bottom: 40px;
        }

        .search-title {
            font-size: clamp(1.8rem, 4vw, 2.5rem);
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 15px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .search-subtitle {
            color: var(--text-light);
            font-size: 1.1rem;
            margin-bottom: 30px;
        }

        .search-container {
            max-width: 600px;
            margin: 0 auto;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 18px 25px;
            border: 2px solid #e1e8ed;
            border-radius: 50px;
            font-size: 1.1rem;
            transition: var(--transition);
            background: var(--white);
            outline: none;
            padding-right: 70px;
        }

        .search-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(255, 107, 53, 0.1);
            transform: translateY(-2px);
        }

        .search-input::placeholder {
            color: var(--text-light);
            font-weight: 500;
        }

        .search-button {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            padding: 12px 25px;
            border-radius: 50px;
            border: none;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            font-weight: 700;
            cursor: pointer;
            transition: var(--transition);
            font-size: 1rem;
        }

        .search-button:hover {
            transform: translateY(-50%) scale(1.05);
            box-shadow: var(--shadow-hover);
            background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
        }

        /* === LAYOUT === */
        .content-wrapper {
            display: grid;
            grid-template-columns: 300px 1fr;
            gap: 40px;
            margin: 0 auto;
            max-width: 1400px;
            padding: 0 20px;
        }

        /* === SIDEBAR === */
        .sidebar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--shadow);
            height: fit-content;
            position: sticky;
            top: 120px;
        }

        .sidebar h3 {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--primary-color);
        }

        .filter-group {
            margin-bottom: 25px;
        }

        .filter-group label {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 12px 0;
            cursor: pointer;
            transition: var(--transition);
            padding: 8px 12px;
            border-radius: var(--border-radius);
        }

        .filter-group label:hover {
            background: rgba(255, 107, 53, 0.1);
            color: var(--primary-color);
        }

        .filter-group input[type="checkbox"] {
            accent-color: var(--primary-color);
            transform: scale(1.2);
        }

        .filter-select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #e1e8ed;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: var(--transition);
            background: var(--white);
            outline: none;
        }

        .filter-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(255, 107, 53, 0.1);
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
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--shadow);
            animation: fadeInUp 0.8s ease-out;
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

        .section-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .section-title {
            font-size: clamp(1.5rem, 3vw, 2rem);
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 10px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .section-subtitle {
            color: var(--text-light);
            font-size: 1rem;
        }

        .recipe-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-top: 20px;
        }

        .recipe-card {
            background: var(--white);
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--shadow);
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

        .recipe-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: var(--transition);
        }

        .recipe-card:hover .recipe-image {
            transform: scale(1.05);
        }

        .recipe-content {
            padding: 20px;
            position: relative;
            z-index: 2;
        }

        .recipe-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 10px;
        }

        .recipe-description {
            color: var(--text-light);
            font-size: 0.95rem;
            line-height: 1.5;
            margin-bottom: 15px;
        }

        .recipe-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 0.85rem;
            color: var(--text-light);
        }

        .recipe-rating {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .recipe-time {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        /* === RESPONSIVE DESIGN === */
        @media (max-width: 1024px) {
            .content-wrapper {
                grid-template-columns: 250px 1fr;
                gap: 30px;
            }
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                padding: 15px 20px;
                gap: 15px;
            }
            
            .navbar .header img {
                height: 50px;
            }
            
            .navbar .nav-links {
                gap: 10px;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .navbar .nav-links a {
                padding: 8px 12px;
                font-size: 0.85rem;
            }

            .content-wrapper {
                grid-template-columns: 1fr;
                gap: 30px;
            }
            
            .sidebar {
                position: static;
                order: 2;
            }
            
            .main-content {
                order: 1;
            }
            
            .search-section {
                padding: 30px 15px;
            }
            
            .recipe-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }
        }

        @media (max-width: 480px) {
            .content-wrapper {
                padding: 0 15px;
            }
            
            .search-section {
                padding: 20px 10px;
            }
            
            .recipe-grid {
                grid-template-columns: 1fr;
            }
            
            .recipe-section {
                padding: 20px;
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
                <a href="/Home/Recipes" class="active">Recipes</a>
                <a href="/Home/About">About</a>
                <a href="/Home/UserPage">Profile</a>
                <a href="/Home/Login">Login</a>
                <a href="/Home/Register">Register</a>
                <a href="/Home/Admin">Admin</a>
            </nav>
        </header>

        <!-- Search Section -->
        <div class="search-section">
            <h1 class="search-title">Discover Amazing Recipes</h1>
            <p class="search-subtitle">Find your next favorite dish from around the world</p>
            <div class="search-container">
                <input type="text" class="search-input" placeholder="Search recipes, cuisines, or chefs..." />
                <button type="button" class="search-button">Search</button>
            </div>
        </div>

        <!-- Content Layout -->
        <div class="content-wrapper">
            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="filter-group">
                    <h3>Filter by Ingredients</h3>
                    <label><input type="checkbox" /> Chicken</label>
                    <label><input type="checkbox" /> Beef</label>
                    <label><input type="checkbox" /> Vegetables</label>
                    <label><input type="checkbox" /> Seafood</label>
                    <label><input type="checkbox" /> Pasta</label>
                    <label><input type="checkbox" /> Rice</label>
                </div>

                <div class="filter-group">
                    <h3>Country</h3>
                    <select class="filter-select">
                        <option value="">Select Country</option>
                        <option>Japan</option>
                        <option>Italy</option>
                        <option>France</option>
                        <option>Malaysia</option>
                        <option>Mexico</option>
                        <option>India</option>
                        <option>Thailand</option>
                    </select>
                </div>

                <div class="filter-group">
                    <h3>Difficulty</h3>
                    <label><input type="checkbox" /> Beginner</label>
                    <label><input type="checkbox" /> Intermediate</label>
                    <label><input type="checkbox" /> Advanced</label>
                </div>
            </aside>

            <!-- Main Content -->
            <main class="main-content">
                <section class="recipe-section">
                    <div class="section-header">
                        <h2 class="section-title">Trending Recipes</h2>
                        <p class="section-subtitle">What's popular right now</p>
                    </div>
                    <div class="recipe-grid">
                        <div class="recipe-card">
                            <img src="/Image/JapaneseSushi.jpg" alt="Sushi" class="recipe-image" />
                            <div class="recipe-content">
                                <h4 class="recipe-title">Classic Sushi Rolls</h4>
                                <p class="recipe-description">Perfectly rolled with fresh fish and rice. Learn the art of Japanese sushi making.</p>
                                <div class="recipe-meta">
                                    <div class="recipe-rating">Rating: 4.8</div>
                                    <div class="recipe-time">Time: 45 min</div>
                                </div>
                            </div>
                        </div>

                        <div class="recipe-card">
                            <img src="/Image/ItalianPasta.jpg" alt="Pasta" class="recipe-image" />
                            <div class="recipe-content">
                                <h4 class="recipe-title">Spaghetti Carbonara</h4>
                                <p class="recipe-description">Creamy sauce with crispy pancetta. Authentic Italian comfort food.</p>
                                <div class="recipe-meta">
                                    <div class="recipe-rating">Rating: 4.9</div>
                                    <div class="recipe-time">Time: 30 min</div>
                                </div>
                            </div>
                        </div>

                        <div class="recipe-card">
                            <img src="/Image/FrenchPastry.jpg" alt="Pastry" class="recipe-image" />
                            <div class="recipe-content">
                                <h4 class="recipe-title">French Croissants</h4>
                                <p class="recipe-description">Buttery, flaky layers that melt in your mouth. Master the art of French baking.</p>
                                <div class="recipe-meta">
                                    <div class="recipe-rating">Rating: 4.7</div>
                                    <div class="recipe-time">Time: 3 hours</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="recipe-section">
                    <div class="section-header">
                        <h2 class="section-title">Today's Recommendation</h2>
                        <p class="section-subtitle">Perfect for today's cooking mood</p>
                    </div>
                    <div class="recipe-grid">
                        <div class="recipe-card">
                            <img src="/Image/ItalianPasta.jpg" alt="Special Dish" class="recipe-image" />
                            <div class="recipe-content">
                                <h4 class="recipe-title">Mediterranean Quinoa Bowl</h4>
                                <p class="recipe-description">Fresh, healthy, and packed with Mediterranean flavors. Perfect for a nutritious meal.</p>
                                <div class="recipe-meta">
                                    <div class="recipe-rating">Rating: 4.9</div>
                                    <div class="recipe-time">Time: 20 min</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>

        <!-- Backend Integration Placeholders -->
        <div id="dynamic-content" style="display: none;">
            <!-- Placeholder for dynamic recipe data from database -->
            <div id="recipe-database-container"></div>
            
            <!-- Placeholder for user favorites -->
            <div id="user-favorites-container"></div>
            
            <!-- Placeholder for search results -->
            <div id="search-results-container"></div>
            
            <!-- Placeholder for filter state -->
            <div id="filter-state-container"></div>
            
            <!-- Placeholder for user ratings and reviews -->
            <div id="ratings-reviews-container"></div>
        </div>
    </form>
</body>
</html>
