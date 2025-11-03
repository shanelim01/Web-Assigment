<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
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

        /* === Admin Overview === */
        .admin-section {
            margin: 120px auto 50px;
            max-width: 1200px;
            background: rgba(255, 255, 255, 0.85);
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            padding: 30px 40px;
        }

        .admin-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .admin-header h1 {
            font-size: 32px;
            color: #333;
            margin-bottom: 8px;
        }

        .admin-header p {
            color: #666;
        }

        .admin-pic {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }

        .admin-pic img {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            border: 3px solid rgba(255,255,255,0.8);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .admin-pic img:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 18px rgba(0,0,0,0.25);
        }

        /* === Panels Container === */
        .admin-panels {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 30px;
        }

        .panel {
            flex: 1;
            min-width: 350px;
            background: rgba(255,255,255,0.95);
            border-radius: 16px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.08);
            padding: 25px;
            transition: transform 0.2s ease;
        }

        .panel:hover {
            transform: translateY(-4px);
        }

        .panel h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        /* === Pending Recipes === */
        .pending-recipe {
            background: #fff8ee;
            border-radius: 12px;
            padding: 12px;
            margin-bottom: 12px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.08);
        }

        .pending-recipe h3 {
            margin: 0;
            font-size: 18px;
            color: #333;
        }

        .pending-recipe p {
            margin: 6px 0;
            color: #777;
        }

        .approve-button, .reject-button {
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            margin-right: 10px;
            font-weight: bold;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .approve-button {
            background: linear-gradient(135deg, #4caf50, #81c784);
            color: white;
        }

        .reject-button {
            background: linear-gradient(135deg, #e53935, #ef5350);
            color: white;
        }

        .approve-button:hover, .reject-button:hover {
            transform: scale(1.05);
            box-shadow: 0 3px 8px rgba(0,0,0,0.2);
        }

        /* Account Management Panel */
        .account-form {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-bottom: 15px;
        }

        .account-form input,
        .account-form select {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            background: rgba(255,255,255,0.95);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .account-form input:focus,
        .account-form select:focus {
            border-color: #e67300;
            box-shadow: 0 0 6px rgba(230,115,0,0.3);
        }

        .search-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #e67300, #ffb347);
            cursor: pointer;
            align-self: flex-start;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .search-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        /* User List Display */
        .user-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .user-card {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #fff8ee;
            padding: 10px 15px;
            border-radius: 8px;
            box-shadow: 0 1px 5px rgba(0,0,0,0.08);
        }

        .delete-btn {
            background: linear-gradient(135deg, #e53935, #ef5350);
            color: white;
            border: none;
            border-radius: 6px;
            padding: 6px 14px;
            cursor: pointer;
            font-weight: bold;
            transition: transform 0.2s ease;
        }

        .delete-btn:hover {
            transform: scale(1.05);
        }

        /* Bottom Panels (Popular + Advertisement)*/
        .bottom-column {
            display: flex;
            flex-direction: column;
            gap: 30px;
            margin-top: 40px;
        }

        .bottom-panels {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 40px;
        }


        /* === Popular Category Panel === */
        .chart-box {
            text-align: center;
            background: rgba(255,255,255,0.9);
            padding: 20px;
            border-radius: 12px;
            box-shadow: inset 0 1px 6px rgba(0,0,0,0.1);
        }

        .chart-box p {
            color: #555;
            margin: 6px 0;
        }

        /* === Advertisement Panel === */
        .ad-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 100%;
        }

        .ad-form input[type="file"] {
            padding: 8px;
            background: rgba(255,255,255,0.95);
            border-radius: 8px;
            border: 1px solid #ccc;
            cursor: pointer;
            font-size: 15px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .ad-form input[type="file"]:focus {
            outline: none;
            border-color: #e67300;
            box-shadow: 0 0 6px rgba(230,115,0,0.3);
        }

        .ad-form input,
        .ad-form textarea {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            background: rgba(255,255,255,0.95);
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .ad-form input:focus,
        .ad-form textarea:focus {
            outline: none;
            border-color: #e67300;
            box-shadow: 0 0 6px rgba(230,115,0,0.3);
        }

        .ad-form textarea {
            min-height: 120px;
            resize: vertical;
        }

        .ad-form button {
            margin-top: 10px;
            align-self: center;
            padding: 12px 50px;
            font-size: 18px;
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #ff9800, #ffc107);
            border: none;
            border-radius: 25px;
            cursor: pointer;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.2);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .ad-form button:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
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
                <a href="/Home/Admin">Admin</a>
            </nav>
        </header>

        <section class="admin-section">
            <div class="admin-header">
                <h1>Welcome, Admin!</h1>
                <h1> Johan Welson </h1>
                <p>Here you can review user submissions, view statistics, and post advertisements.</p>
                <div class="admin-pic">
                    <img src="/Image/UserImage.jpg" alt="Admin Profile Picture"/>
                </div>
            </div>

            <div class="admin-panels">
                <!-- Panel 1: Approve Recipes -->
                <div class="panel">
                    <h2>Pending Recipes</h2>

                    <div class="pending-recipe">
                        <h3>Spicy Ramen</h3>
                        <p>By: @Hana | Uploaded: 7 Oct 2025</p>
                        <button class="approve-button">Approve</button>
                        <button class="reject-button">Reject</button>
                    </div>

                    <div class="pending-recipe">
                        <h3>Garlic Butter Shrimp</h3>
                        <p>By: @Luca | Uploaded: 6 Oct 2025</p>
                        <button class="approve-button">Approve</button>
                        <button class="reject-button">Reject</button>
                    </div>
                </div>

                <!-- Panel 2: Account Management -->
                <div class="panel">
                    <h2> Manage User Accounts </h2>
                    <div class="account-form">
                        <label> Search by Name</label>
                        <input type="text" placeholder="Enter username..." />

                        <label> Filter by Country </label>
                        <select>
                            <option value=""> Select Country </option>
                            <option value="Malaysia"> Malaysia </option>
                            <option value="Singapore"> Singapore </option>
                            <option value="Japan"> Japan </option>
                            <option value="German"> German </option>
                            <option value="Cina"> Cina </option>
                            <option value="Korea"> Korea </option>

                        </select>
                        
                        <button type="button" class="search-btn"> Search </button>
                    </div>

                    <div class="user-list">
                        <div class="user-card">
                            <p><strong>@EmilyTan</strong> - Malaysia</p>
                            <button class="delete-btn"> Delete </button>
                        </div>
                        <div class="user-card">
                            <p><strong>@Kenta Mentori</strong> - Japan</p>
                            <button class="delete-btn"> Delete </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Panel 3: Popular Categories -->
            <div class="bottom-column">
                <div class="panel">
                    <h2>Most Popular Recipe Type</h2>
                    <div class="chart-box">
                        <p>#1 🍝 Italian Cuisine — 345 Likes</p>
                        <p>#2 🍜 Asian Cuisine — 289 Likes</p>
                        <p>#3 🥗 Healthy Meals — 203 Likes</p>
                    </div>
                </div>

                <!-- Panel 4: Advertisement -->
                <div class="panel">
                    <h2>Post Advertisement</h2>
                    <div class="ad-form">
                        <label>Upload Advertisement Image</label>
                        <input type="file" accept="image/*" required />

                        <input type="text" placeholder="Ad Title (e.g., New Cooking Challenge)" required />
                        <textarea placeholder="Write your announcement or promotional content..." required></textarea>

                        <button type="submit">Publish Ad</button>
                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
