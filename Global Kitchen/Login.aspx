<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Global Kitchen - Login</title>

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
            font-family: 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
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

        .login-wrapper {
            position: relative;
            width: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, rgba(255, 107, 53, 0.1), rgba(247, 147, 30, 0.1));
            padding-top: 120px;
        }

        .background-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
            opacity: 0.3;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: var(--shadow-hover);
            width: 100%;
            max-width: 400px;
            text-align: center;
            position: relative;
            animation: slideInUp 0.8s ease-out;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-header {
            margin-bottom: 30px;
        }

        .login-title {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 10px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .login-subtitle {
            color: var(--text-light);
            font-size: 1rem;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e1e8ed;
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: var(--transition);
            background: var(--white);
            outline: none;
        }

        .form-input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(255, 107, 53, 0.1);
            transform: translateY(-2px);
        }

        .form-input::placeholder {
            color: var(--text-light);
            font-weight: 500;
        }

        .login-button {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            border: none;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 25px;
        }

        .login-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s;
        }

        .login-button:hover::before {
            left: 100%;
        }

        .login-button:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-hover);
            background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
        }

        .login-button:active {
            transform: translateY(-1px);
        }

        .login-links {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 20px;
        }

        .login-links p {
            color: var(--text-light);
            font-size: 0.9rem;
            margin: 0;
        }

        .login-links a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            position: relative;
        }

        .login-links a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary-color);
            transition: width 0.3s ease;
        }

        .login-links a:hover::after {
            width: 100%;
        }

        .login-links a:hover {
            color: var(--secondary-color);
            transform: translateX(5px);
        }


        /* === RESPONSIVE DESIGN === */
        @media (max-width: 768px) {
            .login-wrapper {
                padding-top: 140px;
            }

            .login-container {
                margin: 20px;
                padding: 40px 30px;
                max-width: 350px;
            }
            
            .login-title {
                font-size: 2rem;
            }

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
        }

        @media (max-width: 480px) {
            .login-container {
                margin: 15px;
                padding: 30px 25px;
            }
            
            .login-title {
                font-size: 1.8rem;
            }
            
            .form-input {
                padding: 12px 15px;
            }
            
            .login-button {
                padding: 12px;
                font-size: 1rem;
            }
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
                <a href="/Home/Login" class="active">Login</a>
                <a href="/Home/Register">Register</a>
                <a href="/Home/Admin">Admin</a>
            </nav>
        </header>

        <div class="login-wrapper">
            <img alt="Background" 
                src="/Image/Login%20Page.png" 
                class="background-image"/>

            <div class="login-container">
                <div class="login-header">
                    <h1 class="login-title">Welcome Back</h1>
                    <p class="login-subtitle">Sign in to your Global Kitchen account</p>
                </div>

                <div class="form-group">
                    <input type="text" class="form-input" placeholder="Username or Email" required/>
                </div>

                <div class="form-group">
                    <input type="password" class="form-input" placeholder="Password" required/>
                </div>

                <button type="submit" class="login-button">Sign In</button>

                <div class="login-links">
                    <p>Don't have an account? <a href="/Home/Register">Create one here</a></p>
                    <p>Continue browsing <a href="/">Return to Home</a></p>
                </div>
            </div>
        </div>

        <!-- Backend Integration Placeholders -->
        <div id="dynamic-content" style="display: none;">
            <!-- Placeholder for user authentication -->
            <div id="auth-service-container"></div>
            
            <!-- Placeholder for session management -->
            <div id="session-container"></div>
            
            <!-- Placeholder for user profile data -->
            <div id="user-profile-container"></div>
            
            <!-- Placeholder for login validation -->
            <div id="validation-container"></div>
        </div>
    </form>
</body>
</html>
