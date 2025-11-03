s<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Global_Kitchen.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen - Register Page</title>
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

        .register-wrapper {
            min-height: 100vh;
            padding: 20px;
            padding-top: 120px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .header-section {
            text-align: center;
            margin-bottom: 40px;
            animation: fadeInDown 1s ease-out;
            display: none;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logo {
            margin-bottom: 20px;
        }

        .logo img {
            width: 200px;
            height: auto;
            transition: var(--transition);
        }

        .logo img:hover {
            transform: scale(1.05);
        }

        .tagline {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            padding: 30px;
            max-width: 800px;
            box-shadow: var(--shadow);
            margin-bottom: 40px;
        }

        .tagline h1 {
            font-size: clamp(1.8rem, 4vw, 2.5rem);
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 15px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .tagline h2 {
            font-size: clamp(1rem, 2.5vw, 1.2rem);
            color: var(--text-light);
            line-height: 1.6;
        }

        .features {
            text-align: center;
            padding: 50px 20px;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            max-width: 1200px;
            margin: 0 auto 40px;
            box-shadow: var(--shadow);
            animation: fadeInUp 1.2s ease-out;
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

        .features h1 {
            font-size: clamp(1.8rem, 4vw, 2.2rem);
            font-weight: 800;
            margin-bottom: 15px;
            color: var(--text-dark);
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .features .subtitle {
            font-size: 1.1rem;
            color: var(--text-light);
            margin-bottom: 40px;
        }

        .feature-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .card {
            background: var(--white);
            border-radius: var(--border-radius);
            padding: 30px 20px;
            box-shadow: var(--shadow);
            transition: var(--transition);
            animation: slideInUp 1s ease-out forwards;
            opacity: 0;
            position: relative;
            overflow: hidden;
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            transform: scaleX(0);
            transition: transform 0.3s ease;
        }

        .card:hover::before {
            transform: scaleX(1);
        }

        .card img {
            width: 120px;
            height: 120px;
            object-fit: cover;
            border-radius: 50%;
            display: block;
            margin: 0 auto 20px;
            transition: var(--transition);
        }

        .card:hover img {
            transform: scale(1.1);
        }

        .card h2 {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--text-dark);
        }

        .card p {
            font-size: 0.95rem;
            color: var(--text-light);
            line-height: 1.6;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-hover);
        }

        .card:nth-child(1) { animation-delay: 0.2s; }
        .card:nth-child(2) { animation-delay: 0.4s; }
        .card:nth-child(3) { animation-delay: 0.6s; }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .regis-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: var(--shadow-hover);
            width: 100%;
            max-width: 500px;
            margin: 40px auto;
            animation: slideInUp 1s ease-out;
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-title {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 10px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .form-subtitle {
            color: var(--text-light);
            font-size: 1rem;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 8px;
            font-size: 0.9rem;
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

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .gender-section {
            margin: 20px 0;
        }

        .gender-options {
            display: flex;
            gap: 20px;
            margin-top: 10px;
        }

        .gender-option {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 12px 20px;
            border: 2px solid #e1e8ed;
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            flex: 1;
            justify-content: center;
        }

        .gender-option:hover {
            border-color: var(--primary-color);
            background: rgba(255, 107, 53, 0.05);
        }

        .gender-option input[type="radio"] {
            accent-color: var(--primary-color);
            transform: scale(1.2);
        }

        .gender-option input[type="radio"]:checked + label {
            color: var(--primary-color);
            font-weight: 600;
        }

        .gender-option label {
            margin: 0;
            cursor: pointer;
            font-weight: 500;
        }

        .register-button {
            width: 100%;
            padding: 18px;
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
            margin: 30px 0 20px;
        }

        .register-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s;
        }

        .register-button:hover::before {
            left: 100%;
        }

        .register-button:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-hover);
            background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
        }

        .form-links {
            text-align: center;
            margin-top: 20px;
        }

        .form-links p {
            color: var(--text-light);
            font-size: 0.9rem;
            margin: 10px 0;
        }

        .form-links a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            position: relative;
        }

        .form-links a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary-color);
            transition: width 0.3s ease;
        }

        .form-links a:hover::after {
            width: 100%;
        }

        .form-links a:hover {
            color: var(--secondary-color);
        }

        /* === RESPONSIVE DESIGN === */
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

            .register-wrapper {
                padding: 15px;
                padding-top: 140px;
            }
            
            .tagline {
                padding: 20px;
                margin-bottom: 30px;
            }
            
            .features {
                padding: 30px 15px;
            }
            
            .feature-cards {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .regis-container {
                padding: 30px 25px;
                margin: 20px auto;
            }
            
            .form-row {
                grid-template-columns: 1fr;
                gap: 15px;
            }
            
            .gender-options {
                flex-direction: column;
                gap: 10px;
            }
        }

        @media (max-width: 480px) {
            .regis-container {
                padding: 25px 20px;
            }
            
            .form-title {
                font-size: 1.6rem;
            }
            
            .form-input {
                padding: 12px 15px;
            }
            
            .register-button {
                padding: 15px;
                font-size: 1rem;
            }
        }

        @media (max-width: 768px) {
            .tagline h1 { font-size: 22px; }
            .tagline h2 { font-size: 15px; }
            .feature-cards { flex-direction: column; align-items: center; }
            .card { width: 90%; }
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
                <a href="/Home/Login">Login</a>
            </nav>
        </header>

        <div class="register-wrapper">
            <img alt="Background"
                src="/Image/Background.png"
                style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover; z-index: -1;"/>

            <div class="features">
                <h1>Why Join Global Kitchen?</h1>
                <p class="subtitle">Discover amazing features that will transform your cooking journey</p>
                
                <div class="feature-cards">
                    <div class="card">
                        <img src="/Image/Picture.png" alt="Personalized Learning" />
                        <h2>Personalized Learning</h2>
                        <p>Get course recommendations based on your tastes and cooking level.</p>
                    </div>

                    <div class="card">
                        <img src="/Image/Picture2.png" alt="Save Favorites" />
                        <h2>Save Favorites</h2>
                        <p>Save your favorite cooking tutorials and recipes for quick reference and easy access, creating your own delicious recipe list.</p>
                    </div>

                    <div class="card">
                        <img src="/Image/Picture3.jpg" alt="Personal Tutorial" />
                        <h2>Add a Personal Tutorial</h2>
                        <p>Upload your signature dishes to the platform so more people can learn and appreciate your delicious creations.</p>
                    </div>
                </div>
            </div>

            <div class="regis-container">
                <div class="form-header">
                    <h1 class="form-title">Create Account</h1>
                    <p class="form-subtitle">Join thousands of cooking enthusiasts worldwide</p>
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" class="form-input" placeholder="Enter your username" required/>
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" class="form-input" placeholder="Enter your email" required/>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="birthday">Birthday</label>
                        <input type="date" id="birthday" class="form-input" required />
                    </div>

                    <div class="form-group">
                        <label for="country">Country</label>
                        <select id="country" class="form-input" required>
                            <option value="">Select Country</option>
                            <option value="Malaysia">Malaysia</option>
                            <option value="Singapore">Singapore</option>
                            <option value="Japan">Japan</option>
                            <option value="Germany">Germany</option>
                            <option value="China">China</option>
                            <option value="Korea">Korea</option>
                        </select>
                    </div>
                </div>

                <div class="gender-section">
                    <label>Gender</label>
                    <div class="gender-options">
                        <div class="gender-option">
                            <input type="radio" id="male" name="gender" value="Male" required />
                            <label for="male">Male</label>
                        </div>
                        <div class="gender-option">
                            <input type="radio" id="female" name="gender" value="Female" />
                            <label for="female">Female</label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" class="form-input" placeholder="Create a strong password" required/>
                </div>
                
                <button type="submit" class="register-button">Create Account</button>

                <div class="form-links">
                    <p>Already have an account? <a href="/Home/Login">Sign in here</a></p>
                    <p>Continue browsing <a href="/">Return to Home</a></p>
                </div>
            </div>
        </div>

        <!-- Backend Integration Placeholders -->
        <div id="dynamic-content" style="display: none;">
            <!-- Placeholder for user registration -->
            <div id="registration-service-container"></div>
            
            <!-- Placeholder for form validation -->
            <div id="form-validation-container"></div>
            
            <!-- Placeholder for user data storage -->
            <div id="user-data-container"></div>
            
            <!-- Placeholder for email verification -->
            <div id="email-verification-container"></div>
        </div>
    </form>
</body>
</html>
