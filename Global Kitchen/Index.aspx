<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Global_Kitchen.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body, html {
            margin: 0;
            height: 100vh;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            font-family: Arial, sans-serif;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            background: rgba(255,255,255,0.7);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            box-sizing: border-box;
        }

        /* Logo area */
        .logo-area {
            display: flex;
            align-items: center;
        }

        .logo {
            height: 40px;
            margin-right: 10px;
        }

        /* title area */
        .title-area{
            text-align: center;
            flex: 1;
        }

        .site-title {
           font-size: 50px;
           font-weight: bold;
           color: #333;
           margin: 0;
           flex: 1;
           text-align: center;
        }

        .subscript-text{
            font-size: 20px;
            color: #555;
            margin: 0;
            margin-top: 3px;
        }

        /* Navigation Bar */
        .nav-links a {
           margin-left: 20px;
           text-decoration: none;
           color: #333;
           font-weight: 500;
        }

        .nav-links a:hover {
            color: #e67300; 
        }

        /* --- Responsive --- */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: center;
                padding: 10px 0;
            }

            .header img {
                height: 120px;
                width: auto;
            }

            .site-title {
                font-size: 32px;
            }

            .subscript-text {
                font-size: 16px;
            }

            .nav-links {
                display: flex;
                flex-direction: column;
                gap: 10px;
                margin-top: 10px;
            }

            .nav-links a {
                font-size: 18px;
                margin: 0;
            }
        }

        @media (max-width: 480px) {
            .site-title {
                font-size: 26px;
            }

            .header img {
                height: 90px;
            }

            .subscript-text {
                font-size: 14px;
            }

            .nav-links a {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="navbar">
            <div class="header">
                <img src="Image/Logo.png"
                    alt="Global Kitchen Logo"
                    style="height: 168px; width: 201px" />
            </div>

            <div class="title-area">
                <h1 class="site-title"> Global Kitchen </h1>
                <p class="subscript-text"> Cooking lessons across cultures </p>
            </div>

            <nav class="nav-links">
                <a href="Index.aspx"> Home </a>
                <a href="Recipes.aspx"> Recipes </a>
                <a href="UserPage.aspx"> Profile </a>
                <a href="login.aspx"> Login </a>
            </nav>
        </header>
     </form>
</body>
</html>