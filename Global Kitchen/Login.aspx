<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Global_Kitchen.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Global Kitchen - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        html, body, form {
            margin: 0;
            padding: 0;
            width: 100%;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .login-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 90%;
            max-width: 400px;
            padding: 0 15px;
        }

        .logo {
            width: 60%;
            max-width: 300px;
            margin-bottom: 20px;
        }

        .login-container {
            width: 100%;
            background: white;
            border-radius: 12px;
            padding: 2rem 1.5rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            text-align: center;
        }

        .login-container input {
            width: 100%;
            padding: 14px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .login-container button {
            width: 100%;
            padding: 16px 0;
            font-size: 18px;
            color: white;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: 0.2s;
        }

        .login-container button:hover {
            background: #cc6600;
        }

        .login-container p {
            font-size: 15px;
            color: #555;
            margin-top: 12px;
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
=======
        @media (max-width: 768px) {
            .login-wrapper {
                width: 95%;
                max-width: none;
            }

            .logo {
                width: 80vw;
                max-width: none;
            }

            .login-container {
                padding: 2.5rem 2rem;
            }

            .login-container input {
                font-size: 20px;
                padding: 18px;
            }

            .login-container button {
                font-size: 22px;
                padding: 20px 0;
            }

            .login-container p {
                font-size: 18px;
            }

        @media (max-width: 480px) {
            .login-wrapper{
                width: 95%;
                max-width: none;
            }

            .logo {
                width: 90vw;
            }

            .login-container input {
                padding: 20px;
                font-size: 22px;
            }

            .login-container button {
                padding: 22px 0;
                font-size: 24px;
            }

            .login-container p {
                font-size: 20px;
>>>>>>> Stashed changes
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
