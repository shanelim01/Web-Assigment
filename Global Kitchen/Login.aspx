<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Global_Kitchen.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f5f5f5;
        }

        .login-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 400px;
            padding: 0 20px;
        }

        .logo {
            width: 500px;
            max-width: 70%;
            margin-bottom: 20px;
        }

        .login-container {
            background: white;
            padding: 2rem 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            width: 100%;
            text-align: center;
        }

        .login-container input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .login-container button {
            width: 100%;
            padding: 15px 0;
            font-size: 18px;
            color: white;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }

        .login-container button:hover {
            background: #cc6600;
        }

        .login-container p {
            margin-top: 12px;
            font-size: 14px;
            color: #555;
        }

        .login-container a {
            color: #e67300;
            text-decoration: none;
            font-weight: bold;
        }

        .login-container a:hover {
            text-decoration: underline;
        }

        /* Mobile adjustments */
        @media (max-width: 480px) {
            .login-container {
                padding: 1.5rem 1rem;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            }

            .login-container h1 {
                font-size: 22px;
            }

            .logo {
                width: 160px;
                margin-bottom: 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-wrapper">
            <img src="Image/logo.png" alt="Logo" class="logo" />

            <div class="login-container">
                <input type="text" placeholder="User Name" required/>
                <input type="password" placeholder="Password" required/>
                <button type="submit">Login</button>
                <p>Don't Have Account? <a href="Register.aspx">Register Here</a></p>
                <p>Continue Browsing <a href="Index.aspx">Home Page Here</a></p>
            </div>

        </div>
    </form>
</body>
</html>
