<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstPage.aspx.cs" Inherits="Global_Kitchen.FirstPage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <title>Global Kitchen</title>

    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #f5f5dc, #f0e6d2, #e6d8b8);
            font-family: 'Segoe UI', Arial, sans-serif;
            color: #333;
            text-align: center;
        }

        .logo {
            width: 500px;
            height: auto;
            margin-bottom: 20px;
            animation: float 3s ease-in-out infinite;
        }

        h1 {
            font-size: 48px;
            font-weight: bold;
            margin: 10px 0;
            color: #2c2c2c;
        }

        p {
            font-size: 20px;
            color: #555;
            margin-bottom: 60px;
        }

        button {
            padding: 15px 40px;
            font-size: 20px;
            color: white;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            border: none;
            border-radius: 30px;
            cursor: pointer;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.3);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        button:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 20px rgba(0,0,0,0.5);
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        @media (max-width: 768px) {
            h1 { font-size: 36px; }
            p { font-size: 18px; }
            .logo { width: 220px; }
            button {
                padding: 12px 30px;
                font-size: 18px;
            }
        }

        @media (max-width: 480px) {
            h1 { font-size: 28px; }
            p { font-size: 16px; }
            .logo { width: 160px; }
            button {
                padding: 10px 25px;
                font-size: 16px;
            }
        }
    </style>
</head>

<body>
    <img class="logo" src="Image/Logo.png" alt="Global Kitchen Logo" />
    <h1>Welcome to Global Kitchen</h1>
    <p>Cooking lessons across cultures — learn, share, and taste the world.</p>

    <a href="Index.aspx">
        <button>Get Started</button>
    </a>
</body>
</html>
