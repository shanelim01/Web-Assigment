<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Global_Kitchen.About" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen - About Us</title>
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
                        linear-gradient(rgba(255,255,255,0.8), rgba(255,255,255,0.8)),
                        url('Image/Background.png') center/cover no-repeat;
            padding: 120px 20px 80px;
            position: relative;
            overflow: hidden;
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

        /* === CONTENT SECTIONS === */
        .content-section {
            max-width: 1200px;
            margin: 80px auto;
            padding: 0 20px;
        }

        .section-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: var(--border-radius);
            padding: 50px 40px;
            box-shadow: var(--shadow);
            margin-bottom: 40px;
            animation: fadeInUp 0.8s ease-out;
        }

        .section-title {
            font-size: clamp(1.8rem, 4vw, 2.5rem);
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 20px;
            text-align: center;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .section-subtitle {
            font-size: 1.2rem;
            color: var(--text-light);
            text-align: center;
            margin-bottom: 40px;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .feature-card {
            background: var(--white);
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--shadow);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
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

        .feature-card:hover::before {
            transform: scaleX(1);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-hover);
        }

        .feature-icon {
            display: inline-block;
            width: 50px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            border-radius: 50%;
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .feature-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 15px;
        }

        .feature-description {
            color: var(--text-light);
            line-height: 1.6;
        }

        /* === CONTACT FORM === */
        .contact-form {
            background: var(--white);
            border-radius: var(--border-radius);
            padding: 40px;
            box-shadow: var(--shadow);
            margin-top: 40px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 8px;
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

        .form-textarea {
            min-height: 120px;
            resize: vertical;
        }

        .submit-button {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: var(--white);
            border: none;
            padding: 15px 40px;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .submit-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s;
        }

        .submit-button:hover::before {
            left: 100%;
        }

        .submit-button:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-hover);
            background: linear-gradient(135deg, var(--secondary-color), var(--accent-color));
        }

        /* === TEAM SECTION === */
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .team-member {
            text-align: center;
            background: var(--white);
            border-radius: var(--border-radius);
            padding: 30px;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }

        .team-member:hover {
            transform: translateY(-10px);
            box-shadow: var(--shadow-hover);
        }

        .team-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto 20px;
            border: 4px solid var(--primary-color);
        }

        .team-name {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 10px;
        }

        .team-role {
            color: var(--primary-color);
            font-weight: 600;
            margin-bottom: 15px;
        }

        .team-bio {
            color: var(--text-light);
            font-size: 0.9rem;
            line-height: 1.5;
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
            
            .hero {
                padding: 140px 15px 60px;
            }
            
            .section-card {
                padding: 30px 25px;
            }
            
            .grid-container {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .contact-form {
                padding: 30px 25px;
            }
        }

        @media (max-width: 480px) {
            .section-card {
                padding: 25px 20px;
            }
            
            .contact-form {
                padding: 25px 20px;
            }
            
            .form-input {
                padding: 12px 15px;
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
                <a href="/Home/Login">Login</a>
                <a href="/Home/Admin">Admin</a>
            </nav>
        </header>

        <!-- Hero Section -->
        <section class="hero">
            <div class="hero-content">
                <h1>About Global Kitchen</h1>
                <p>We're passionate about bringing the world's flavors to your kitchen. 
                Join our community of cooking enthusiasts and discover authentic recipes from every corner of the globe.</p>
            </div>
        </section>

        <!-- Mission Section -->
        <div class="content-section">
            <div class="section-card">
                <h2 class="section-title">Our Mission</h2>
                <p class="section-subtitle">Connecting cultures through the universal language of food</p>
                
                <div class="grid-container">
                    <div class="feature-card">
                        <span class="feature-icon">1</span>
                        <h3 class="feature-title">Global Cuisine</h3>
                        <p class="feature-description">Explore authentic recipes from over 50 countries, 
                        each with detailed instructions and cultural context.</p>
                    </div>
                    
                    <div class="feature-card">
                        <span class="feature-icon">2</span>
                        <h3 class="feature-title">Expert Chefs</h3>
                        <p class="feature-description">Learn from professional chefs and home cooks 
                        who share their family recipes and cooking secrets.</p>
                    </div>
                    
                    <div class="feature-card">
                        <span class="feature-icon">3</span>
                        <h3 class="feature-title">Community</h3>
                        <p class="feature-description">Join a vibrant community of food lovers, 
                        share your own recipes, and connect with fellow cooking enthusiasts.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Team Section -->
        <div class="content-section">
            <div class="section-card">
                <h2 class="section-title">Meet Our Team</h2>
                <p class="section-subtitle">The passionate people behind Global Kitchen</p>
                
                <div class="team-grid">
                    <div class="team-member">
                        <img src="/Image/UserImage.jpg" alt="Chef Maria" class="team-avatar" />
                        <h3 class="team-name">Chef Maria Rodriguez</h3>
                        <p class="team-role">Head Chef & Founder</p>
                        <p class="team-bio">With 15 years of experience in international cuisine, 
                        Maria brings authentic flavors from her travels around the world.</p>
                    </div>
                    
                    <div class="team-member">
                        <img src="/Image/UserImage.jpg" alt="Chef David" class="team-avatar" />
                        <h3 class="team-name">Chef David Chen</h3>
                        <p class="team-role">Asian Cuisine Specialist</p>
                        <p class="team-bio">Master of traditional Asian cooking techniques, 
                        David specializes in bringing authentic Asian flavors to your kitchen.</p>
                    </div>
                    
                    <div class="team-member">
                        <img src="/Image/UserImage.jpg" alt="Chef Sarah" class="team-avatar" />
                        <h3 class="team-name">Chef Sarah Johnson</h3>
                        <p class="team-role">Mediterranean Expert</p>
                        <p class="team-bio">Passionate about Mediterranean cuisine, 
                        Sarah shares her family's traditional recipes and modern interpretations.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact Section -->
        <div class="content-section">
            <div class="section-card">
                <h2 class="section-title">Get In Touch</h2>
                <p class="section-subtitle">We'd love to hear from you</p>
                
                <div class="contact-form">
                    <form>
                        <div class="form-group">
                            <label for="name">Full Name</label>
                            <input type="text" id="name" class="form-input" placeholder="Enter your full name" required />
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" class="form-input" placeholder="Enter your email" required />
                        </div>
                        
                        <div class="form-group">
                            <label for="subject">Subject</label>
                            <input type="text" id="subject" class="form-input" placeholder="What's this about?" required />
                        </div>
                        
                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea id="message" class="form-input form-textarea" placeholder="Tell us what's on your mind..." required></textarea>
                        </div>
                        
                        <button type="submit" class="submit-button">Send Message</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Backend Integration Placeholders -->
        <div id="dynamic-content" style="display: none;">
            <!-- Placeholder for dynamic team member data -->
            <div id="team-members-container"></div>
            
            <!-- Placeholder for dynamic contact form submissions -->
            <div id="contact-submissions-container"></div>
            
            <!-- Placeholder for user testimonials -->
            <div id="testimonials-container"></div>
        </div>
    </form>
</body>
</html>
